import 'package:flutter/material.dart';

import 'package:election/constants/styles.dart';

class NoticeTile extends StatelessWidget {
  final String title, description, issuedDate;

  const NoticeTile({
    super.key,
    required this.title,
    required this.description,
    required this.issuedDate,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5.0),
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            color: const Color(0XFFD9D9D9),
            borderRadius: BorderRadius.circular(10.0)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(title.toUpperCase(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                    style: Styles.subTitleStyle
                        .copyWith(fontWeight: FontWeight.bold)),
                        Spacer(),
                Text(issuedDate.split('T').first)
              ],
            ),
            Text(description,
            textAlign: TextAlign.start,
            overflow: TextOverflow.ellipsis,
             style: Styles.subTitleStyle, maxLines: 3),
          ],
        ),
      ),
    );
  }
}
