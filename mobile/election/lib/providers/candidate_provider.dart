import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:election/constants/constants.dart';

import 'package:election/models/canditate_model.dart';

class CandidateProvider with ChangeNotifier {
  late int encryptionKey;
  
  List<CandidateModel> _candidateList = [];

  List<CandidateModel> get candidateList {
    return _candidateList;
  }

  final List<String> _voteOrder = [];

  // Getter for voteOrder
  List<String> get voteOrder {
    return _voteOrder;
  }

  /// Fetch the candidates
  Future<void> fetchCandidates(String areaId) async {
    try {
      final response = await http.get(Uri.parse('$hostUrl/candidates/$areaId'));
      final responseData = json.decode(response.body);
      final extractedData = responseData['candidates'] as List<dynamic>;
      final List<CandidateModel> extractedCandidateList = [];
      for (var item in extractedData) {
        extractedCandidateList.add(CandidateModel(
          id: item['candidateId'],
          candidateName: item['candidate_name'],
          candidateImageUrl: item['candidate_url'],
          placeName: item['candidacy_area'],
        ));
      }
      _candidateList = extractedCandidateList;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  /// Adds vote by order
  void assignTheVoteOrder(String candidateId) {
    if (_voteOrder.contains(candidateId)) {
      return;
    }
    _voteOrder.add(candidateId);
    notifyListeners();
  }

  /// Resets the vote
  void resetTheVoteOrder() {
    _voteOrder.clear();
    notifyListeners();
  }

  /// Converts List<String> to String format
  /// Ex. ['a', 'b', 'c'] => a~b~c
  String stringifyTheVote(List<String> voteOrder) {
    var voteOrderString = '';
    for (var item in voteOrder) {
      if (voteOrderString.isEmpty) {
        voteOrderString = item;
        continue;
      }
      voteOrderString = '$voteOrderString~$item';
    }
    return voteOrderString;
  }

  // Submits the vote
  Future<void> submitTheVoteOrder(String areaId) async {
    print('submits the vote');
    try {
      final response = await http.post(Uri.parse('$hostUrl/vote'),
          headers: {'content-type': 'application/json'},
          body: json.encode({
            'voterId': '',
            'areaId': areaId,
            'voteOrder': stringifyTheVote(voteOrder)
          }));
      final responseData = json.encode(response.body);
      print(responseData);
    } catch (e) {
      print(e);
    }
  }

  /// Returns [CandidateModel] from CandidateId
  CandidateModel findCandidateById(String id) {
    return candidateList.firstWhere((element) => element.id == id);
  }
}
