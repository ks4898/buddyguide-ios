import 'package:flutter/material.dart';
import 'package:project/customs/weather_widget.dart';
import 'package:project/customs/landing_div.dart';
import 'package:project/customs/section_div.dart';
import 'package:project/customs/waste_div.dart';
import 'package:project/enums/style_constants.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatelessWidget {
  final void Function() toSpots, toWaste;
  final void Function(String) toSection;

  const HomeScreen(
      {super.key,
      required this.toSpots,
      required this.toSection,
      required this.toWaste});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const WeatherWidget(),
              const SizedBox(
                height: 30,
              ),
              LandingDiv(toSpots: toSpots),
              const SizedBox(
                height: 30,
              ),
              FractionallySizedBox(
                widthFactor: divWidth,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SectionDiv("Location", "assets/media/map_icon.png",
                        toSection: () {
                      toSection("location");
                    }),
                    SectionDiv(
                      "Feed",
                      "assets/media/gallery_icon.png",
                      toSection: () {
                        toSection("feed");
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              WasteDiv(toWaste: toWaste),
            ],
          ),
        ),
      ),
    );
  }
}
