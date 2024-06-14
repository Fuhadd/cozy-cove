import 'package:cozy_cove/constants/custom_colors.dart';
import 'package:cozy_cove/constants/custom_string.dart';
import 'package:cozy_cove/screens/dashboard/bottom_navigation_screen.dart';
import 'package:cozy_cove/utils/spacers.dart';
import 'package:cozy_cove/widgets/authentication_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:local_auth/local_auth.dart';

class BiometricsScreen extends StatefulWidget {
  static const routeName = '/BiometricsScreen';
  const BiometricsScreen({super.key});

  @override
  State<BiometricsScreen> createState() => _BiometricsScreenState();
}

class _BiometricsScreenState extends State<BiometricsScreen> {
  final TextEditingController phoneController = TextEditingController();

  String mobileNumberDialCode = "";
  String mobileNumber = "";
  String completeMobileNumber = "";
  String password = "";
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;
  @override
  Widget build(BuildContext context) {
    return AuthFormWidget(
        buttonText: "Allow",
        title: "Biometrics",
        removePadding: true,
        subTitle: "Complete your biometrics for more security.",
        child: Center(
          child: SvgPicture.asset(
            ConstantString.biometricWithCircle,
            color: CustomColors.mainBlueColor,
          ),
        ),
        onSkipButtonTap: () {
          Navigator.pushNamed(context, BottomNavigationScreen.routeName);
        },
        onButtonTap: () async {
          try {
            final LocalAuthentication auth = LocalAuthentication();

            final bool canAuthenticateWithBiometrics =
                await auth.canCheckBiometrics;
            final bool canAuthenticate =
                canAuthenticateWithBiometrics || await auth.isDeviceSupported();

            if (canAuthenticateWithBiometrics && canAuthenticate) {
              print("Yes");
              final List<BiometricType> availableBiometrics =
                  await auth.getAvailableBiometrics();

              if (availableBiometrics.isNotEmpty) {
                print("Yes");
                // await auth.authenticate(
                //     localizedReason:
                //         'Scan your fingerprint or face to authenticate',
                //     options: const AuthenticationOptions(
                //         useErrorDialogs: true,
                //         stickyAuth: true,
                //         biometricOnly: true));
                bool authenticatedWithBiometric = await auth.authenticate(
                    localizedReason:
                        'Scan your fingerprint or face to authenticate',
                    options: const AuthenticationOptions(
                        useErrorDialogs: true,
                        stickyAuth: true,
                        biometricOnly: true));

                if (authenticatedWithBiometric) {
                  Navigator.pushNamed(
                      context, BottomNavigationScreen.routeName);
                  // onboardingType == OnboardingType.existingCustomer
                  //     ? ref
                  //         .read(onboardingProfileProvider)
                  //         .existingProfileSignUp3(password,
                  //             isBiometric: true, ref: ref)
                  //     : ref
                  //         .read(onboardingProfileProvider)
                  //         .signUp3(password, isBiometric: true, ref: ref);
                  // isBiometricsLoading = false;
                } else {
                  ScaffoldMessenger.of(context)
                    ..removeCurrentSnackBar()
                    ..showSnackBar(const SnackBar(
                      content: Text(
                          "Could not authenticate, please try again later"),
                      backgroundColor: Colors.red,
                    ));
                }

                // _showBottomModal(context);
                // await Future.delayed(const Duration(seconds: 1));

                print("object");
              } else {
                ScaffoldMessenger.of(context)
                  ..removeCurrentSnackBar()
                  ..showSnackBar(const SnackBar(
                    content: Text("Request Failed, Please try again later"),
                    backgroundColor: Colors.red,
                  ));
              }
            } else {
              print("No");
              ScaffoldMessenger.of(context)
                ..removeCurrentSnackBar()
                ..showSnackBar(const SnackBar(
                  content: Text("Request Failed, Please try again later"),
                  backgroundColor: Colors.red,
                ));
            }
          } catch (e) {
            debugPrint(e.toString());
            print("Cancel");

            return;
          }
        });
  }

  void _showBottomModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 300,
          color: CustomColors.whiteColor,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Welcome!',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                ),
                verticalSpacer(10),
                const Text(
                  'Account successfully created',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: CustomColors.greyTextColor),
                ),
                verticalSpacer(20),
                SvgPicture.asset(
                  ConstantString.successIcon,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
