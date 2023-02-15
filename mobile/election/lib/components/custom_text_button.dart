import 'package:election/constants/styles.dart';
import 'package:flutter/material.dart';

/// Creates a TextButton with provided required parameters [title] and [onPressed]
class CustomTextButton extends StatelessWidget {
  final String title;
  final Function() onPressed;
  final Color? textColor;
  final Color? backgroundColor;
  const CustomTextButton({
    Key? key,
    required this.title,
    required this.onPressed,
    this.textColor,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(backgroundColor),
      ),
      child: Text(
        title,
        style: Styles.buttonStyle.copyWith(
          color: textColor
        ),
      ),
    );
  }
}
