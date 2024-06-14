import 'package:cozy_cove/constants/custom_colors.dart';
import 'package:cozy_cove/constants/custom_string.dart';
import 'package:cozy_cove/utils/spacers.dart';
import 'package:flutter/material.dart';

class ThirdOnboardingPage extends StatelessWidget {
  static const routeName = '/thirdOnboardingScreen';
  const ThirdOnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Image.asset(
            ConstantString.startConvo,
            height: 150,
          ),
        ),
        SizedBox(
          // height: 100,
          child: Column(
            children: [
              const AnimatedSwitcher(
                duration: Duration(milliseconds: 300),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    'Start a conversation with our AI chatbot & Counsellors',
                    // key: ValueKey<String>(titleTexts[_currentPage]),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                        color: CustomColors.blackTextColor),
                  ),
                ),
              ),
              verticalSpacer(10),
              const SizedBox(
                width: double.infinity,
                child: AnimatedSwitcher(
                  duration: Duration(milliseconds: 300),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      'Engage in confidential chat sessions with our AI chatbot & chosen counsellor to receive support.',
                      // key: ValueKey<String>(subTitleTexts[_currentPage]),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          // fontWeight: FontWeight.w00,
                          fontSize: 14,
                          height: 1.4,
                          color: CustomColors.greyTextColor),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
