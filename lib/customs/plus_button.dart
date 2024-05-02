import 'package:flutter/material.dart';
import 'package:project/enums/style_constants.dart';
import 'package:google_fonts/google_fonts.dart';

class PlusButton extends StatelessWidget {
  final void Function() onClick;

  const PlusButton({super.key, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      right: 0,
      child: SizedBox(
        width: 35,
        height: 35,
        child: ElevatedButton(
          onPressed: onClick,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(0),
            foregroundColor: white,
            backgroundColor: gLightBlue,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
          child: Text(
            "+",
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
