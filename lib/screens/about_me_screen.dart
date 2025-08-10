import 'package:flutter/material.dart';
import 'package:fmdt_quiz_app/screens/home_screen.dart';

class AboutMeScreen extends StatefulWidget {
  const AboutMeScreen({super.key});

  @override
  State<AboutMeScreen> createState() => _AboutMeScreenState();
}

class _AboutMeScreenState extends State<AboutMeScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController firstNameController = TextEditingController();
  TextEditingController otherNamesController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  bool isSubmitting = false;

  @override
  Widget build(BuildContext context) {
    var deviceHeight = MediaQuery.of(context).size.height;
    var deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "About Me",
          style: TextStyle(
            color: Colors.black,
            fontFamily: "Raleway",
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Container(
              height: deviceHeight,
              width: deviceWidth,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /*//
                          const Text(
                            "Enter your first name",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Raleway",
                            ),
                          ),
                          const SizedBox(height: 6),
                          TextFormField(
                            controller: firstNameController,
                            decoration: InputDecoration(
                              hintText: "First Name",
                              hintStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                fontFamily: "Raleway",
                              ),
                              filled: true,
                              fillColor: const Color.fromRGBO(244, 244, 244, 1),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 14,
                                vertical: 12,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide.none,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(
                                  color: Colors.orange,
                                  width: 1.5,
                                ),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter first name";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 24),

                          //
                          const Text(
                            "Enter your other names",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Raleway",
                            ),
                          ),
                          const SizedBox(height: 6),
                          TextFormField(
                            controller: otherNamesController,
                            decoration: InputDecoration(
                              hintText: "Other Names",
                              hintStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                fontFamily: "Raleway",
                              ),
                              filled: true,
                              fillColor: const Color.fromRGBO(244, 244, 244, 1),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 14,
                                vertical: 12,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide.none,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(
                                  color: Color.fromRGBO(254, 149, 11, 1),
                                  width: 1.5,
                                ),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter other names";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 24),

                          //
                          const Text(
                            "Describe yourself",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Raleway",
                            ),
                          ),
                          const SizedBox(height: 6),
                          TextFormField(
                            controller: descriptionController,
                            maxLines: 5,
                            decoration: InputDecoration(
                              hintText:
                                  "Briefly describe yourself and your interests",
                              hintStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                fontFamily: "Raleway",
                              ),
                              filled: true,
                              fillColor: const Color.fromRGBO(244, 244, 244, 1),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 14,
                                vertical: 12,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide.none,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(
                                  color: Color.fromRGBO(254, 149, 11, 1),
                                  width: 1.5,
                                ),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please describe yourself";
                              }
                              return null;
                            },
                          ),
                          */

                          // First Name Field
                          cTextField(
                            label: "Enter your first name",
                            controller: firstNameController,
                            hintText: "First Name",
                            validator: "Please enter first name",
                          ),

                          // Other Name Field
                          cTextField(
                            label: "Enter your other names",
                            controller: otherNamesController,
                            hintText: "Other Names",
                            validator: "Please enter other names",
                          ),

                          // Description Field
                          cTextField(
                            label: "Describe yourself",
                            controller: descriptionController,
                            hintText:
                                "Briefly describe yourself and your interests",
                            validator: "Please describe yourself",
                            maxLines: 5,
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Button at bottom
                  SizedBox(
                    width: deviceWidth,
                    height: deviceHeight * 0.07,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isSubmitting
                            ? Color.fromRGBO(254, 149, 11, 1)
                            : Color.fromRGBO(171, 176, 188, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            isSubmitting = true;
                          });
                          Future.delayed(const Duration(seconds: 2), () {
                            setState(() {
                              isSubmitting = false;
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomeScreen(),
                                ),
                              );
                            });
                          });
                        }
                      },
                      child: const Text(
                        "Submit",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          fontFamily: "Raleway",
                          color: Colors.white,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget cTextField({
    required String label,
    required TextEditingController controller,
    required String hintText,
    required String validator,
    int maxLines = 1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            fontFamily: "Raleway",
          ),
        ),
        const SizedBox(height: 6),
        TextFormField(
          controller: controller,
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              fontFamily: "Raleway",
            ),
            filled: true,
            fillColor: const Color.fromRGBO(244, 244, 244, 1),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 12,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Color.fromRGBO(254, 149, 11, 1),
                width: 1.5,
              ),
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return validator;
            }
            return null;
          },
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
