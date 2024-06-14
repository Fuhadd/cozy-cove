import 'dart:async';

import 'package:cozy_cove/constants/custom_colors.dart';
import 'package:cozy_cove/screens/authentication/sign_in/hobbies_screen.dart';
import 'package:cozy_cove/utils/spacers.dart';
import 'package:cozy_cove/widgets/authentication_screen.dart';
import 'package:cozy_cove/widgets/custom_textfield.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class HealthGoalScreen extends StatefulWidget {
  final String pseudonym, password, healthDetails;
  final int currentHealth;
  static const routeName = '/HealthGoalScreen';
  const HealthGoalScreen({
    super.key,
    required this.pseudonym,
    required this.password,
    required this.currentHealth,
    required this.healthDetails,
  });

  @override
  State<HealthGoalScreen> createState() => _HealthGoalScreenState();
}

class _HealthGoalScreenState extends State<HealthGoalScreen> {
  final TextEditingController phoneController = TextEditingController();
  final formKey = GlobalKey<FormBuilderState>();
  // int currentIndex = 0;
  bool isLoading = false;
  // final pinController = TextEditingController();
  int checkedIndex = 0;

  String reason = "";
  String primaryHealthGoal = "";
  // bool isCountdownActive = false;

  @override
  Widget build(BuildContext context) {
    return AuthFormWidget(
      onBackTap: () {
        Navigator.canPop(context) ? Navigator.pop(context) : null;
      },
      showHealthProgress: true,
      buttonText: "Continue",
      progress: 2,
      topPadding: 30,
      isButtonLoading: isLoading,
      onButtonTap: () async {
        if (checkedIndex != 0) {
          FocusScope.of(context).unfocus();
          var secondaryHealthGoal = formKey
              .currentState?.fields['secondaryHealthGoal']?.value
              .toString()
              .trim();

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HobbiesScreen(
                pseudonym: widget.pseudonym,
                password: widget.password,
                currentHealth: widget.currentHealth,
                healthDetails: widget.healthDetails,
                healthGoal: checkedIndex,
                primaryHealthGoal: primaryHealthGoal,
                secondaryHealthGoal: secondaryHealthGoal ?? " ",
              ),
            ),
          );
        }
        // Navigator.pushNamed(context, HobbiesScreen.routeName);
      },
      title: "Choose your health goal",
      subTitle:
          "What are the mental health goals you will like to achieve on this platform?",
      child: SingleChildScrollView(
        child: FormBuilder(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  GoalWidget(
                    title: "I want to manage anxiety",
                    isCurrentIndex: checkedIndex == 1,
                    onTap: () {
                      setState(() {
                        checkedIndex = 1;
                        primaryHealthGoal = "I want to manage anxiety";
                      });
                    },
                    value: checkedIndex == 1,
                    onChanged: (newValue) {
                      setState(() {
                        checkedIndex = 1;
                        primaryHealthGoal = "I want to manage anxiety";
                      });
                    },
                  ),
                  GoalWidget(
                    title: "I want to build my self-confidence",
                    isCurrentIndex: checkedIndex == 2,
                    onTap: () {
                      setState(() {
                        checkedIndex = 2;
                        primaryHealthGoal =
                            "I want to build my self-confidence";
                      });
                    },
                    value: checkedIndex == 2,
                    onChanged: (newValue) {
                      setState(() {
                        checkedIndex = 2;
                        primaryHealthGoal =
                            "I want to build my self-confidence";
                      });
                    },
                  ),
                  GoalWidget(
                    title: "I want to cope with depression",
                    isCurrentIndex: checkedIndex == 3,
                    onTap: () {
                      setState(() {
                        checkedIndex = 3;
                        primaryHealthGoal = "I want to cope with depression";
                      });
                    },
                    value: checkedIndex == 3,
                    onChanged: (newValue) {
                      setState(() {
                        checkedIndex = 3;
                        primaryHealthGoal = "I want to cope with depression";
                      });
                    },
                  ),
                  GoalWidget(
                    title: "I want to manage anxiety",
                    isCurrentIndex: checkedIndex == 4,
                    onTap: () {
                      setState(() {
                        checkedIndex = 4;
                        primaryHealthGoal = "I want to manage anxiety";
                      });
                    },
                    value: checkedIndex == 4,
                    onChanged: (newValue) {
                      setState(() {
                        checkedIndex = 4;
                        primaryHealthGoal = "I want to manage anxiety";
                      });
                    },
                  ),
                  GoalWidget(
                    title: "I want to manage anxiety",
                    isCurrentIndex: checkedIndex == 5,
                    onTap: () {
                      setState(() {
                        checkedIndex = 5;
                        primaryHealthGoal = "I want to manage anxiety";
                      });
                    },
                    value: checkedIndex == 5,
                    onChanged: (newValue) {
                      setState(() {
                        checkedIndex = 5;
                        primaryHealthGoal = "I want to manage anxiety";
                      });
                    },
                  ),
                ],
              ),
              verticalSpacer(30),
              const Text(
                "Other",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: CustomColors.labelTextColor),
              ),
              verticalSpacer(10),
              customMultiTextField(
                "secondaryHealthGoal",
                hintText: "Tell us about it",
                onChanged: (value) {
                  setState(() {
                    reason = value!;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GoalWidget extends StatefulWidget {
  final String title;
  final bool isCurrentIndex;
  final void Function()? onTap;

  final bool value;
  final ValueChanged<bool?> onChanged;
  const GoalWidget({
    super.key,
    required this.title,
    required this.isCurrentIndex,
    this.onTap,
    required this.value,
    required this.onChanged,
  });

  @override
  State<GoalWidget> createState() => _GoalWidgetState();
}

class _GoalWidgetState extends State<GoalWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          height: 52,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            border: Border.all(
              color: CustomColors.lightGreyColor,
            ),
          ),
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  widget.onChanged(!widget.value);
                },
                child: Container(
                  width: 19,
                  height: 19,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: CustomColors.hintTextColor,
                      width: 2,
                    ),
                    color: widget.value
                        ? CustomColors.limeGreenColor
                        : Colors.transparent,
                  ),
                  child: widget.value
                      ? const Icon(
                          Icons.check,
                          size: 16,
                          color: Colors.white,
                        )
                      : null,
                ),
              ),
              horizontalSpacer(10),
              Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 14,
                  color: CustomColors.checkTextColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
