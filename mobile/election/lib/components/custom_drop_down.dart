import 'package:election/constants/styles.dart';
import 'package:flutter/material.dart';


/// Creates a CustomDropDown with provided parameters
class CustomDropDown extends StatelessWidget {
  final String title;
  final String hintText;
  final String? selectedValue;
  final List<DropdownMenuItem<dynamic>>? dropDownItems;
  final Function(dynamic)? onChanged;
  const CustomDropDown({
    Key? key,
    required this.title,
    required this.hintText,
    required this.selectedValue,
    required this.dropDownItems,
    required this.onChanged,
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
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0XFFD9D9D9)),
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
              isExpanded: true,
              borderRadius: BorderRadius.circular(10),
              dropdownColor: const Color(0XFFD9D9D9),
              onChanged: onChanged,
              value: selectedValue,
              style: Styles.labelStyle,
              hint: Text(
                hintText,
              ),
              items: dropDownItems,
            ),
          ),
        ),
      ],
    );
  }
}
