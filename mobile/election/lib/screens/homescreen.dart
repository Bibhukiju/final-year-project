import 'package:election/constants/constants.dart';
import 'package:election/components/carousel.dart';
import 'package:flutter/material.dart';

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
];

final List<Widget> imageSliders = imgList
    .map((item) => Container(
          margin: const EdgeInsets.all(5.0),
          child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(15.0)),
              child: Stack(
                children: <Widget>[
                  Image.network(item, fit: BoxFit.cover, width: 1000.0),
                  Positioned(
                    bottom: 0.0,
                    left: 0.0,
                    right: 0.0,
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(200, 0, 0, 0),
                            Color.fromARGB(0, 0, 0, 0)
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      child: Text(
                        'No. ${imgList.indexOf(item)} image',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              )),
        ))
    .toList();

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: Column(children: [
          Carousel(),

          const SizedBox(
            height: 20,
          ),
          Container(
            height: 209,
            width: 398,
            color: containerColor,
            child: ClipRRect(
              child: Column(children: [
                const Padding(
                  padding: EdgeInsets.only(right: 180),
                  child: Text(
                    "Latest News/Notices",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 7,
                ),
                news(' XYZ XYZ to give his candidaty from Dhading'),
                const SizedBox(
                  height: 7,
                ),
                news(' XYZ XYZ to give his candidaty from Dhading'),
                const SizedBox(
                  height: 7,
                ),
                news(' XYZ XYZ to give his candidaty from Dhading'),
              ]),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          menuCard('VOTE', Icons.how_to_vote,
              'Lets not waste our right to choose the candidate who represents us in a better way'),
          const SizedBox(
            height: 10,
          ),
          menuCard('SEE RESULTS', Icons.person,
              'See the results of the latest election and get to know who got elected. You can see the results of any place.'),
          const SizedBox(
            height: 10,
          ),
          menuCard('CANDIDATES', Icons.copy_all,
              'Get the information about who is giving candidacy in your area.'),
        ]),
      ),
    );
  }
}

Widget menuCard(
  String title,
  final IconData next,
  String text,
) {
  return Container(
    decoration: BoxDecoration(
      color: textContainerColor,
      borderRadius: BorderRadiusDirectional.circular(10),
    ),
    height: 120,
    width: 398,
    child: ClipRRect(
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.only(
            right: 300,
            top: 10,
          ),
          child: Positioned(
            left: 10,
            child: Text(
              title,
              style: const TextStyle(
                color: textcolor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Row(
          children: [
            const SizedBox(
              width: 17,
            ),
            Container(
              child: Flexible(
                child: Text(
                  text,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                right: 50,
                bottom: 25,
              ),
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  next,
                  size: 60,
                  color: textcolor,
                ),
              ),
            ),
          ],
        )
      ]),
    ),
  );
}

news(
  String text,
) {
  return Container(
    decoration: BoxDecoration(
        color: textContainerColor, borderRadius: BorderRadius.circular(7)),
    height: 46,
    width: 370,
    child: Text(
      textAlign: TextAlign.center,
      text,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        height: 2.5,
      ),
    ),
  );
}
