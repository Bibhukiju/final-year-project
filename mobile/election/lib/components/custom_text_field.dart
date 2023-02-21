import 'package:flutter/material.dart';

import '../constants/styles.dart';

/// Creates a TextField with provided parameters
class CustomTextField extends StatelessWidget {
  final String title;
  final String label;
  final TextEditingController controller;
  final TextInputType? textInputType;
  final String? Function(String?)? validator;
  final Function(String)? onFieldSubmitted;

  const CustomTextField({
    Key? key,
    required this.title,
    required this.label,
    required this.controller,
    this.textInputType = TextInputType.text,
    required this.validator,
    this.onFieldSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(
          height: 4.0,
        ),
        TextFormField(
          style: Styles.labelStyle,
          cursorColor: Colors.black,
          keyboardType: textInputType,
          decoration: InputDecoration(
              labelText: label,
              filled: true,
              fillColor: const Color(0XFFD9D9D9),
              contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
              floatingLabelBehavior: FloatingLabelBehavior.never,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none)),
          controller: controller,
          validator: validator,
          onFieldSubmitted: onFieldSubmitted,
        ),
      ],
    );
  }
}
