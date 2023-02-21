import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:election/screens/election_screen.dart';
import 'package:election/constants/styles.dart';

import '../components/menu_card.dart';
import '../components/notice_tile.dart';
import '../constants/fake_data/dummy_data.dart';
import '../constants/fake_data/fakedata.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: Styles.pagePadding,
          child: Column(
            children: const [
              // Carousel 
               Expanded(
                flex: 3,
                child: Carousel(),
              ),
               SizedBox(
                height: 5.0,
              ),
              // Notice Board
               Expanded(
                flex: 3,
                child: NoticeBoard(),
              ),
               SizedBox(
                height: 5.0,
              ),
              // Menu Cards
              Expanded(
                flex: 5,
                child: MenuCards(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// Carousel
class Carousel extends StatefulWidget {
  const Carousel({super.key});

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  late List<String> imageList;
  int _current = 0;
  final CarouselController _controller = CarouselController();
  @override
  void initState() {
    imageList = DummyData.imgList;
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
      final List<Widget> imageSliders = imageList
      .map((item) => Container(
            margin: const EdgeInsets.symmetric(horizontal: 5.0),
            child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                child: Stack(
                  children: <Widget>[
                    Image.network(item,
                        fit: BoxFit.cover, width: double.infinity),
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
                          'No. ${DummyData.imgList.indexOf(item)} image',
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
    return Column(
      children: [
        CarouselSlider(
          items: imageSliders,
          carouselController: _controller,
          options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              enlargeFactor: 0.2,
              enlargeStrategy: CenterPageEnlargeStrategy.height,
              autoPlayInterval: const Duration(seconds: 10),
              aspectRatio: 2.3,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imageList.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 8.0,
                height: 8.0,
                margin:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black)
                        .withOpacity(_current == entry.key ? 0.9 : 0.4)),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}


// Notice Board
class NoticeBoard extends StatelessWidget {
  const NoticeBoard({super.key});

  @override
  Widget build(BuildContext context) {
    final FakeData fakeData = FakeData();
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          color: const Color(0XFFF3F3F3),
          borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("NEWS AND NOTICES", style: Styles.titleStyle),
          Expanded(
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) => NoticeTile(
                title: fakeData.newsData[fakeData.newsData.length - 1 - index]
                        ["title"]
                    .toString(),
                link: fakeData.newsData[fakeData.newsData.length - 1 - index]
                        ["link"]
                    .toString(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


// Menus Cards
class MenuCards extends StatelessWidget {
  const MenuCards({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context)
                .pushNamed(ElectionScreen.routeName);
          },
          child: const MenuCard(
              title: "VOTE",
              description:
                  "Lets not waste our right to choose the candidate who represents us in a better way.",
              iconData: Icons.how_to_vote_outlined),
        ),
        const MenuCard(
            title: "SEE RESULTS",
            description:
                "See the results of the latest election and get to know who got elected. You can see the results of any place.",
            iconData: Icons.emoji_people_outlined),
        const MenuCard(
            title: "CANDIDATES",
            description:
                "Get the information about who is giving candidacy in your area.",
            iconData: Icons.format_list_bulleted_outlined),
      ],
    );
  }
}
