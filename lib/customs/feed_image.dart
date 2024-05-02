import 'package:flutter/material.dart';
import 'package:project/enums/style_constants.dart';

class FeedImage extends StatelessWidget {
  final String imgPath;
  final bool isLast;

  const FeedImage({super.key, required this.imgPath, required this.isLast});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: Container(
        height: 175,
        margin: EdgeInsets.only(
          bottom: !isLast ? 35 : 0,
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              imgPath,
            ),
            fit: BoxFit.cover,
          ),
          boxShadow: const [
            BoxShadow(
              color: shadowBlack,
              blurRadius: 15,
              spreadRadius: 0.25,
            )
          ],
          border: Border.all(
            color: darkBlue,
            width: 5,
          ),
          borderRadius: BorderRadius.circular(
            10,
          ),
        ),
      ),
    );
  }
}
