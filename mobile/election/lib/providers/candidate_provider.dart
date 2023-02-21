import 'package:election/models/canditate_model.dart';
import 'package:flutter/material.dart';

class CandidateProvider with ChangeNotifier {
  // Dummy Data
  List<CandidateModel> candidateList = [
    CandidateModel(
        id: 'c1',
        candidateName: 'Mahesh Basnet',
        placeName: 'Gundu, Bhkt',
        candidateImageUrl: ''),
    CandidateModel(
        id: 'c2',
        candidateName: 'Durlav Thapa',
        placeName: 'Suryabinayak, Bhkt',
        candidateImageUrl: ''),
    CandidateModel(
        id: 'c3',
        candidateName: 'Avinash Karki',
        placeName: 'Thimi, Bhkt',
        candidateImageUrl: ''),
    CandidateModel(
        id: 'c4',
        candidateName: 'Mahesh Basnet',
        placeName: 'Gundu, Bhkt',
        candidateImageUrl: ''),
  ];

  final List<String> _voteOrder = [];

  // Getter for voteOrder
  List<String> get voteOrder {
    return _voteOrder;
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

  /// Returns [CandidateModel] from CandidateId
  CandidateModel findCandidateById(String id) {
    return candidateList.firstWhere((element) => element.id == id);
  }
}
