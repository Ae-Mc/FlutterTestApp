import 'package:flutter/material.dart';
import 'package:flutter_test_app/screens/Explore.dart';
import 'package:flutter_test_app/screens/Home.dart';
import 'package:flutter_test_app/screens/SpaceExploration.dart';
import 'package:flutter_test_app/screens/Welcome.dart';
import 'package:flutter_test_app/style.dart';
import 'package:appcenter/appcenter.dart';
import 'package:appcenter_analytics/appcenter_analytics.dart';
import 'package:appcenter_crashes/appcenter_crashes.dart';

const WelcomeRoute = '/welcome';
const SpaceExplorationRoute = '/exploration';
const HomeRoute = '/home';
const ExploreRoute = '/explore';

main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyApp();
  }
}

class _MyApp extends State<MyApp> {
  String _appSecret;
  String _installId = 'Unknown';
  bool _areAnalyticsEnabled = false, _areCrashesEnabled = false;

  _MyAppState() {
    _appSecret = "9d27ad7a-3b31-4626-8018-2ad02f5e29e6";
  }

  @override
  initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  initPlatformState() async {
    await AppCenter.start(
        _appSecret, [AppCenterAnalytics.id, AppCenterCrashes.id]);

    if (!mounted) return;

    var installId = await AppCenter.installId;

    var areAnalyticsEnabled = await AppCenterAnalytics.isEnabled;
    var areCrashesEnabled = await AppCenterCrashes.isEnabled;

    setState(() {
      _installId = installId;
      _areAnalyticsEnabled = areAnalyticsEnabled;
      _areCrashesEnabled = areCrashesEnabled;
    });
  }
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
          screen = ExploreScreen(arguments['planet']);
          break;
      }

      return MaterialPageRoute(builder: (BuildContext context) => screen);
    };
  }
}
