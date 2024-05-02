import 'package:flutter/material.dart';
import 'package:project/screens/location_screen.dart';
import 'package:project/screens/home_screen.dart';
import 'package:project/screens/feed_screen.dart';
import 'package:project/screens/spots_screen.dart';
import 'package:project/screens/waste_screen.dart';
import 'package:project/enums/style_constants.dart';
import 'package:google_fonts/google_fonts.dart';

class MainSkeleton extends StatefulWidget {
  const MainSkeleton({Key? key}) : super(key: key);

  @override
  State<MainSkeleton> createState() => _MainSkeletonState();
}

class _MainSkeletonState extends State<MainSkeleton> {
  String currScreen = "home";

  void switchToMap() {
    setState(() {
      currScreen = "location";
    });
  }

  void switchToHome() {
    setState(() {
      currScreen = "home";
    });
  }

  void switchToFeed() {
    setState(() {
      currScreen = "feed";
    });
  }

  void switchToSpots() {
    setState(() {
      currScreen = "spots";
    });
  }

  void switchToWaste() {
    setState(() {
      currScreen = "waste";
    });
  }

  void switchSection(String screen) {
    setState(() {
      currScreen = screen;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget? currScreenWidget;
    if (currScreen == "location") {
      currScreenWidget = const LocationScreen();
    } else if (currScreen == "home") {
      currScreenWidget = HomeScreen(
        toSpots: switchToSpots,
        toSection: switchSection,
        toWaste: switchToWaste,
      );
    } else if (currScreen == "feed") {
      currScreenWidget = const FeedScreen();
    } else if (currScreen == "spots") {
      currScreenWidget = const SpotsScreen();
    } else {
      currScreenWidget = const WasteScreen();
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 75,
          backgroundColor: darkBlue,
          centerTitle: true,
          title: Text(
            "BuddyGuide",
            style: GoogleFonts.poppins(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: white,
            ),
          ),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(
            vertical: currScreen == "location" || currScreen == "feed" ? 0 : 30,
          ),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [
                gDarkBlue,
                gLightBlue,
              ],
            ),
          ),
          child: currScreenWidget,
        ),
        bottomNavigationBar: NavigationBar(
          height: 80,
          destinations: [
            for (var i = 0; i < imgPaths.length; i++)
              GestureDetector(
                onTap: () {
                  switch (i) {
                    case 0:
                      switchToHome();
                      break;
                    case 1:
                      switchToMap();
                      break;
                    case 2:
                      switchToFeed();
                      break;
                    case 3:
                      switchToWaste();
                      break;
                  }
                },
                child: Image.asset(
                  imgPaths[i],
                  width: 40,
                  height: 40,
                  opacity: AlwaysStoppedAnimation(
                    currScreen.contains(imgPaths[i]) ? .5 : 1,
                  ),
                ),
              ),
          ],
          backgroundColor: darkBlue,
        ),
      ),
    );
  }
}
