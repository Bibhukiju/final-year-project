import 'package:election/constants/styles.dart';
import 'package:flutter/material.dart';

/// Creates a TextButton with provided parameters [title] and [onPressed]
class CustomTextButton extends StatelessWidget {
  final String title;
  final Function() onPressed;
  const CustomTextButton({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        title,
        style: Styles.buttonStyle,
      ),
    );
  }
}
