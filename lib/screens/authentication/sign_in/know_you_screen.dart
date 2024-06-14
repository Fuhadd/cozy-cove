import 'package:cozy_cove/constants/custom_string.dart';
import 'package:cozy_cove/screens/authentication/auth_view_model.dart';
import 'package:cozy_cove/screens/authentication/sign_in/rate_health_screen.dart';
import 'package:cozy_cove/screens/authentication/sign_in/sign_up_success_screen.dart';
import 'package:cozy_cove/utils/spacers.dart';
import 'package:cozy_cove/widgets/authentication_screen.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class KnowYouScreen extends StatefulHookConsumerWidget {
  final String pseudonym, password;
  static const routeName = '/KnowYouScreen';
  const KnowYouScreen({
    super.key,
    required this.pseudonym,
    required this.password,
  });

  @override
  ConsumerState<KnowYouScreen> createState() => _KnowYouScreenState();
}

class _KnowYouScreenState extends ConsumerState<KnowYouScreen> {
  final TextEditingController phoneController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  bool isLoading = false;

  // String pseudonym = "";
  // String mobileNumber = "";
  // String completeMobileNumber = "";
  // String password = "";
  // bool obscurePassword = true;
  // bool obscureConfirmPassword = true;
  @override
  Widget build(BuildContext context) {
    final authVM = ref.watch(authProvider);
    return AuthFormWidget(
      resizeToAvoidBottomInset: true,
      topPadding: 0,
      onBackTap: () {
        Navigator.canPop(context) ? Navigator.pop(context) : null;
      },
      onSkipButtonTap: () async {
        await authVM.signUp(
          pseudonym: widget.pseudonym,
          password: widget.password,
          context: context,
        );
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => SignUpSuccessScreen(
        //       pseudonym: widget.pseudonym,
        //       password: widget.password,
        //     ),
        //   ),
        // );
      },
      buttonText: "Continue",
      isButtonLoading: authVM.isLoading,
      onButtonTap: () async {
        FocusScope.of(context).unfocus();
        setState(() {
          isLoading = true;
        });

        setState(() {
          isLoading = false;
        });
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RateHealthScreen(
              pseudonym: widget.pseudonym,
              password: widget.password,
            ),
          ),
        );
      },
      title: "We want to get to know you",
      subTitle:
          "You are special! Please complete the simple steps to have a personalized experience.",
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.asset(
              ConstantString.knowYou,
            ),
          ),
          verticalSpacer(20),
        ],
      ),
    );
  }
}
