import 'package:cozy_cove/constants/custom_string.dart';
import 'package:flutter/material.dart';

class FourthOnboardingPage extends StatelessWidget {
  static const routeName = '/firstOnboardingScreen';
  const FourthOnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Image.asset(
            ConstantString.getStarted,
          ),
        ),
      ],
    );
  }
}
