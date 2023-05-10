import 'package:election/providers/election_provider.dart';
import 'package:election/screens/credential_selection_screen.dart';
import 'package:flutter/material.dart';

import 'package:election/constants/styles.dart';
import 'package:election/constants/constants.dart';
import 'package:provider/provider.dart';

class ElectionScreen extends StatefulWidget {
  static const routeName = '/ElectionPage';
  const ElectionScreen({Key? key}) : super(key: key);

  @override
  State<ElectionScreen> createState() => _ElectionScreenState();
}

class _ElectionScreenState extends State<ElectionScreen> {
  @override
  Widget build(BuildContext context) {
    final extractedData =
        ModalRoute.of(context)!.settings.arguments as Map<String, String?>;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: Styles.pagePadding,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: tabItem('Ongoing Elections', true)),
                  const SizedBox(
                    width: 8.0,
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Expanded(
                child: FutureBuilder(
                    future: Provider.of<ElectionProvider>(context)
                        .fetchElectionCampaign(
                            extractedData['areaId'].toString()),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.hasError) {
                          return const Center(
                            child: Text('Something went wrong'),
                          );
                        }
                        return snapshot.data != null
                            ? snapshot.data!.isNotEmpty
                                ? ListView.builder(
                                    itemCount: snapshot.data!.length,
                                    itemBuilder: (BuildContext context,
                                            int index) =>
                                        electionCard(
                                            extractedData['areaId'],
                                            snapshot.data![index].electionId,
                                            snapshot.data![index].electionType,
                                            snapshot.data![index].electionYear,
                                            snapshot.data![index].startingDate,
                                            snapshot.data![index].endingDate))
                                : const Center(
                                    child: Text('NO ELECTION CAMPAIGN HERE'),
                                  )
                            : const Center(
                                child: Text('SOMETHING WENT WRONG'),
                              );
                      }
                      return const Center(child: CircularProgressIndicator());
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  electionCard(
    String? areaId,
    String? electionId,
    String? electionType,
    String? electionYear,
    String? startingdate,
    String? endingdate,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(CredentialSelectionScreen.routeName,
            arguments: {'areaId': areaId, 'electionId': electionId});
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: textContainerColor,
          borderRadius: BorderRadius.circular(15),
        ),
        height: 215,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Text(
                      electionType.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 16),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.only(right: 90),
                    child: Text(
                      electionYear.toString(),
                      style: const TextStyle(
                          color: textcolor,
                          fontWeight: FontWeight.w700,
                          fontSize: 45),
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 50),
                    child: Text(
                      electionType.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 10),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 250,
              width: 120,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.scaleDown,
                      image: AssetImage(
                        'assets/images/vote2.png',
                      ))),
            )
          ],
        ),
      ),
    );
  }
}

Widget tabItem(String title, bool selected) {
  return Container(
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: selected ? textcolor : textContainerColor,
      borderRadius: BorderRadius.circular(15),
    ),
    alignment: Alignment.center,
    child: Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: selected ? containerColor : Colors.black,
      ),
    ),
  );
}
