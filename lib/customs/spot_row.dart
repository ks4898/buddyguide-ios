import 'package:flutter/material.dart';
import 'package:project/enums/style_constants.dart';
import 'package:google_fonts/google_fonts.dart';

class SpotRow extends StatelessWidget {
  final String title, description, imgPath;
  final int index;

  const SpotRow(this.title, this.description, this.imgPath,
      {super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    bool isEven = index % 2 == 0;

    return Container(
      margin: EdgeInsets.only(
        bottom: index != 9 ? 50 : 0,
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
            spreadRadius: .25,
          )
        ],
      ),
      child: Row(
        textDirection: isEven ? TextDirection.ltr : TextDirection.rtl,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: 130,
            height: 130,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  imgPath,
                ),
              ),
              borderRadius: BorderRadius.circular(
                10,
              ),
              boxShadow: [
                BoxShadow(
                  color: shadowBlack,
                  blurRadius: 10,
                  spreadRadius: 0.25,
                  offset: Offset(
                    isEven ? 10 : -10,
                    0,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: white,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    top: 5,
                  ),
                  child: SizedBox(
                    width: 125,
                    height: 30,
                    child: ElevatedButton(
                      onPressed: () {
                        showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: darkBlue,
                          context: context,
                          builder: (context) {
                            return Center(
                              heightFactor: .95,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * .75,
                                    height: MediaQuery.of(context).size.height *
                                        .35,
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
                                            blurRadius: 25,
                                            spreadRadius: .25),
                                      ],
                                      borderRadius: BorderRadius.circular(
                                        10,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(
                                      top: 10,
                                    ),
                                    child: Column(
                                      children: [
                                        Text(
                                          title,
                                          style: GoogleFonts.poppins(
                                            fontSize: 32,
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
                                  )
                                ],
                              ),
                            );
                          },
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: gLightBlue),
                      child: Text(
                        "Learn More",
                        style: GoogleFonts.poppins(
                          fontSize: 12,
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
        ],
      ),
    );
  }
}
