import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:project/main_skeleton.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  runApp(MainSkeleton(cameraList: cameras));
}
