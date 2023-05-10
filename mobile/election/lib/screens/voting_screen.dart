import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:election/providers/candidate_provider.dart';

import 'package:election/exceptions/http_exception.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:heroicons/heroicons.dart';

import 'package:election/components/candidate_grid_tile.dart';
import 'package:election/components/custom_snack_bar.dart';
import 'package:election/components/custom_text_button.dart';
import 'package:election/constants/constants.dart';
import 'package:election/constants/styles.dart';
import 'package:election/components/custom_dialog.dart';

class VotingScreen extends StatelessWidget {
  static const routeName = '/VotingScreen';
  const VotingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final extractedData =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
        body: SafeArea(
      child: Padding(
          padding: Styles.pagePadding,
          child: Column(
            children: [
              // Vote Selection Section
              CandidatesGridArea(
                electionId: extractedData['electionId'].toString(),
              ),

              // Quick Guide Section
              const QuickGuideArea(),

              // Buttons
              ButtonArea(
                electionId: extractedData['electionId'].toString(),
                token: extractedData['token'].toString(),
              ),
            ],
          )),
    ));
  }
}

// Vote Selection Area
class CandidatesGridArea extends StatefulWidget {
  final String electionId;
  const CandidatesGridArea({
    Key? key,
    required this.electionId,
  }) : super(key: key);

  @override
  State<CandidatesGridArea> createState() => _CandidatesGridAreaState();
}

class _CandidatesGridAreaState extends State<CandidatesGridArea> {
  bool isInit = true;
  @override
  void didChangeDependencies() {
    if (isInit) {
      final electionId = widget.electionId;
      print('election id = $electionId');

      fetchCandidateList =
          Provider.of<CandidateProvider>(context, listen: false)
              .fetchCandidates(electionId.toString())
              .catchError((e) {
        print(e);
      });
      isInit = false;
    }

    super.didChangeDependencies();
  }

  late Future fetchCandidateList;
  @override
  Widget build(BuildContext context) {
    final candidateList = Provider.of<CandidateProvider>(context).candidateList;
    return FutureBuilder(
        future: fetchCandidateList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // TODO: Handle error
            if (snapshot.hasError) {
              print(snapshot.error);
            }
            return candidateList.isEmpty
                ? const Expanded(
                    child: Center(
                    child: Text(
                      'NO ELECTION CAMPAIGN IN THIS AREA',
                      style: Styles.labelStyle,
                    ),
                  ))
                : Expanded(
                    child: GridView.builder(
                      itemCount: candidateList.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 0.75,
                      ),
                      itemBuilder: (ctx, index) {
                        return CustomGridTile(
                          candidateId:
                              candidateList[index].candidateId.toString(),
                        );
                      },
                    ),
                  );
          }
          return const Expanded(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}

// Quick Guide Section
class QuickGuideArea extends StatelessWidget {
  const QuickGuideArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          color: const Color(0XFFE6E6E6),
          borderRadius: BorderRadius.circular(10)),
      child:
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
        Text(
          'A QUICK GUIDE !',
          style: TextStyle(
            color: Colors.red,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          quickGuide,
          style: TextStyle(
            color: Color(0XFF4B4B4B),
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ]),
    );
  }
}

// Button Section
// Contains RESET and VOTE buttons
class ButtonArea extends StatefulWidget {
  String electionId;
  String token;
  ButtonArea({
    Key? key,
    required this.electionId,
    required this.token,
  }) : super(key: key);

  @override
  State<ButtonArea> createState() => _ButtonAreaState();
}

class _ButtonAreaState extends State<ButtonArea> {
  void submitVote() async {
    final candidateProviderData =
        Provider.of<CandidateProvider>(context, listen: false);
    if (candidateProviderData.voteOrder.isEmpty) {
      showSnackBarWidget(
          ctx: context,
          message:
              'No Votes Were Selected Or No Election Campaign In The This Area',
          duration: const Duration(seconds: 2));
      return;
    }
    candidateProviderData.resetTheVoteOrder();
    // Displaying loading Spinner
    customShowDialog(context, 'CASTING VOTE',
        const SpinKitPouringHourGlass(color: Color(0xFF082585)));
    try {
      // Submitting vote order
      await candidateProviderData.submitTheVoteOrder(
          widget.electionId, widget.token);
      Navigator.of(context).pop();
      // ignore: use_build_context_synchronously
      customShowDialog(
          context,
          'Vote Casted Successfully',
          const HeroIcon(
            HeroIcons.check,
            color: Color(0xFF082585),
            size: 80,
          ),
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Close')));
    } on HttpException catch (e) {
      Navigator.of(context).pop();
      customShowDialog(
          context,
          e.toString(),
          const HeroIcon(
            HeroIcons.xMark,
            color: Color(0xFF082585),
            size: 80,
          ),
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Close', style: Styles.buttonStyle)));
      // showSnackBarWidget(ctx: context, message: e.toString());
    } catch (e) {
      Navigator.of(context).pop();
      customShowDialog(
          context,
          'Casting Vote Failed',
          const HeroIcon(
            HeroIcons.xMark,
            color: Color(0xFF082585),
            size: 80,
          ),
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Close',
                style: Styles.buttonStyle,
              )));
      //showSnackBarWidget(ctx: context, message: e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    final candidateData =
        Provider.of<CandidateProvider>(context, listen: false);

    return Row(
      children: [
        CustomTextButton(
          title: 'RESET',
          backgroundColor: Colors.grey,
          textColor: Colors.black,
          onPressed: candidateData.resetTheVoteOrder,
        ),
        const Spacer(),
        CustomTextButton(
          title: 'VOTE',
          onPressed: submitVote,
        ),
      ],
    );
  }
}
