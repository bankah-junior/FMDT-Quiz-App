import 'package:flutter/material.dart';
import 'package:fmdt_quiz_app/screens/home_screen.dart';

class AboutMeScreen extends StatefulWidget {
  const AboutMeScreen({super.key});

  @override
  State<AboutMeScreen> createState() => _AboutMeScreenState();
}

class _AboutMeScreenState extends State<AboutMeScreen> {
  final _formKey = GlobalKey<FormState>();
  var deviceHeight = 0.0;
  var deviceWidth = 0.0;

  TextEditingController firstNameController = TextEditingController();
  TextEditingController otherNamesController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  bool isSubmitting = false;

  @override
  Widget build(BuildContext context) {
    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;

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

                  // Submit Button
                  cButton(
                    text: "Submit",
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
    final focusNode = FocusNode();
    return StatefulBuilder(
      builder: (context, setState) {
        focusNode.addListener(() {
          setState(() {});
        });
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //
            Text(
              label,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                fontFamily: "Raleway",
              ),
            ),
            const SizedBox(height: 6),

            //
            TextFormField(
              controller: controller,
              focusNode: focusNode,
              maxLines: maxLines,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  fontFamily: "Raleway",
                ),
                filled: true,
                fillColor: focusNode.hasFocus
                    ? const Color.fromRGBO(254, 149, 11, 0.1)
                    : const Color.fromRGBO(244, 244, 244, 1),
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
      },
    );
  }

  Widget cButton({required String text, required VoidCallback onPressed}) {
    return SizedBox(
      width: deviceWidth,
      height: deviceHeight * 0.07,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isSubmitting
              ? Color.fromRGBO(254, 149, 11, 1)
              : Color.fromRGBO(171, 176, 188, 1),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        onPressed: onPressed,
        child: Text(
          text,
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
    );
  }
}
