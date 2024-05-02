import 'dart:io';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:path_provider/path_provider.dart';
import 'package:project/customs/page_heading.dart';
import 'package:project/customs/feed_image.dart';
import 'package:project/data/feed_data.dart';
import 'package:project/enums/style_constants.dart';

class FeedScreen extends StatefulWidget {
  final List<CameraDescription> cameraList;

  const FeedScreen({super.key, required this.cameraList});

  @override
  State<FeedScreen> createState() {
    return _FeedScreenState();
  }
}

class _FeedScreenState extends State<FeedScreen> {
  int index = 0;
  late CameraController cameraController;
  bool isOn = false;
  String? imgPath;

  @override
  void initState() {
    super.initState();
    initController(index);
  }

  void initController(int i) {
    cameraController = CameraController(
      widget.cameraList[i],
      ResolutionPreset.medium,
    );

    cameraController.initialize().then((_) {
      if (!mounted) {
        return;
      }

      setState(() {});
    });
  }

  void initCamera() {
    setState(() {
      if (isOn) {
        isOn = false;
      } else {
        isOn = true;
      }
    });
  }

  void switchCamera() {
    setState(() {
      if (index == 0) {
        index = 1;
      } else {
        index = 0;
      }
    });

    initController(index);
  }

  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }

  void takePicture() async {
    if (!cameraController.value.isInitialized) {
      return;
    }

    final Directory extDir = await getApplicationDocumentsDirectory();
    final String dirPath = "${extDir.path}/Pictures/flutter_test";
    await Directory(dirPath).create(recursive: true);
    final String filePath = "$dirPath/${DateTime.now()}.jpg";

    try {
      await cameraController.takePicture();
    } catch (e) {
      return;
    }

    if (mounted) {
      setState(() {
        imgPath = filePath;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // FeedPost().addNewImg("");
    List images = FeedPost().images;

    if (!isOn) {
      return Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 30,
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const PageHeading(
                "Leave Your Mark",
                "Post your favorite memory...",
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .415,
                child: SingleChildScrollView(
                  child: Center(
                    child: FractionallySizedBox(
                      widthFactor: divWidth,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          for (var i = 0; i < images.length; i++)
                            FeedImage(
                              imgPath: images[i],
                              isLast: i == images.length - 1,
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              FractionallySizedBox(
                widthFactor: divWidth,
                child: Container(
                  margin: const EdgeInsets.only(
                    top: 30,
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: darkBlue,
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: shadowBlack,
                        blurRadius: 15,
                        spreadRadius: 0.25,
                      )
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: initCamera,
                        child: const Icon(
                          Icons.camera,
                          size: 50,
                          color: white,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );
    } else {
      return Center(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Expanded(
              child: CameraPreview(
                cameraController,
              ),
            ),
            Positioned(
              top: 25,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 50,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: initCamera,
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(
                            0,
                          ),
                        ),
                        child: const Icon(
                          Icons.close,
                          size: 30,
                          color: darkBlue,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 50,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: switchCamera,
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(
                            0,
                          ),
                        ),
                        child: const Icon(
                          Icons.cameraswitch,
                          size: 30,
                          color: darkBlue,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 25,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 75,
                    height: 75,
                    child: ElevatedButton(
                      onPressed: takePicture,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(
                          0,
                        ),
                      ),
                      child: const Icon(
                        Icons.camera,
                        size: 65,
                        color: darkBlue,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }
  }
}
