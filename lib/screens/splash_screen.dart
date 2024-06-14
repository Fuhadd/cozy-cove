import 'package:cozy_cove/constants/custom_string.dart';
import 'package:cozy_cove/utils/spacers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'onboarding/onboading_page_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

    // Future.delayed(const Duration(seconds: 3), () {
    //   Navigator.pushReplacementNamed(
    //       context, OnboardingPageViewScreen.routeName);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                ConstantString.splashScreenWithBg,
                fit: BoxFit.cover,
                height: 130.h,
              ),
              verticalSpacer(10),
              Text(
                "Cozy Cove",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20.sp),
              )
            ],
          ),
        ),
      ),
    );
  }
}
