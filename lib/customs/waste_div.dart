import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/enums/style_constants.dart';

class WasteDiv extends StatelessWidget {
  final void Function() toWaste;

  const WasteDiv({super.key, required this.toWaste});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: divWidth,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 32.5,
        ),
        decoration: BoxDecoration(
          color: darkBlue,
          boxShadow: const [
            BoxShadow(
              color: shadowBlack,
              blurRadius: 15,
              spreadRadius: .25,
            )
          ],
          borderRadius: BorderRadius.circular(
            10,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Help Protect The Environment",
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: white,
              ),
              textAlign: TextAlign.center,
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 10,
              ),
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: shadowBlack,
                    blurRadius: 15,
                    spreadRadius: .25,
                  )
                ],
              ),
              child: SizedBox(
                width: 145,
                height: 35,
                child: ElevatedButton(
                  onPressed: toWaste,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: gLightBlue,
                  ),
                  child: Text(
                    "Learn More",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: white,
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
