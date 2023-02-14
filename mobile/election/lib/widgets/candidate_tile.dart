import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../models/candidate.models.dart';

class CandidateTile extends StatelessWidget {
  const CandidateTile({
    super.key,
    required this.candidate,
  });

  final Candidate candidate;

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: NetworkImage(candidate.candidatePhotoUrl),
        )),
      ),
    );
  }
}
