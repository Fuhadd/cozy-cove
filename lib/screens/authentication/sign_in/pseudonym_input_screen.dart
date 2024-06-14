import 'package:cozy_cove/constants/custom_colors.dart';
import 'package:cozy_cove/screens/authentication/sign_in/know_you_screen.dart';
import 'package:cozy_cove/utils/spacers.dart';
import 'package:cozy_cove/widgets/authentication_screen.dart';
import 'package:cozy_cove/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class PseudonyminputScreen extends StatefulWidget {
  static const routeName = '/PhoneinputScreen';
  const PseudonyminputScreen({super.key});

  @override
  State<PseudonyminputScreen> createState() => _PseudonyminputScreenState();
}

class _PseudonyminputScreenState extends State<PseudonyminputScreen> {
  final TextEditingController phoneController = TextEditingController();
  final formKey = GlobalKey<FormBuilderState>();
  bool isLoading = false;

  String pseudonym = "";
  String mobileNumber = "";
  String completeMobileNumber = "";
  String password = "";
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;
  @override
  Widget build(BuildContext context) {
    return AuthFormWidget(
      resizeToAvoidBottomInset: true,
      topPadding: 35,
      onBackTap: () {
        Navigator.canPop(context) ? Navigator.pop(context) : null;
      },
      buttonText: "Create Account",
      isButtonLoading: isLoading,
      onButtonTap: () async {
        FocusScope.of(context).unfocus();
        bool? validate = formKey.currentState?.validate();
        print(validate);
        if (validate == true) {
          var pseudonym = formKey.currentState?.fields['pseudonym']?.value
              .toString()
              .trim();
          var password = formKey.currentState?.fields['password']?.value;

          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => KnowYouScreen(
                    pseudonym: pseudonym ?? "",
                    password: password,
                  )));
        }
      },
      title: "Welcome to Cozycove, buddy!",
      subTitle: "Choose a pseudonym to maintain anonymity on our platform",
      child: FormBuilder(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Pseudonym",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: CustomColors.labelTextColor),
            ),
            verticalSpacer(15),
            customTextField(
              "pseudonym",
              hintText: "e.g craby_didi",
              validator: FormBuilderValidators.compose(
                [
                  FormBuilderValidators.required(
                      errorText: 'Pseudonym cannot be empty '),
                ],
              ),
              onChanged: (value) {
                formKey.currentState?.fields['pseudonym']?.validate();
                setState(() {
                  pseudonym = value!;
                });
              },
            ),
            verticalSpacer(25),
            const Text(
              "Password",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: CustomColors.labelTextColor),
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
                formKey.currentState?.fields['password']?.validate();
                setState(() {
                  password = value!;
                  print(password);
                });
              },
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.minLength(6,
                    errorText: 'Password should be greater than 6 characters'),
                FormBuilderValidators.required(
                    errorText: 'Password field cannot be empty '),
              ]),
            ),
            verticalSpacer(20),
          ],
        ),
      ),
    );
  }
}
