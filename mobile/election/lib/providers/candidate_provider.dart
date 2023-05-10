import 'dart:convert';

import 'package:election/exceptions/http_exception.dart';
import 'package:flutter/material.dart';
import 'package:election/providers/encrypt.dart';
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

  /// Returns [CandidateModel] from CandidateId
  CandidateModel findCandidateById(String id) {
    return candidateList.firstWhere((element) => element.candidateId == id);
  }

  /// Fetch the candidates
  Future<void> fetchCandidates(String electionId) async {
    print(electionId);
    try {
      final response =
          await http.get(Uri.parse('$hostUrl/candidates/$electionId'));
      if (response.statusCode >= 400) {
        throw HttpException(exceptionMessage: 'Something Went Wrong');
      }
      final responseData = json.decode(response.body);
      final extractedData = responseData['candidates'] as List<dynamic>;
      print('candidateList = $extractedData');
      final List<CandidateModel> extractedCandidateList = [];
      for (var item in extractedData) {
        extractedCandidateList.add(CandidateModel(
          candidateId: item['candidateId'],
          candidateName: item['candidateName'],
          candidateImageUrl: item['candidateImageUrl'],
          politicalParty: item['politicalParty'],
        ));
      }
      _candidateList = extractedCandidateList;
      notifyListeners();
    } on HttpException catch (e) {
      print(e);
      rethrow;
    } catch (e) {
      print(e);
      rethrow;
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
  /// Item gets enclosed by TILDE (~) operator
  /// Ex. ['a', 'b', 'c'] => ~a~b~c~
  String stringifyTheVote(List<String> voteOrder) {
    var voteOrderString = '';
    for (var item in voteOrder) {
      if (voteOrderString.isEmpty) {
        voteOrderString = '~$item';
        continue;
      }
      voteOrderString = '$voteOrderString~$item';
    }
    return '$voteOrderString~';
  }

  // Submits the vote
  Future<void> submitTheVoteOrder(String electionId, String authToken) async {
    // final requestKey = await Encrypt().assignPublicKey();
    // final encryptedVote = Encrypt()
    //     .encoders(stringifyTheVote(voteOrder), requestKey['e'], requestKey['n'])
    //     .join('-');
    notifyListeners();
    print(authToken);
    print('stringfy ${stringifyTheVote(voteOrder)}');
    try {
      final response = await http.post(Uri.parse('$hostUrl/castVote'),
          headers: {
            'content-type': 'application/json',
            'authorization': authToken,
          },
          body: json.encode({
            'electionId': electionId,
            'votes': stringifyTheVote(voteOrder),
          }));
      final responseData = json.encode(response.body) as Map<String, String>;
      print(
          'castVote : ${json.encode(response.body)} ${responseData['msg'].toString()}');
      if (response.statusCode >= 400) {
        throw HttpException(exceptionMessage: 'Casting Vote Failed');
      }
    } on HttpException catch (_) {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
