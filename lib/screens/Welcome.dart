import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_app/main.dart';
import 'package:flutter_test_app/widgets/SpaceElement.dart';

class WelcomeScreen extends StatelessWidget {
  final List<String> _sliderImages = [
    "assets/images/astronaut.png",
    "assets/images/space_02.png",
    "assets/images/space_03.png",
  ];

  @override
  Widget build(BuildContext context) {
    final headerFont =
        TextStyle(color: Theme.of(context).accentColor, fontSize: 35);
    final exploreFont =
        TextStyle(fontSize: 40, color: Theme.of(context).accentColor);
    final paragraphFont = TextStyle(fontSize: 12);
    final skipFont = TextStyle(fontSize: 15, color: Color(0xFFBBBBBB));
    final nextFont =
        TextStyle(fontSize: 15, color: Theme.of(context).primaryColor);

    return Scaffold(
      body: DefaultTextStyle(
        style: TextStyle(color: Theme.of(context).accentColor),
        child: SafeArea(
          child: ListView(
            children: [
              Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 75,
                      ),
                      Center(
                        child: SpaceElementWidget(
                          "Space",
                          "Element",
                          font: headerFont,
                        ),
                      ),
                      SizedBox(
                        height: 73,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: CarouselSlider(
                          items: _buildCarouselSliderItems(),
                          options: CarouselOptions(height: 291),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 56, right: 49),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SpaceElementWidget(
                              "Explore",
                              "\nUniverse",
                              font: exploreFont,
                            ),
                            SizedBox(
                              height: 23,
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 97),
                              child: Text(
                                "Lorem ipsum dolor sit amet,"
                                " consectetur adipiscing elit."
                                " Habitant sem ut sit fames in adipiscing."
                                " Ac magna donec egestas habitant.",
                                style: paragraphFont,
                              ),
                            ),
                            SizedBox(
                              height: 72,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () =>
                                      Navigator.pushNamed(context, HomeRoute),
                                  child: Text("Skip step", style: skipFont),
                                ),
                                GestureDetector(
                                  onTap: () => Navigator.pushNamed(
                                      context, SpaceExplorationRoute),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 36),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      color: Theme.of(context).accentColor,
                                    ),
                                    child: Text("Next", style: nextFont),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 74,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Positioned(
                      child: Icon(
                        CupertinoIcons.right_chevron,
                        color: Theme.of(context).accentColor,
                        size: 44,
                      ),
                      bottom: 267,
                      right: 50)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildCarouselSliderItems() {
    return _sliderImages.map((String imageName) => _buildSliderItem(imageName))
        .toList();
  }

  Widget _buildSliderItem(String imageName) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Image.asset(
        imageName,
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
