import 'package:flutter/material.dart';

import 'package:election/constants/styles.dart';
import 'package:election/constants/constants.dart';
import 'package:election/screens/area_selection_screen.dart';

class ElectionScreen extends StatelessWidget {
  static const routeName = '/ElectionPage';
  const ElectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: Styles.pagePadding,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: tabItem('Ongoing Elections', true)),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Expanded(child: tabItem('Upcoming Elections', false)),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Expanded(child: tabItem('Past Elections', false))
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .pushNamed(AreaSelectionScreen.routeName);
                },
                child: electionCard('PARLIAMENTARY ELECTION', 2079, 'image',
                    'Lorem ipsum dolor sit amet,\n consectetur adipiscing elit, sed \n do eiusmod tempor Lorem \n ipsum dolor sit amet,\n  consectetur adipiscing elit, sed \n  do eiusmod tempor'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  electionCard(
    String title,
    int number,
    String image,
    //final IconData next,
    String text,
  ) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: textContainerColor,
        borderRadius: BorderRadius.circular(15),
      ),
      height: 215,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Text(
                    title,
                    style: const TextStyle(
                        fontWeight: FontWeight.w700, fontSize: 16),
                  ),
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.only(right: 90),
                  child: Text(
                    number.toString(),
                    style: const TextStyle(
                        color: textcolor,
                        fontWeight: FontWeight.w700,
                        fontSize: 45),
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 50),
                  child: Text(
                    text,
                    style: const TextStyle(
                        fontWeight: FontWeight.w700, fontSize: 10),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 250,
            width: 120,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.scaleDown,
                    image: AssetImage(
                      'assets/images/vote2.png',
                    ))),
          )
        ],
      ),
    );
  }
}

Widget tabItem(String title, bool selected) {
  return Container(
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: selected ? textcolor : textContainerColor,
      borderRadius: BorderRadius.circular(15),
    ),
    alignment: Alignment.center,
    child: Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: selected ? containerColor : Colors.black,
      ),
    ),
  );
}
