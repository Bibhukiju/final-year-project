import 'package:election/constants/fake_data/fakedata.dart';
import 'package:election/models/candidate.models.dart';
import 'package:election/widgets/candidate_tile.dart';
import 'package:flutter/material.dart';

class VotingPage extends StatelessWidget {
  const VotingPage({super.key});

  @override
  Widget build(BuildContext context) {
    FakeData fakeData = FakeData();
    List<Candidate> candidates = fakeData.candidateList;
    return Scaffold(
      body: GridView.builder(
        itemCount: candidates.length,
        itemBuilder: (BuildContext context, int index) =>
            CandidateTile(candidate: candidates[index]),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 1),
      ),
    );
  }
}
