import 'package:flutter/material.dart';
import 'package:project/customs/plus_button.dart';
import 'package:project/enums/style_constants.dart';

class SectionDiv extends StatelessWidget {
  final String title, imgPath;
  final void Function() toSection;

  const SectionDiv(this.title, this.imgPath,
      {super.key, required this.toSection});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 145,
      height: 132.5,
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
      child: Center(
        child: Stack(
          children: [
            PlusButton(
              onClick: toSection,
            ),
            Positioned(
              top: 32.5,
              left: 45,
              child: Image.asset(
                imgPath,
                width: 55,
                height: 55,
              ),
            ),
            Positioned(
              bottom: 5,
              left: 10,
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
