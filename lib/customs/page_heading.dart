import 'package:flutter/material.dart';
import 'package:project/enums/style_constants.dart';
import 'package:google_fonts/google_fonts.dart';

class PageHeading extends StatelessWidget {
  final String title, description;

  const PageHeading(this.title, this.description, {super.key});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: divWidth,
      child: Container(
        margin: const EdgeInsets.only(
          bottom: 30,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 12.5,
          horizontal: 20,
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
            ]),
        child: Column(
          children: [
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: white,
              ),
            ),
            Text(
              description,
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
