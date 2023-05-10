import 'package:election/constants/styles.dart';
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
        vertical: 10,
      ),
      decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.grey.shade300,

      ),
      child: Row(
        children: [
          Expanded(
            flex: 8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Styles.titleStyle.copyWith(
                    fontSize: 24
                  ),
                ),
                Text(description)
              ],
            ),
          ),
          Expanded(
          flex: 2,
            child: Icon(
              iconData,
              size: 45,
              color: const Color(0xFF082585),
            ),
          ),
        ],
      ),
    );
  }
}
