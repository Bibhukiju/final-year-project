import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:election/providers/candidate_provider.dart';

class CustomGridTile extends StatelessWidget {
  final String candidateId;
  const CustomGridTile({
    Key? key,
    required this.candidateId,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final cadidateData = Provider.of<CandidateProvider>(context, listen: false)
        .findCandidateById(candidateId);
    return LayoutBuilder(
      builder: (context, tileContraints) {
        return Stack(
          alignment: Alignment.topRight,
          children: [
            GestureDetector(
              onTap: () {
                Provider.of<CandidateProvider>(context, listen: false)
                    .assignTheVoteOrder(candidateId);
              },
              child: GridTile(
                  header: Container(
                    height: tileContraints.maxHeight * 0.75,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            cadidateData.candidateImageUrl.toString()),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  footer: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Column(
                      children: [
                        Text(
                          cadidateData.candidateName.toString(),
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          cadidateData.placeName.toString(),
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                      color: const Color(0XFFC7C7C7),
                    )),
                  )),
            ),

            // Listens to the voteOrder state and changes the UI accordingly
            Consumer<CandidateProvider>(builder: (context, value, _) {
              if (value.voteOrder.contains(candidateId)) {
                int index = value.voteOrder.indexOf(candidateId);
                return Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.black38)),
                  child: Text(((index + 1).toString())),
                );
              }
              return const SizedBox();
            })
          ],
        );
      },
    );
  }
}
