import 'package:cozy_cove/constants/custom_colors.dart';
import 'package:cozy_cove/constants/custom_string.dart';
import 'package:cozy_cove/screens/dashboard/bottom_navigation_screen.dart';
import 'package:cozy_cove/utils/spacers.dart';
import 'package:cozy_cove/widgets/new_custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PushNotificationScreen extends StatefulWidget {
  static const routeName = '/PushNotificationScreen';
  const PushNotificationScreen({super.key});

  @override
  State<PushNotificationScreen> createState() => _PushNotificationScreenState();
}

class _PushNotificationScreenState extends State<PushNotificationScreen> {
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
                ConstantString.bell,
              ),
              verticalSpacer(100),
              SizedBox(
                // height: 100,
                child: Column(
                  children: [
                    const AnimatedSwitcher(
                      duration: Duration(milliseconds: 300),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Push Notifications',
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
                  title: "Allow Notifications",
                  onTap: () {
                    Navigator.pushReplacementNamed(
                        context, BottomNavigationScreen.routeName);
                  }),
              verticalSpacer(15),

              GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(
                      context, BottomNavigationScreen.routeName);
                },
                child: const Text(
                  "Not right now",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: CustomColors.mainBlueColor,
                      decoration: TextDecoration.underline),
                ),
              ),
              // verticalSpacer(30),
            ],
          ),
        ),
      ),
    );
  }
}
