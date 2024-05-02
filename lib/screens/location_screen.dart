import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:project/customs/weather_widget.dart';
import 'package:project/data/spots_data.dart';
import 'package:project/data/response_data.dart';
import 'package:project/enums/style_constants.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() {
    return _LocationScreenState();
  }
}

class _LocationScreenState extends State<LocationScreen> {
  Position? currPosition;
  List<Location> innerListSpots = [];
  List<List<Location>> nestedListSpots = [];
  List<Location> innerListRes = [];
  List<List<Location>> nestedListRes = [];
  BitmapDescriptor userMarker = BitmapDescriptor.defaultMarker;

  @override
  void initState() {
    super.initState();
    getCurrentPosition();
    createCustomMarker();

    for (Map map in SpotsData().getMap) {
      setLatLngS(map["map_name"] as String);
    }

    for (Map map in ResponseData().responseList) {
      setLatLngR(map["loc"] as String);
    }
  }

  void getCurrentPosition() async {
    Position position = await determinePosition();
    setState(() {
      currPosition = position;
    });
  }

  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

  Future<List<Location>> getLatLngS(String address) async {
    return await locationFromAddress(address);
  }

  void setLatLngS(String address) async {
    List<Location> tempList = await getLatLngS(address);
    setState(() {
      innerListSpots = tempList;
      nestedListSpots.add(innerListSpots);
    });
  }

  Future<List<Location>> getLatLngR(String address) async {
    return await locationFromAddress(address);
  }

  void setLatLngR(String address) async {
    List<Location> tempList = await getLatLngR(address);
    setState(() {
      innerListRes = tempList;
      nestedListRes.add(innerListRes);
    });
  }

  void createCustomMarker() {
    BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(), "assets/media/user_location.png")
        .then((marker) {
      setState(() {
        userMarker = marker;
      });
    });
  }

  Widget buildMap() {
    if (currPosition == null) {
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

    //double lat = currPosition!.latitude;
    //double lng = currPosition!.longitude;

    double lat = 43.5147;
    double lng = 16.4435;

    return GoogleMap(
      zoomControlsEnabled: false,
      initialCameraPosition: CameraPosition(
          target: LatLng(
            lat,
            lng,
          ),
          zoom: 14),
      markers: {
        Marker(
          markerId: const MarkerId(
            "Me",
          ),
          position: LatLng(
            lat,
            lng,
          ),
          icon: userMarker,
        ),
        for (var i = 0; i < nestedListSpots.length; i++)
          Marker(
            markerId: MarkerId(
              SpotsData().getMap[i]["map_name"] as String,
            ),
            position: LatLng(
              nestedListSpots[i][0].latitude,
              nestedListSpots[i][0].longitude,
            ),
            icon: BitmapDescriptor.defaultMarkerWithHue(
              100,
            ),
          ),
        for (var i = 0; i < nestedListRes.length; i++)
          Marker(
            markerId: MarkerId(ResponseData().responseList[i]["loc"] as String),
            position: LatLng(
              nestedListRes[i][0].latitude,
              nestedListRes[i][0].longitude,
            ),
          ),
      },
    );
  }

  @override
  Widget build(BuildContext context) {
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
            buildMap(),
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
