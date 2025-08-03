import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var deviceWidth = MediaQuery.of(context).size.width;
    var deviceHeight = MediaQuery.of(context).size.height;

    return Container(
      height: deviceHeight,
      width: deviceWidth,
      color: const Color.fromRGBO(254, 149, 11, 1),
      child: Center(child: Text("Onboarding Screen")),
    );
  }
}
