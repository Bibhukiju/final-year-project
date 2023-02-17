import 'package:flutter/material.dart';

import 'package:election/constants/styles.dart';

class NoticeTile extends StatelessWidget {
  
  final String title, link;

  const NoticeTile({
    super.key,
    required this.title,
    required this.link,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5.0),
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            color: const Color(0XFFD9D9D9),
            borderRadius: BorderRadius.circular(5.0)),
        child: Text(
          title,
          style: Styles.subTitleStyle
        ),
      ),
    );
  }
}
