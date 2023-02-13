import 'package:flutter/material.dart';

import 'package:election/widgets/notice_tile.dart';
import 'package:election/constants/fake_data/fakedata.dart';

class NoticeBoard extends StatelessWidget {
  const NoticeBoard({super.key});

  @override
  Widget build(BuildContext context) {
    final FakeData fakeData = FakeData();
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (BuildContext context, int index) => NoticeTile(
        title: fakeData.newsData[fakeData.newsData.length - 1 - index]
                ["title"]
            .toString(),
        link: fakeData.newsData[fakeData.newsData.length - 1 - index]
                ["link"]
            .toString(),
      ),
    );
  }
}
