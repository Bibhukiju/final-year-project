import 'dart:convert';

import 'package:election/screens/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:election/components/custom_drop_down.dart';
import 'package:election/components/custom_snack_bar.dart';
import 'package:election/components/custom_text_button.dart';
import 'package:election/constants/constants.dart';
import 'package:election/constants/fake_data/dummy_data.dart';
import 'package:election/constants/styles.dart';
import 'package:election/exceptions/http_exception.dart';
import 'package:election/screens/election_screen.dart';
import 'package:election/screens/voting_screen.dart';

import '../components/custom_text_field.dart';

class AreaSelectionScreen extends StatefulWidget {
  static const routeName = '/AreaSelectionScreen';
  const AreaSelectionScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<AreaSelectionScreen> createState() => _AreaSelectionScreenState();
}

class _AreaSelectionScreenState extends State<AreaSelectionScreen> {
  Map<String, String> initValues = {
    'province': '',
    'district': '',
    'area': '',
  };

  /// Gets invoked when user clicks PROCEED button
  void submitData() async {
    final isViewingResult = ModalRoute.of(context)!.settings.arguments as bool?;
    // Checks if the user did not choose any value from the dropdown
    if (initValues['province'] == '' ||
        initValues['district'] == '' ||
        initValues['area'] == '') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Atleast one of the field is empty !',
            textAlign: TextAlign.center,
            style: Styles.buttonStyle,
          ),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }
    if (isViewingResult == true) {
      Navigator.of(context).pushNamed(ResultScreen.routeName, arguments: {
        'areaId': DummyData
            .locationList[initValues['province']]![initValues['district']]!
            .firstWhere((item) => initValues['area'] == item['name'])['areaId'],
      });
      return;
    }
    Navigator.of(context).pushNamed(ElectionScreen.routeName, arguments: {
      'areaId': DummyData
          .locationList[initValues['province']]![initValues['district']]!
          .firstWhere((item) => initValues['area'] == item['name'])['areaId'],
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          // DropDown Area
          DropDownArea(initValues: initValues),

          const SizedBox(
            height: 8,
          ),

          // TextField Area
          // TextFieldArea(
          //   formKey: _formKey,
          //   citizenshipIdController: _citizenshipIdController,
          //   citizenshipNameController: _citizenshipNameController,
          // ),

          const SizedBox(
            height: 8,
          ),

          // PROCEED Button
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomTextButton(
                title: 'PROCEED',
                onPressed: submitData,
              )
            ],
          )
        ]),
      )),
    );
  }
}

// DropDownArea Impl
class DropDownArea extends StatefulWidget {
  final Map<String, String> initValues;
  const DropDownArea({
    Key? key,
    required this.initValues,
  }) : super(key: key);

  @override
  State<DropDownArea> createState() => _DropDownAreaState();
}

class _DropDownAreaState extends State<DropDownArea> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // DropDown for province
        CustomDropDown(
          title: 'PROVINCE',
          selectedValue: widget.initValues['province']!.isEmpty
              ? null
              : widget.initValues['province'],
          dropDownItems: DummyData.locationList.keys.map((province) {
            return DropdownMenuItem(value: province, child: Text(province));
          }).toList(),
          onChanged: (value) {
            setState(() {
              widget.initValues['province'] = value;
            });
          },
          hintText: 'Choose Your Province',
        ),

        const SizedBox(
          height: 5,
        ),

        // DropDown for District
        CustomDropDown(
          title: 'DISTRICT',
          selectedValue: widget.initValues['district']!.isEmpty
              ? null
              : widget.initValues['district'],
          dropDownItems: widget.initValues['province']!.isEmpty
              ? null
              : DummyData.locationList[widget.initValues['province']]!.keys
                  .map((district) {
                  return DropdownMenuItem(
                      value: district, child: Text(district));
                }).toList(),
          onChanged: widget.initValues['province']!.isEmpty
              ? null
              : (value) {
                  setState(() {
                    widget.initValues['district'] = value;
                  });
                },
          hintText: 'Choose Your District',
        ),
        const SizedBox(
          height: 8,
        ),

        // DropDown for Area
        CustomDropDown(
          title: 'AREA',
          selectedValue: widget.initValues['area']!.isEmpty
              ? null
              : widget.initValues['area'],
          dropDownItems: widget.initValues['district']!.isEmpty
              ? null
              : DummyData.locationList[widget.initValues['province']]![
                      widget.initValues['district']]!
                  .map((area) {
                  return DropdownMenuItem(
                      value: area['name'],
                      child: Text(area['name'].toString()));
                }).toList(),
          onChanged: widget.initValues['district']!.isEmpty
              ? null
              : (value) {
                  setState(() {
                    widget.initValues['area'] = value;
                  });
                },
          hintText: 'Choose Your Area',
        ),
      ],
    );
  }
}

// TextFieldArea Impl
class TextFieldArea extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController citizenshipIdController;
  final TextEditingController citizenshipNameController;
  const TextFieldArea(
      {super.key,
      required this.formKey,
      required this.citizenshipIdController,
      required this.citizenshipNameController});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          // TextField for Citizenship ID
          CustomTextField(
            title: 'Citizenship ID',
            controller: citizenshipIdController,
            textInputType: TextInputType.number,
            validator: (value) {
              if (value != null) {
                if (value.isEmpty) {
                  return 'Citizenship ID cannot be empty';
                } else if (value.length < 2) {
                  return 'Citizenship ID too short';
                } else if (value.length > 30) {
                  return 'Citizenship ID too long';
                }
              }
              return null;
            },
            label: 'Enter your Citizenship ID',
          ),
          const SizedBox(
            height: 8,
          ),
          // TextField for Name
          CustomTextField(
            title: 'Citizenship Name',
            controller: citizenshipNameController,
            validator: (value) {
              if (value != null) {
                if (value.isEmpty) {
                  return 'Name cannot be empty';
                } else if (value.length < 2) {
                  return 'Name too short';
                } else if (value.length > 30) {
                  return 'Name too long';
                }
              }
              return null;
            },
            label: 'Enter Your Name',
          ),
        ],
      ),
    );
  }
}
