import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_app/widgets/SpaceElement.dart';

class ExploreScreen extends StatefulWidget {
  @override
  createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  int _selectedNavbarElement = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedNavbarElement = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Background(context),
      Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Container(
            constraints: BoxConstraints.expand(),
            color: Colors.transparent,
            child: MainContent(context),
          ),
        ),
        bottomNavigationBar: SizedBox(
          height: 83,
          child: ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: BottomNavigationBar(
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                      icon: ImageIcon(
                        AssetImage("assets/images/Compass.png"),
                        size: 32,
                      ),
                      title: SizedBox.shrink()),
                  BottomNavigationBarItem(
                      icon: ImageIcon(
                        AssetImage("assets/images/Planet.png"),
                        size: 41,
                      ),
                      title: SizedBox.shrink()),
                  BottomNavigationBarItem(
                      icon: ImageIcon(
                        AssetImage("assets/images/Person.png"),
                        size: 27,
                      ),
                      title: SizedBox.shrink()),
                ],
                backgroundColor: Color(0x65202E59),
                onTap: (int index) {
                  setState(() {
                    _selectedNavbarElement = index;
                  });
                },
                selectedItemColor: Theme.of(context).primaryColor,
                unselectedItemColor: Theme.of(context).buttonColor,
                currentIndex: _selectedNavbarElement,
              ),
            ),
          ),
        ),
      )
    ]);
  }

  Widget Background(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: -187,
          top: -143,
          child: Image.asset(
            "assets/images/ExploreBackground.jpg",
            fit: BoxFit.cover,
            width: 656,
            height: 1052,
          ),
        ),
        Positioned(
          top: 73,
          left: 40,
          child: ImageIcon(
            AssetImage("assets/images/Menu.png"),
            color: Theme.of(context).primaryColor,
            size: 18,
          ),
        ),
        Positioned(
          top: 280,
          left: -136,
          child: Image.asset(
            "assets/images/ExplorePlanetBackgroundBlur.png",
            width: 700,
            height: 885,
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          top: 360,
          left: -229,
          child: Container(
            width: 885,
            height: 885,
            decoration: BoxDecoration(
              border: Border.all(
                color: Color.fromRGBO(255, 255, 255, 0.2),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(1000),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 14,
                  left: 52,
                  child: Image.asset(
                    "assets/images/Earth.png",
                    width: 766,
                    height: 766,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget MainContent(BuildContext context) {
    final paragraphFont = TextStyle(fontSize: 12);
    final numButtonFont = TextStyle(fontSize: 18);
    final headerFont = TextStyle(fontSize: 35);

    return Column(
      children: [
        SizedBox(
          height: 40,
        ),
        SpaceElementWidget("Space", "Element"),
        SizedBox(
          height: 24,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 38, right: 44),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 2),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: ImageIcon(
                      AssetImage("assets/images/ArrowBack.png"),
                      size: 34,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: 31,
                ),
                Row(
                  children: [
                    Container(
                      height: 29,
                      width: 29,
                      decoration: BoxDecoration(
                          color: Color(0x80B1B0DF),
                          borderRadius: BorderRadius.circular(100)),
                      child: Center(
                        child: SpaceElementWidget(
                          '3',
                          '',
                          font: numButtonFont,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 11,
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: SpaceElementWidget(
                        'Explore',
                        '',
                        font: headerFont,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                RichText(
                  text: TextSpan(
                    style: Theme.of(context).textTheme.bodyText2,
                    children: [
                      TextSpan(
                        style: paragraphFont,
                        text:
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
                            " Habitant sem ut sit fames in adipiscing. Ac magna donec"
                            " egestas habitant.\n",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
