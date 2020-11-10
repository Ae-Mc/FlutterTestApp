import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_app/main.dart';
import 'package:flutter_test_app/models/Planet.dart';
import 'package:flutter_test_app/widgets/SpaceElement.dart';

class PlanetsCarouselWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: Planet.fetchAll()
          .map((Planet planet) => _buildPlanetItem(planet, context))
          .toList(),
      options: CarouselOptions(
        height: 585,
        enableInfiniteScroll: Planet.fetchAll().length > 2 ? true : false,
      ),
    );
  }

  Widget _buildPlanetItem(Planet planet, BuildContext context) {
    final planetFont = TextStyle(fontSize: 17);
    final planetHeaderFont = TextStyle(fontSize: 45, height: 1.1);
    final paragraphFont = TextStyle(fontSize: 12);
    final viewMoreFont = TextStyle(fontSize: 15);

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              planet.name,
              style: planetFont,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Container(
              width: 323,
              height: 323,
              decoration: BoxDecoration(
                border: Border.all(
                    color: Color.fromRGBO(255, 255, 255, 0.2), width: 1),
                borderRadius: BorderRadius.circular(200),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: -23,
                    left: -27,
                    child: Image.asset(
                      "assets/images/HomePlanetBackgroundBlur.png",
                      width: 370,
                      height: 370,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                    top: 21,
                    left: 17,
                    child: Hero(
                      tag: planet.name,
                      child: Image.asset(
                        planet.imagePath,
                        width: 279,
                        height: 279,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 42,
          ),
          Padding(
            padding: EdgeInsets.only(left: 43, right: 87),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SpaceElementWidget(planet.name, "\nPlanet",
                    font: planetHeaderFont),
                SizedBox(
                  height: 7,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        planet.description,
                        style: paragraphFont,
                        maxLines: 2,
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pushNamed(
                          context,
                          ExploreRoute,
                          arguments: {'planet': planet},
                        ),
                        child: Row(
                          children: [
                            SpaceElementWidget("View more", "",
                                font: viewMoreFont),
                            SizedBox(
                              width: 14,
                            ),
                            Icon(
                              CupertinoIcons.right_chevron,
                              size: 14,
                              color: Theme.of(context).primaryColor,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
