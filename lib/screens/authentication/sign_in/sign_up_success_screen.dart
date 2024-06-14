import 'package:cozy_cove/constants/custom_colors.dart';
import 'package:cozy_cove/constants/custom_string.dart';
import 'package:cozy_cove/screens/authentication/sign_in/biometrics_screen.dart';
import 'package:cozy_cove/screens/authentication/sign_in/push_notification_screen.dart';
import 'package:cozy_cove/utils/spacers.dart';
import 'package:cozy_cove/widgets/new_custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SignUpSuccessScreen extends StatefulWidget {
  final String pseudonym;
  // password;

  // final String? healthDetails,
  //     primaryHealthGoal,
  //     secondaryHealthGoal,
  //     hobbyDetails,
  //     hobby;
  // final int? currentHealth, healthGoal;
  // final List<String>? selectedInterests;
  static const routeName = '/SignUpSuccessScreen';
  const SignUpSuccessScreen({
    super.key,
    required this.pseudonym,
    // required this.password,
    // this.currentHealth,
    // this.healthDetails,
    // this.healthGoal,
    // this.primaryHealthGoal,
    // this.secondaryHealthGoal,
    // this.hobbyDetails,
    // this.hobby,
    // this.selectedInterests,
  });

  @override
  State<SignUpSuccessScreen> createState() => _SignUpSuccessScreenState();
}

class _SignUpSuccessScreenState extends State<SignUpSuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.whiteColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              verticalSpacer(40),
              // const GetHelpRow(),
              SvgPicture.asset(
                ConstantString.partyPopper,
              ),
              verticalSpacer(100),
              SizedBox(
                // height: 100,
                child: Column(
                  children: [
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'You are all set, ${widget.pseudonym}!',
                          // key: ValueKey<String>(titleTexts[_currentPage]),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 24,
                              color: CustomColors.blackTextColor),
                        ),
                      ),
                    ),
                    verticalSpacer(10),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: SizedBox(
                        width: double.infinity,
                        child: AnimatedSwitcher(
                          duration: Duration(milliseconds: 300),
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Text(
                              'You have successfully completed all the necessary steps required. We are glad to have you on board.',
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
                    ),
                  ],
                ),
              ),

              verticalSpacer(40),

              NewCustomButton(
                  title: "Continue",
                  onTap: () {
                    Navigator.pushNamed(context, BiometricsScreen.routeName);
                  }),
              verticalSpacer(30),
            ],
          ),
        ),
      ),
    );
  }
}
