import 'dart:io';

import 'package:cozy_cove/constants/custom_colors.dart';
import 'package:cozy_cove/constants/custom_string.dart';
import 'package:cozy_cove/data/local_cache/local_cache.dart';
import 'package:cozy_cove/locator.dart';
import 'package:cozy_cove/models/user_data.dart';
import 'package:cozy_cove/screens/authentication/auth_view_model.dart';
import 'package:cozy_cove/screens/authentication/sign_up/forgot_password_screen.dart';
import 'package:cozy_cove/utils/spacers.dart';
import 'package:cozy_cove/widgets/authentication_screen.dart';
import 'package:cozy_cove/widgets/custom_textfield.dart';
import 'package:cozy_cove/widgets/new_custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:local_auth/local_auth.dart';

import '../../dashboard/bottom_navigation_screen.dart';

class SignInScreen extends StatefulHookConsumerWidget {
  static const routeName = '/SignInScreen';
  const SignInScreen({super.key});

  @override
  ConsumerState<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  final TextEditingController phoneController = TextEditingController();
  final formKey = GlobalKey<FormBuilderState>();
  bool isLoading = false;

  String mobileNumberDialCode = "";
  String mobileNumber = "";
  String email = "";
  String completeMobileNumber = "";
  String password = "";
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;
  @override
  Widget build(BuildContext context) {
    UserDataModel userData = locator<LocalCache>().getUserData();
    final authVM = ref.watch(authProvider);
    return AuthFormWidget(
      resizeToAvoidBottomInset: false,
      onBackTap: () {
        Navigator.canPop(context) ? Navigator.pop(context) : null;
      },
      showButton: false,
      isButtonLoading: isLoading,
      // onButtonTap: () async {
      //   setState(() {
      //     isLoading = true;
      //   });
      //   await Future.delayed(const Duration(seconds: 3));

      //   setState(() {
      //     isLoading = false;
      //   });
      //   Navigator.pushNamed(context, BottomNavigationScreen.routeName);
      // },
      buttonText: "Login",
      title: "Welcome back, ${userData.pseudonym}!",
      subTitle: "Let’s get you back in to your account.",
      child: FormBuilder(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // const Text(
              //   "Email Address",
              //   style: TextStyle(
              //     fontWeight: FontWeight.w700,
              //     fontSize: 14,
              //   ),
              // ),
              // verticalSpacer(10),
              // customTextField(
              //   "email",
              //   hintText: "Enter your email address",
              //   validator: FormBuilderValidators.compose(
              //     [
              //       FormBuilderValidators.email(
              //           errorText: 'Provided email not valid '),
              //       FormBuilderValidators.required(
              //           errorText: 'Email field cannot be empty '),
              //     ],
              //   ),
              //   onChanged: (value) {
              //     setState(() {
              //       email = value!;
              //     });
              //   },
              // ),
              // verticalSpacer(20),
              const Text(
                "Password",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
              ),
              verticalSpacer(10),
              customTextField(
                "password",
                hintText: "Enter your password",
                suffixIcon: obscurePassword
                    ? FontAwesomeIcons.eye
                    : FontAwesomeIcons.eyeSlash,
                obscureText: obscurePassword,
                onSuffixTap: () {
                  setState(() {
                    obscurePassword = !obscurePassword;
                  });
                },
                onChanged: (value) {
                  setState(() {
                    password = value!;
                    print(password);
                  });
                },
                validator: FormBuilderValidators.compose([
                  // FormBuilderValidators.minLength(6,
                  //     errorText: 'Good passwords are greater than 6 characters'),
                  FormBuilderValidators.required(
                      errorText: 'Password field cannot be empty '),
                ]),
              ),
              verticalSpacer(50),

              NewCustomButton(
                title: "Login",
                onTap: () async {
                  FocusScope.of(context).unfocus();
                  bool? validate = formKey.currentState?.validate();
                  print(validate);
                  if (validate == true) {
                    var pseudonym = formKey
                        .currentState?.fields['pseudonym']?.value
                        .toString()
                        .trim();
                    var password =
                        formKey.currentState?.fields['password']?.value;

                    await authVM.signIn(
                      userData.pseudonym,
                      password,
                      context: context,
                    );

                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (context) => KnowYouScreen(
                    //           pseudonym: pseudonym ?? "",
                    //           password: password,
                    //         )));
                  }

                  // setState(() {
                  //   isLoading = true;
                  // });
                  // await Future.delayed(const Duration(seconds: 3));

                  // setState(() {
                  //   isLoading = false;
                  // });
                  // Navigator.pushNamed(context, BottomNavigationScreen.routeName);
                },
                isLoading: authVM.isLoading,
              ),
              verticalSpacer(30),
              GestureDetector(
                onTap: () async {
                  try {
                    authVM.isLoading = true;
                    final LocalAuthentication auth = LocalAuthentication();

                    final bool canAuthenticateWithBiometrics =
                        await auth.canCheckBiometrics;
                    final bool canAuthenticate =
                        canAuthenticateWithBiometrics ||
                            await auth.isDeviceSupported();

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
                          authVM.isLoading = false;
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
                          authVM.isLoading = false;
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
                        authVM.isLoading = false;

                        print("object");
                      } else {
                        authVM.isLoading = false;
                        ScaffoldMessenger.of(context)
                          ..removeCurrentSnackBar()
                          ..showSnackBar(const SnackBar(
                            content:
                                Text("Request Failed, Please try again later"),
                            backgroundColor: Colors.red,
                          ));
                      }
                    } else {
                      authVM.isLoading = false;
                      print("No");
                      ScaffoldMessenger.of(context)
                        ..removeCurrentSnackBar()
                        ..showSnackBar(const SnackBar(
                          content:
                              Text("Request Failed, Please try again later"),
                          backgroundColor: Colors.red,
                        ));
                    }
                  } catch (e) {
                    authVM.isLoading = false;
                    debugPrint(e.toString());
                    print("Cancel");

                    return;
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      Platform.isIOS
                          ? ConstantString.iosBiometricsIcon
                          : ConstantString.androidBiometricsIcon,
                    ),
                    horizontalSpacer(15),
                    const Text(
                      'Tap the icon to login',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: CustomColors.greyTextColor),
                    ),
                  ],
                ),
              ),
              // GestureDetector(
              //   onTap: () {
              //     Navigator.of(context).pushNamed(ForgotPasswordScreen.routeName);
              //   },
              //   child: Center(
              //     child: Text(
              //       "Forgot Password?",
              //       style: TextStyle(
              //         fontWeight: FontWeight.w500,
              //         fontSize: 12.sp,
              //         color: CustomColors.orangeColor,
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
