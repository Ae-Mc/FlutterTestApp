import 'dart:math';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_app/main.dart';
import 'package:flutter_test_app/screens/Home.dart';
import 'package:flutter_test_app/widgets/SpaceElement.dart';
import 'package:url_launcher/url_launcher.dart';

class SpaceExplorationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final headerFont = TextStyle(fontSize: 45);
    final paragraphFont = TextStyle(fontSize: 12);
    final viewMoreFont = TextStyle(fontSize: 15, fontWeight: FontWeight.w700);
    final footerFont = TextStyle(
      color: Theme.of(context).primaryColor,
      fontSize: 26,
    );

    return Scaffold(
      backgroundColor: Color(0xFF0A0A14),
      body: SafeArea(
          child: Stack(children: [
        Positioned(
          child: Transform.rotate(
            angle: -pi / 12.17,
            child: Image.asset(
              "assets/images/EarthBackground.jpg",
              fit: BoxFit.cover,
              width: 875,
              height: 597,
            ),
          ),
          top: 355,
          left: -190,
        ),
        Positioned(
            top: 210,
            left: 0,
            child: Image.asset("assets/images/EarthAtmosphereBlur.png")),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                    onTap: () => Navigator.popAndPushNamed(context, HomeRoute),
                    child: Container(
                        margin: EdgeInsets.only(right: 48, top: 40),
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(999999)),
                        child: Icon(
                          CupertinoIcons.clear,
                          size: 20,
                        )))),
            SizedBox(
              height: 20,
            ),
            Padding(
                padding: EdgeInsets.only(left: 40, right: 100),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SpaceElementWidget(
                        "Space",
                        " Exploration",
                        font: headerFont,
                      ),
                      SizedBox(
                        height: 29,
                      ),
                      RichText(
                          text: TextSpan(
                              style: Theme.of(context).textTheme.bodyText2,
                              children: [
                            TextSpan(
                                style: paragraphFont,
                                text: "Lorem ipsum dolor sit amet,"
                                    " consectetur adipiscing elit."
                                    " Habitant sem ut sit fames in adipiscing."
                                    " Ac magna donec egestas habitant.\n"),
                          ])),
                      SizedBox(
                        height: 34,
                      ),
                      GestureDetector(
                          onTap: () async {
                            if (await canLaunch("https://google.com"))
                              await launch("https://google.com");
                          },
                          child: RichText(
                              text: TextSpan(
                                  style: Theme.of(context).textTheme.bodyText2,
                                  children: [
                                TextSpan(style: viewMoreFont, text: "View More")
                              ])))
                    ])),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: EdgeInsets.only(bottom: 47),
                  child: SpaceElementWidget(
                    "Space",
                    "Element",
                    font: footerFont,
                  ),
                ),
              ),
            )
          ],
        ),
      ])),
    );
  }
}
