import 'package:flutter/material.dart';
import 'package:project/customs/plus_button.dart';
import 'package:project/enums/style_constants.dart';
import 'package:google_fonts/google_fonts.dart';

class LandingDiv extends StatelessWidget {
  final void Function() toSpots;

  const LandingDiv({super.key, required this.toSpots});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: divWidth,
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 50,
              horizontal: 25,
            ),
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage(
                  "assets/media/home_bg.png",
                ),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(
                10,
              ),
              boxShadow: const [
                BoxShadow(
                  color: shadowBlack,
                  blurRadius: 15,
                  spreadRadius: .25,
                )
              ],
            ),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(
                    20,
                  ),
                  decoration: BoxDecoration(
                    color: oDarkBlue,
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: shadowBlack,
                        blurRadius: 15,
                        spreadRadius: .25,
                      )
                    ],
                  ),
                  child: Column(
                    children: [
                      Text(
                        "Welcome",
                        style: GoogleFonts.poppins(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'Some introduction text about Split will go here.'
                        ' This text is just dummy text for testing purposes.',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          PlusButton(onClick: toSpots)
        ],
      ),
    );
  }
}
