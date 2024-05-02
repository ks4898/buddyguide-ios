import 'package:flutter/material.dart';
import 'package:project/customs/page_heading.dart';
import 'package:project/customs/feed_image.dart';
import 'package:project/data/feed_data.dart';
import 'package:project/enums/style_constants.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List images = FeedPost().images;

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
          ],
        ),
      ),
    );
  }
}
