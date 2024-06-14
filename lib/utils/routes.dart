import 'package:cozy_cove/screens/authentication/sign_in/biometrics_screen.dart';
import 'package:cozy_cove/screens/authentication/sign_in/health_goals_screen.dart';
import 'package:cozy_cove/screens/authentication/sign_in/hobbies_screen.dart';
import 'package:cozy_cove/screens/authentication/sign_in/know_you_screen.dart';
import 'package:cozy_cove/screens/authentication/sign_in/push_notification_screen.dart';
import 'package:cozy_cove/screens/authentication/sign_in/rate_health_screen.dart';
import 'package:cozy_cove/screens/authentication/sign_in/pseudonym_input_screen.dart';
import 'package:cozy_cove/screens/authentication/sign_in/sign_up_success_screen.dart';
import 'package:cozy_cove/screens/authentication/sign_up/forgot_password_screen.dart';
import 'package:cozy_cove/screens/authentication/sign_up/sign_in_screen.dart';
import 'package:cozy_cove/screens/dashboard/bottom_navigation_screen.dart';
import 'package:cozy_cove/screens/onboarding/onboading_page_view.dart';

var appRoutes = {
  OnboardingPageViewScreen.routeName: (context) =>
      const OnboardingPageViewScreen(),
  BiometricsScreen.routeName: (context) => const BiometricsScreen(),
  PseudonyminputScreen.routeName: (context) => const PseudonyminputScreen(),
  BottomNavigationScreen.routeName: (context) => const BottomNavigationScreen(),
  SignInScreen.routeName: (context) => const SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => const ForgotPasswordScreen(),
  // KnowYouScreen.routeName: (context) => const KnowYouScreen(),
  // HealthGoalScreen.routeName: (context) => const HealthGoalScreen(),
  // HobbiesScreen.routeName: (context) => const HobbiesScreen(),
  // SignUpSuccessScreen.routeName: (context) => const SignUpSuccessScreen(),
  PushNotificationScreen.routeName: (context) => const PushNotificationScreen(),
};
