import 'dart:convert';

import 'package:election/screens/voting_screen.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'package:election/constants/styles.dart';
import '../components/custom_snack_bar.dart';
import '../components/custom_text_button.dart';
import '../components/custom_text_field.dart';
import '../constants/constants.dart';
import '../exceptions/http_exception.dart';

class CredentialSelectionScreen extends StatefulWidget {
  static const routeName = '/CredentialSelectionScreen';
  const CredentialSelectionScreen({super.key});

  @override
  State<CredentialSelectionScreen> createState() =>
      _CredentialSelectionScreenState();
}

class _CredentialSelectionScreenState extends State<CredentialSelectionScreen> {
  final _formKey = GlobalKey<FormState>();
  final _citizenshipIdController = TextEditingController();
  final _citizenshipNameController = TextEditingController();

  Map<String, String> initValues = {'citizenshipId': '', 'citizenshipName': ''};

  @override
  void dispose() {
    _citizenshipIdController.dispose();
    _citizenshipNameController.dispose();
    super.dispose();
  }

  void submitData(String? areaId, String? electionId) async {
    // Validates the text form
    if (!_formKey.currentState!.validate()) {
      return;
    }

    print('areaId = $areaId');

    // Assigning values to remaing Map fiels
    initValues['citizenshipId'] = _citizenshipIdController.text;
    initValues['citizenshipName'] = _citizenshipNameController.text;

    try {
      final response = await http.post(Uri.parse('$hostUrl/getVoteAccessToken'),
          headers: {'Content-Type': 'application/json'},
          body: json.encode({
            'fullName': citizenName,
            'citizenshipNumber': citizenId,
            'locationId': areaId,
          }));
      final responseData = json.decode(response.body);
      print('reosod $responseData');
      if (response.statusCode >= 400) {
        throw HttpException(
            exceptionMessage: responseData['msg'] ?? 'Status Code 400 Error');
      }
      // Navigates to Vote Screen if validation passes
      Navigator.of(context).pushNamed(VotingScreen.routeName, arguments: {
        'electionId': electionId,
        'token': responseData['token']
      });
    } on HttpException catch (e) {
      showSnackBarWidget(ctx: context, message: e.toString());
    } catch (_) {
      showSnackBarWidget(ctx: context, message: 'Something Went Wrong!');
    }
  }

  @override
  Widget build(BuildContext context) {
    final extractedData =
        ModalRoute.of(context)!.settings.arguments as Map<String, String?>;
    return Scaffold(
      body: SafeArea(
          child: Form(
        key: _formKey,
        child: Padding(
          padding: Styles.pagePadding,
          child: Column(
            children: [
              // TextField for Citizenship ID
              CustomTextField(
                title: 'Citizenship ID',
                controller: _citizenshipIdController,
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
                controller: _citizenshipNameController,
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

              const Spacer(),

              // PROCEED Button
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomTextButton(
                    title: 'PROCEED',
                    onPressed: () => submitData(
                        extractedData['areaId'], extractedData['electionId']),
                  )
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
