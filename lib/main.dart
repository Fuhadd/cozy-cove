import 'package:cozy_cove/constants/custom_colors.dart';
import 'package:cozy_cove/firebase_options.dart';
import 'package:cozy_cove/locator.dart';
import 'package:cozy_cove/screens/authentication/sign_in/quests_onboard_screen.dart';
import 'package:cozy_cove/screens/authentication/sign_up/sign_in_screen.dart';
import 'package:cozy_cove/screens/onboarding/onboading_page_view.dart';
import 'package:cozy_cove/screens/reclaim_sdk_test.dart';
import 'package:cozy_cove/screens/solana_wallet.dart';
import 'package:cozy_cove/screens/splash_screen.dart';
import 'package:cozy_cove/screens/startup/prelaunch_screen.dart';
import 'package:cozy_cove/utils/navigator_handler.dart';
import 'package:cozy_cove/utils/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:solana_wallets_flutter/solana_wallets_flutter.dart';

void main() async {
  // initSolanaWallets();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await setupLocator();
  // FlutterBranchSdk.validateSDKIntegration();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return
        //
        // MaterialApp(
        //     home: Scaffold(
        //       appBar: AppBar(
        //         title: const Text('Solana Wallets Flutter'),
        //         actions: const [AboutButton()],
        //       ),
        //       body: const Center(child: SelectButton()),
        //     ),
        //   );

        ScreenUtilInit(
      designSize: const Size(375, 812),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        navigatorKey: locator<NavigationHandler>().navigatorKey,
        theme: ThemeData(
          useMaterial3: true,
          fontFamily: 'Mulish',
          colorScheme: ColorScheme.fromSeed(seedColor: CustomColors.whiteColor)
              .copyWith(background: CustomColors.whiteColor),
        ),
        home: const PrelaunchScreen(),

        //  StreamBuilder<User?>(
        //     stream: FirebaseAuth.instance.authStateChanges(),
        //     builder: (context, snapshot) {
        //       if (!mounted) {
        //         return const SizedBox
        //             .shrink(); // Return an empty widget if not mounted
        //       }
        //       if (snapshot.connectionState == ConnectionState.waiting) {
        //         return const SplashScreen();
        //       } else if (snapshot.hasData) {
        //         return const SignInScreen();
        //       } else {
        //         return const OnboardingPageViewScreen();
        //       }
        //     }),

        // const QuestOnboardScreen(),
        // const MyHomePage(
        //   title: "Reclaim",
        // ),

        // const OnboardingPageViewScreen(),
        routes: appRoutes,
      ),
    );
  }
}
