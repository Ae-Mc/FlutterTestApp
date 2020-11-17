import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_app/widgets/PlanetsCarousel.dart';
import 'package:flutter_test_app/widgets/SpaceElement.dart';

class HomeScreen extends StatefulWidget {
  @override
  createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _selectedNavbarElement = 0;

  @override
  void initState() {
    super.initState();
    _selectedNavbarElement = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Positioned(
          top: -643,
          left: -544,
          child: Image.asset(
            "assets/images/HomeBackground.jpg",
            fit: BoxFit.cover,
            width: 969,
            height: 1552,
          )),
      Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            SafeArea(
              child: Container(
                constraints: BoxConstraints.expand(),
                color: Colors.transparent,
                child: ListView(
                  children: [
                    Stack(
                      children: [
                        Positioned(
                          top: 48,
                          left: 40,
                          child: ImageIcon(
                            AssetImage("assets/images/Menu.png"),
                            color: Theme.of(context).primaryColor,
                            size: 18,
                          ),
                        ),
                        Column(
                          children: [
                            SizedBox(height: 40),
                            SpaceElementWidget("Space", "Element"),
                            SizedBox(height: 26),
                            _searchField(),
                            SizedBox(height: 31),
                            PlanetsCarouselWidget(),
                            SizedBox(height: 30),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        bottomNavigationBar: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
            child: SizedBox(
              height: 83,
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
                backgroundColor: Color(0x75201E39),
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

  Widget _searchField() {
    final searchHintFont =
        TextStyle(fontSize: 10, color: Color.fromRGBO(255, 255, 255, 0.5));

    return Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, 0.2),
        borderRadius: BorderRadius.circular(99999),
      ),
      height: 35,
      padding: EdgeInsets.only(left: 21),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            CupertinoIcons.search,
            size: 16,
            color: Theme.of(context).primaryColor,
          ),
          SizedBox(
            width: 16,
          ),
          Container(
            width: 215,
            padding: EdgeInsets.zero,
            child: TextField(
              textDirection: TextDirection.ltr,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(bottom: 15),
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
                border: InputBorder.none,
                hintText: "Search your favorite planet",
                hintStyle: searchHintFont,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
