import 'package:election/widgets/menu_card.dart';
import 'package:election/widgets/notice_board.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
                height: MediaQuery.of(context).size.height / 10 * 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: Container()),
                    const Text("News And Notices"),
                    const Expanded(child: NoticeBoard()),
                  ],
                )),
          ),
          SizedBox(
              height: MediaQuery.of(context).size.height / 10 * 5,
              child: ListView(
                children: const [
                  MenuCard(
                      title: "Vote",
                      description:
                          "Lets not waste our right to choose the candidate who represents us in a better way.",
                      iconData: Icons.how_to_vote_outlined),
                  MenuCard(
                      title: "SEE RESULTS",
                      description:
                          "See the results of the latest election and get to know who got elected. You can see the results of any place.",
                      iconData: Icons.emoji_people_outlined),
                  MenuCard(
                      title: "CANDIDATES",
                      description:
                          "Get the information about who is giving candidacy in your area.",
                      iconData: Icons.format_list_bulleted_outlined),
                ],
              )),
        ],
      ),
    );
  }
}
