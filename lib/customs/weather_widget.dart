import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/weather.dart';
import 'package:project/enums/style_constants.dart';
import 'package:google_fonts/google_fonts.dart';

class WeatherWidget extends StatefulWidget {
  const WeatherWidget({super.key});

  @override
  State<WeatherWidget> createState() {
    return _WeatherWidgetState();
  }
}

class _WeatherWidgetState extends State<WeatherWidget> {
  Weather? _weatherObj;
  final WeatherFactory currWeather = WeatherFactory(weatherApiKey);

  @override
  void initState() {
    super.initState();
    currWeather.currentWeatherByCityName("Split").then((w) {
      setState(() {
        _weatherObj = w;
      });
    });
  }

  String getDate() {
    DateTime now = _weatherObj!.date!;
    return DateFormat("hh:mm a").format(now);
  }

  String getCity() {
    return _weatherObj?.areaName ?? "";
  }

  String getIcon() {
    return _weatherObj!.weatherIcon!;
  }

  double? getTemp() {
    Temperature currTemp = _weatherObj!.temperature!;
    return currTemp.celsius;
  }

  Widget getWeatherWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: 65,
              height: 65,
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    "https://openweathermap.org/img/wn/${getIcon()}@2x.png",
                  ),
                ),
              ),
            ),
            Text(
              "${getTemp()?.round()}°C",
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: white,
              ),
            )
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              getDate(),
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: white,
              ),
            ),
            Text(
              getCity(),
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: white,
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget buildWidget() {
    if (_weatherObj == null) {
      return const Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            color: white,
          ),
        ],
      );
    }

    return getWeatherWidget();
  }

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: divWidth,
      child: Container(
        height: 75,
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        decoration: const BoxDecoration(
          color: darkBlue,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          boxShadow: [
            BoxShadow(
              color: shadowBlack,
              blurRadius: 15,
              spreadRadius: .25,
            )
          ],
        ),
        child: buildWidget(),
      ),
    );
  }
}
