import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:election/components/custom_grid_tile.dart';
import 'package:election/components/custom_text_button.dart';
import 'package:election/constants/constants.dart';
import 'package:election/constants/styles.dart';
import 'package:election/providers/candidate_provider.dart';

class VotingScreen extends StatelessWidget {
  static const routeName = '/VotingScreen';
  const VotingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
          padding: Styles.pagePadding,
          child: Column(
            children: const [
              // Vote Selection Section
              CandidatesGridArea(),

              // Quick Guide Section
              QuickGuideArea(),

              // Buttons
              ButtonArea(),
            ],
          )),
    ));
  }
}

// Vote Selection Area
class CandidatesGridArea extends StatelessWidget {
  const CandidatesGridArea({super.key});

  @override
  Widget build(BuildContext context) {
    final candidateList = Provider.of<CandidateProvider>(context, listen: false).candidateList;
    return Expanded(
      child: GridView.builder(
        itemCount: candidateList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.75,
        ),
        itemBuilder: (ctx, index) {
          return CustomGridTile(
            candidateId: candidateList[index].id.toString(),
          );
        },
      ),
    );
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
class ButtonArea extends StatelessWidget {
  const ButtonArea({super.key});

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
          onPressed: () {
            // TODO: Implementation left
          },
        ),
      ],
    );
  }
}
