import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/customs/user_response.dart';
import 'package:project/data/response_data.dart';
import 'package:project/enums/style_constants.dart';

class WasteScreen extends StatefulWidget {
  const WasteScreen({super.key});

  @override
  State<WasteScreen> createState() {
    return _WasteScreenState();
  }
}

class _WasteScreenState extends State<WasteScreen> {
  String currOption = radioOptions[0], selectedOption = "";
  final textController = TextEditingController();

  void getSelectedOption(String? radioValue) {
    setState(() {
      selectedOption = radioValue!;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> respList = ResponseData().responseList;

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FractionallySizedBox(
            widthFactor: divWidth,
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
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
              child: Text(
                "No Waste? No Problem.",
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          FractionallySizedBox(
            widthFactor: divWidth,
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
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
                children: [
                  Container(
                    width: 150,
                    height: 150,
                    margin: const EdgeInsets.only(
                      bottom: 5,
                    ),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          "assets/media/stop_landfill.png",
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      bottom: 5,
                    ),
                    child: Text(
                      "Make Sure To Let Us Know",
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: white,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 145,
                    height: 35,
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
                                    Text(
                                      "Tells us where and in what kind of state you found this waste.",
                                      style: GoogleFonts.poppins(
                                        fontSize: 20,
                                        color: white,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    FractionallySizedBox(
                                      widthFactor: .85,
                                      child: TextFormField(
                                        autofocus: true,
                                        validator: (input) {
                                          if (input == null || input.isEmpty) {
                                            return "Field cannot be empty.";
                                          }

                                          return null;
                                        },
                                        controller: textController,
                                        style: GoogleFonts.poppins(
                                          fontSize: 18,
                                          color: white,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        for (String option in radioOptions)
                                          FractionallySizedBox(
                                            widthFactor: .9,
                                            child: ListTile(
                                              title: Text(
                                                option,
                                                style: GoogleFonts.poppins(
                                                  fontSize: 18,
                                                  color: white,
                                                ),
                                              ),
                                              leading: Radio(
                                                value: option,
                                                groupValue: currOption,
                                                onChanged: getSelectedOption,
                                                activeColor: gLightBlue,
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 25,
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          ResponseData().addResponse(
                                            textController.text,
                                            selectedOption,
                                          );
                                        });

                                        textController.clear();
                                        Navigator.pop(context);
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: gLightBlue,
                                      ),
                                      child: Text(
                                        "Submit",
                                        style: GoogleFonts.poppins(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: gLightBlue,
                      ),
                      child: Text(
                        "Get Started",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          FractionallySizedBox(
            widthFactor: divWidth,
            child: SizedBox(
              height: 150,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 12.5,
                  horizontal: 25,
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
                  children: [
                    Text(
                      "Your Responses",
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: white,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 75,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            if (respList.isEmpty)
                              Container(
                                margin: const EdgeInsets.only(
                                  top: 20,
                                ),
                                child: Text(
                                  "You have ${respList.length} responses.",
                                  style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    color: white,
                                  ),
                                ),
                              )
                            else
                              for (Map data in respList)
                                UserResponse(
                                  location: data["loc"] as String,
                                  option: data["opt"] as String,
                                )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
