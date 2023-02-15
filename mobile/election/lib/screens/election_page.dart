import 'package:election/constants/constants.dart';
import 'package:election/screens/area_selection%20_page.dart';
import 'package:flutter/material.dart';

class ElectionPage extends StatelessWidget {
  const ElectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Row(
              children: [
                button('Ongoing \n Elections', true),
                button('Upcoming \n Elections', false),
                button('Past \n Elections', false),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            GestureDetector(
              child: election('LOCAL LEVEL ELECTION', 2079, 'image',
                  'Lorem ipsum dolor sit amet,\n consectetur adipiscing elit, sed \n do eiusmod tempor Lorem \n ipsum dolor sit amet,\n  consectetur adipiscing elit, sed \n  do eiusmod tempor'),
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => const AreaSelection(),
                    ));
              },
            ),
            SizedBox(
              height: 12,
            ),
            election('PARLIAMENTARY ELECTION', 2079, 'image',
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor'),
          ],
        ),
      ),
    );
  }

  election(
    String title,
    int number,
    String image,
    //final IconData next,
    String text,
  ) {
    return Container(
      decoration: BoxDecoration(
          color: textContainerColor, borderRadius: BorderRadius.circular(30)),
      height: 215,
      width: 398,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: 193,
            width: 220,
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
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: Container(
              height: 250,
              width: 150,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.contain,
                      image: AssetImage(
                        'assets/images/vote2.png',
                      ))),
            ),
          )
        ],
      ),
    );
  }
}

button(String title, bool selected) {
  return Padding(
    padding: const EdgeInsets.all(12.0),
    child: Container(
      decoration: BoxDecoration(
        color: selected ? textcolor : textContainerColor,
        borderRadius: BorderRadius.circular(15),
      ),
      height: 49,
      width: 126,
      alignment: Alignment.center,
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: selected ? containerColor : Colors.black,
        ),
      ),
    ),
  );
}
