import 'package:cozy_cove/constants/custom_colors.dart';
import 'package:cozy_cove/constants/custom_string.dart';
import 'package:cozy_cove/utils/spacers.dart';
import 'package:flutter/material.dart';

class FirstOnboardingPage extends StatelessWidget {
  static const routeName = '/firstOnboardingScreen';
  const FirstOnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Image.asset(
            ConstantString.mentalWellness,
          ),
        ),
        verticalSpacer(30),
        SizedBox(
          // height: 100,
          child: Column(
            children: [
              const AnimatedSwitcher(
                duration: Duration(milliseconds: 300),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    'Welcome to your mental wellness buddy',
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
                      'Discover a safe & supportive space for your mental wellness journey.',
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
