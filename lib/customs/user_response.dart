import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/enums/style_constants.dart';

class UserResponse extends StatelessWidget {
  final String location, option;
  const UserResponse({super.key, required this.location, required this.option});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 75,
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      decoration: BoxDecoration(
        color: gDarkBlue,
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            location,
            style: GoogleFonts.poppins(
              fontSize: 16,
              color: white,
            ),
          ),
          Text(
            option,
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: white,
            ),
          ),
        ],
      ),
    );
  }
}
