import 'package:flutter/material.dart';
import 'package:project/customs/page_heading.dart';
import 'package:project/customs/spot_row.dart';
import 'package:project/data/spots_data.dart';
import 'package:project/enums/style_constants.dart';

class SpotsScreen extends StatelessWidget {
  const SpotsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> dataMap = SpotsData().getMap;

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          const PageHeading(
            "Split's Top Spots",
            "Check out the top spots...",
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .525,
            child: SingleChildScrollView(
              child: Center(
                child: FractionallySizedBox(
                  widthFactor: divWidth,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      for (var i = 0; i < dataMap.length; i++)
                        SpotRow(
                          dataMap[i]["title"] as String,
                          dataMap[i]["description"] as String,
                          dataMap[i]["imgPath"] as String,
                          index: i,
                        )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
