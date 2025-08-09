import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fmdt_quiz_app/screens/about_me_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var deviceWidth = MediaQuery.of(context).size.width;
    var deviceHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        height: deviceHeight,
        width: deviceWidth,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SvgPicture.asset("assets/images/onboarding.svg"),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text(
                    "Quizzia helps you challenge and assess your knowledge in any field of study",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Original Surfer",
                      color: Colors.black,
                      decoration: TextDecoration.none,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text(
                    "We’ve got various categories of quizzes, including mathematics, science, anime, books, music and so much more. Let’s get started now",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Raleway",
                      height: 1.7,
                      color: Colors.black,
                      decoration: TextDecoration.none,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),

            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AboutMeScreen()),
                    );
                  },
                  child: Container(
                    width: deviceWidth,
                    height: deviceHeight * 0.07,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(254, 149, 11, 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text(
                      "Get Started",
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
                Container(
                  margin: EdgeInsets.only(top: 15),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: "By clicking Get Started, you agree to our ",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Original Surfer",
                            color: Colors.black,
                            decoration: TextDecoration.none,
                            height: 1.7,
                          ),
                        ),
                        TextSpan(
                          text: "Terms of Service ",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Original Surfer",
                            color: Colors.black,
                            decoration: TextDecoration.none,
                            height: 1.7,
                          ),
                        ),
                        TextSpan(
                          text: "and ",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Original Surfer",
                            color: Colors.black,
                            decoration: TextDecoration.none,
                            height: 1.7,
                          ),
                        ),
                        TextSpan(
                          text: "Privacy Policy",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Original Surfer",
                            color: Colors.black,
                            decoration: TextDecoration.none,
                            height: 1.7,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
