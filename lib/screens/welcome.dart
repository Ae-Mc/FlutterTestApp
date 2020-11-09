import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_app/main.dart';
import 'package:flutter_test_app/widgets/SpaceElement.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mainFont = TextStyle(color: Theme.of(context).accentColor);
    final headerFont =
        TextStyle(color: Theme.of(context).accentColor, fontSize: 35);
    final exploreFont =
        TextStyle(fontSize: 40, color: Theme.of(context).accentColor);
    final paragraphFont = TextStyle(fontSize: 12);
    final skipFont = TextStyle(fontSize: 15, color: Color(0xFFBBBBBB));
    final nextFont =
        TextStyle(fontSize: 15, color: Theme.of(context).primaryColor);

    return Scaffold(
        body: SafeArea(
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
                  Image(
                    image: AssetImage("assets/images/astronaut.png"),
                    fit: BoxFit.fitWidth,
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
                          child: RichText(
                            text: TextSpan(
                              style: mainFont,
                              children: [
                                TextSpan(
                                    style: paragraphFont,
                                    text: "Lorem ipsum dolor sit amet,"
                                        " consectetur adipiscing elit."
                                        " Habitant sem ut sit fames in adipiscing."
                                        " Ac magna donec egestas habitant.")
                              ],
                            ),
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
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                          text: "Skip step", style: skipFont)
                                    ],
                                    style: mainFont,
                                  ),
                                )),
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
                                  child: RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(text: "Next", style: nextFont)
                                      ],
                                      style: mainFont,
                                    ),
                                  )),
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
    ));
  }
}
