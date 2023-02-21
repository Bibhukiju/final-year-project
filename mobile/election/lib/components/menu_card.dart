import 'package:flutter/material.dart';
import 'package:election/constants/styles.dart';

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
      decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(10.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: Styles.titleStyle),
                Text(
                  description,
                  style: Styles.subTitleStyle,
                ),
                const SizedBox(
                  width: 15.0,
                ),
              ],
            ),
          ),
          const SizedBox(width: 10.0,),
          Icon(
            iconData,
            size: 45,
            color: const Color(0XFF082585),
          ),
        ],
      ),
    );
  }
}
