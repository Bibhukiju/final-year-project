import 'dart:convert';

import 'package:election/exceptions/http_exception.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import '../constants/constants.dart';
import '../models/notice_model.dart';

class NoticeProvider with ChangeNotifier {
  List<NoticeModel> notices = [];

  Future<void> getNotices() async {
    try {
      final response = await http.get(Uri.parse('$hostUrl/notices/'));
      if (response.statusCode >= 400) {
        throw HttpException(exceptionMessage: 'Something Went Wrong');
      }
      final responseData = json.decode(response.body) as List<dynamic>;
      print('responseData = $responseData');
      List<NoticeModel> campaignList = [];
      for (var item in responseData) {
        campaignList.add(NoticeModel(
          noticeId: item['noticeId'],
          noticeTitle: item['noticeTitle'],
          issuedDate: item['issuedDate'],
          noticeDescription: item['noticeDescription'],
        ));
      }
      notices = campaignList;
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }
}
