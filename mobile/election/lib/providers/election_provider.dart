import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../constants/constants.dart';
import '../models/election_model.dart';

class ElectionProvider with ChangeNotifier {
  List<ElectionModel> campaignList = [];

  Future<List<ElectionModel>> fetchElectionCampaign(String areaId) async {
    try {
      final response =
          await http.get(Uri.parse('$hostUrl/getelectionCampaign/$areaId'));
      final responseData = json.decode(response.body) as List<dynamic>;
      print('responseData = $responseData');
      List<ElectionModel> campaignList = [];
      for (var item in responseData) {
        campaignList.add(ElectionModel(
          electionId: item['electionId'],
          electionType: item['electionType'],
          electionYear: item['electionYear'],
          startingDate: item['startingDate'],
          endingDate: item['endingDate'],
        ));
      }
      campaignList = campaignList;
      return campaignList;
      // print('campaign = $campaignList');
      // notifyListeners();
    } catch (e) {
      rethrow;
    }
  }
}
