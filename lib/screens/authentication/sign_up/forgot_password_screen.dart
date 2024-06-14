import 'package:cozy_cove/utils/spacers.dart';
import 'package:cozy_cove/widgets/authentication_screen.dart';
import 'package:cozy_cove/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class ForgotPasswordScreen extends StatefulWidget {
  static const routeName = '/ForgotPasswordScreen';
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController phoneController = TextEditingController();
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
    return AuthFormWidget(
      resizeToAvoidBottomInset: false,
      onBackTap: () {
        Navigator.canPop(context) ? Navigator.pop(context) : null;
      },
      isButtonLoading: isLoading,
      onButtonTap: () async {},
      buttonText: "Continue",
      title: "Reset Password",
      subTitle:
          "Please enter your registered email address to receive you a recovery email",
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Email Address",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 14,
              ),
            ),
            verticalSpacer(10),
            customTextField(
              "email",
              hintText: "Enter your email address",
              validator: FormBuilderValidators.compose(
                [
                  FormBuilderValidators.email(
                      errorText: 'Provided email not valid '),
                  FormBuilderValidators.required(
                      errorText: 'Email field cannot be empty '),
                ],
              ),
              onChanged: (value) {
                setState(() {
                  email = value!;
                });
              },
            ),
            verticalSpacer(20),
          ],
        ),
      ),
    );
  }
}
