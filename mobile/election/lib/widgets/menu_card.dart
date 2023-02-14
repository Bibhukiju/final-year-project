import 'package:flutter/material.dart';

class MenuCard extends StatelessWidget {
  const MenuCard(
      {super.key,
      required this.title,
      required this.description,
      required this.iconData});
  final String title, description;
  final IconData iconData;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 10,
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 10,
      ),
      color: Colors.grey.shade300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 24),
          ),
          Row(
            children: [
              Flexible(child: Text(description)),
              Icon(
                iconData,
                size: 45,
              ),
            ],
          )
        ],
      ),
    );
  }
}
