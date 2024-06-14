import 'dart:async';

import 'package:cozy_cove/constants/custom_colors.dart';
import 'package:cozy_cove/screens/authentication/sign_in/health_goals_screen.dart';
import 'package:cozy_cove/utils/spacers.dart';
import 'package:cozy_cove/widgets/authentication_screen.dart';
import 'package:cozy_cove/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class RateHealthScreen extends StatefulWidget {
  final String pseudonym, password;
  static const routeName = '/rateHealthScreen';
  const RateHealthScreen({
    super.key,
    required this.pseudonym,
    required this.password,
  });

  @override
  State<RateHealthScreen> createState() => _RateHealthScreenState();
}

class _RateHealthScreenState extends State<RateHealthScreen> {
  final TextEditingController phoneController = TextEditingController();
  final formKey = GlobalKey<FormBuilderState>();
  int currentIndex = 0;
  bool isLoading = false;
  // final pinController = TextEditingController();
  // var isPin = false;

  // bool buttonActive = false;

  // Timer? countdownTimer;
  // Duration myDuration = const Duration(minutes: 3);
  String reason = "";
  // bool isCountdownActive = false;

  @override
  Widget build(BuildContext context) {
    return AuthFormWidget(
      onBackTap: () {
        Navigator.canPop(context) ? Navigator.pop(context) : null;
      },
      showHealthProgress: true,
      buttonText: "Continue",
      progress: 1,
      topPadding: 35,
      isButtonLoading: isLoading,
      onButtonTap: () async {
        // setState(() {
        //   isLoading = true;
        // });

        // setState(() {
        //   isLoading = false;
        // });

        if (currentIndex != 0) {
          FocusScope.of(context).unfocus();
          var healthDetails = formKey
              .currentState?.fields['healthDetails']?.value
              .toString()
              .trim();

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HealthGoalScreen(
                pseudonym: widget.pseudonym,
                password: widget.password,
                currentHealth: currentIndex,
                healthDetails: healthDetails ?? "",
              ),
            ),
          );
        }
      },
      title: "Rate your current health",
      subTitle: "How would you rate your current mental well-being?",
      child: FormBuilder(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RateWidget(
                  index: 1,
                  isCurrentIndex: currentIndex == 1,
                  onTap: () {
                    setState(() {
                      currentIndex = 1;
                    });
                  },
                ),
                RateWidget(
                  index: 2,
                  isCurrentIndex: currentIndex == 2,
                  onTap: () {
                    setState(() {
                      currentIndex = 2;
                    });
                  },
                ),
                RateWidget(
                  index: 3,
                  isCurrentIndex: currentIndex == 3,
                  onTap: () {
                    setState(() {
                      currentIndex = 3;
                    });
                  },
                ),
                RateWidget(
                  index: 4,
                  isCurrentIndex: currentIndex == 4,
                  onTap: () {
                    setState(() {
                      currentIndex = 4;
                    });
                  },
                ),
                RateWidget(
                  index: 5,
                  isCurrentIndex: currentIndex == 5,
                  onTap: () {
                    setState(() {
                      currentIndex = 5;
                    });
                  },
                ),
              ],
            ),
            verticalSpacer(15),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Just Fine",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: CustomColors.mainBlueColor,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 10.0),
                  child: Text(
                    "Excellent",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: CustomColors.mainBlueColor,
                    ),
                  ),
                ),
              ],
            ),
            verticalSpacer(30),
            const Text(
              "Not Specified",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: CustomColors.labelTextColor),
            ),
            verticalSpacer(15),
            customMultiTextField(
              "healthDetails",
              hintText: "e.g health details",
              onChanged: (value) {
                setState(() {
                  reason = value!;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class RateWidget extends StatelessWidget {
  final int index;
  final bool isCurrentIndex;
  final void Function()? onTap;
  const RateWidget({
    super.key,
    required this.index,
    required this.isCurrentIndex,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            height: 55,
            width: double.infinity,
            decoration: BoxDecoration(
              color: isCurrentIndex
                  ? CustomColors.mainBlueColor.withOpacity(0.3)
                  : null,
              borderRadius: BorderRadius.circular(7),
              border: Border.all(
                color: CustomColors.lightGreyColor,
              ),
            ),
            child: Center(
              child: Text(
                index.toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 21,
                  color: CustomColors.blackTextColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
