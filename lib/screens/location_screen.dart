import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:project/customs/weather_widget.dart';
import 'package:project/data/spots_data.dart';
import 'package:project/data/response_data.dart';
import 'package:project/enums/style_constants.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    final defaultLatitude = 43.5147;
    final defaultLongitude = 16.4435;

    final List<Map<String, dynamic>> spotsData = SpotsData().getMap;
    final List<Map<String, dynamic>> responseData = ResponseData().responseList;

    final userMarker = BitmapDescriptor.defaultMarker;

    return Center(
      child: Container(
        decoration: const BoxDecoration(
          color: gLightBlue,
        ),
        child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            GoogleMap(
              zoomControlsEnabled: false,
              initialCameraPosition: CameraPosition(
                target: LatLng(defaultLatitude ?? 0, defaultLongitude ?? 0),
                zoom: 14,
              ),
              markers: {
                Marker(
                  markerId: const MarkerId("Me"),
                  position: LatLng(defaultLatitude ?? 0, defaultLongitude ?? 0),
                  icon: userMarker,
                ),
                for (var spot in spotsData)
                  if (spot["latitude"] != null && spot["longitude"] != null)
                    Marker(
                      markerId: MarkerId(spot["map_name"] as String),
                      position: LatLng(
                        spot["latitude"] as double,
                        spot["longitude"] as double,
                      ),
                      icon: BitmapDescriptor.defaultMarkerWithHue(100),
                    ),
                for (var response in responseData)
                  if (response["latitude"] != null && response["longitude"] != null)
                    Marker(
                      markerId: MarkerId(response["loc"] as String),
                      position: LatLng(
                        response["latitude"] as double,
                        response["longitude"] as double,
                      ),
                    ),
              },
            ),
            const Positioned(
              bottom: 45,
              width: 380,
              child: WeatherWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
