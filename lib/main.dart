import 'package:flutter/material.dart';
import 'package:flutter_test_app/screens/Explore.dart';
import 'package:flutter_test_app/screens/Home.dart';
import 'package:flutter_test_app/screens/SpaceExploration.dart';
import 'package:flutter_test_app/screens/welcome.dart';
import 'package:flutter_test_app/style.dart';

const WelcomeRoute = '/welcome';
const SpaceExplorationRoute = '/exploration';
const HomeRoute = '/home';
const ExploreRoute = '/explore';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: _theme(),
        onGenerateRoute: _routes(),
        debugShowCheckedModeBanner: false,
        home: WelcomeScreen());
  }

  _theme() => ThemeData(
    // This is the theme of your application.
    //
    // Try running your application with "flutter run". You'll see the
    // application has a blue toolbar. Then, without quitting the app, try
    // changing the primarySwatch below to Colors.green and then invoke
    // "hot reload" (press "r" in the console where you ran "flutter run",
    // or simply save your changes to "hot reload" in a Flutter IDE).
    // Notice that the counter didn't reset back to zero; the application
    // is not restarted.
    accentColor: accentColor,
    primaryColor: primaryColor,
    scaffoldBackgroundColor: backgroundColor,
    buttonColor: buttonColor,
    textTheme: TextTheme(bodyText2: BodyText2Style, headline6: Headline6TextStyle),
    fontFamily: "Mark",
    // This makes the visual density adapt to the platform that you run
    // the app on. For desktop platforms, the controls will be smaller and
    // closer together (more dense) than on mobile platforms.
    visualDensity: VisualDensity.adaptivePlatformDensity,

  );

  RouteFactory _routes() {
    return (RouteSettings settings) {
      final Map<String, dynamic> arguments = settings.arguments;
      Widget screen;
      switch(settings.name) {
        case WelcomeRoute:
          screen = WelcomeScreen();
          break;
        case SpaceExplorationRoute:
          screen = SpaceExplorationScreen();
          break;
        case HomeRoute:
          screen = HomeScreen();
          break;
        case ExploreRoute:
          screen = ExploreScreen();
          break;
      };
      return MaterialPageRoute(builder: (BuildContext context) => screen);
    };
  }
}
