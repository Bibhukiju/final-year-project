import 'package:flutter/material.dart';

class NoticeTile extends StatelessWidget {
  const NoticeTile({
    super.key,
    required this.title,
    required this.link,
  });

  final String title;
  final String link;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => {print(link)},
      title: Text(title),
    );
  }
}
