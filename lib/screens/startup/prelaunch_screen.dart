import 'package:cozy_cove/screens/authentication/sign_up/sign_in_screen.dart';
import 'package:cozy_cove/screens/onboarding/onboading_page_view.dart';
import 'package:cozy_cove/screens/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../dashboard/dashboard_screen.dart';

class PrelaunchScreen extends StatefulWidget {
  const PrelaunchScreen({super.key});

  @override
  State<PrelaunchScreen> createState() => _PrelaunchScreenState();
}

class _PrelaunchScreenState extends State<PrelaunchScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SplashScreen();
          } else if (snapshot.hasData) {
            return const SignInScreen();
          } else {
            return const OnboardingPageViewScreen();
          }
        });
  }
}
