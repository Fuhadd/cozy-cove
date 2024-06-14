import 'dart:async';

import 'package:cozy_cove/constants/custom_colors.dart';
import 'package:cozy_cove/screens/authentication/sign_in/quests_onboard_screen.dart';
import 'package:cozy_cove/screens/authentication/sign_in/sign_up_success_screen.dart';
import 'package:cozy_cove/screens/quest/quest_screen.dart';
import 'package:cozy_cove/utils/spacers.dart';
import 'package:cozy_cove/widgets/authentication_screen.dart';
import 'package:cozy_cove/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class HobbiesScreen extends StatefulWidget {
  final String pseudonym,
      password,
      healthDetails,
      primaryHealthGoal,
      secondaryHealthGoal;
  final int currentHealth, healthGoal;
  static const routeName = '/HobbiesScreen';
  const HobbiesScreen({
    super.key,
    required this.pseudonym,
    required this.password,
    required this.currentHealth,
    required this.healthDetails,
    required this.healthGoal,
    required this.primaryHealthGoal,
    required this.secondaryHealthGoal,
  });

  @override
  State<HobbiesScreen> createState() => _HobbiesScreenState();
}

class _HobbiesScreenState extends State<HobbiesScreen> {
  final TextEditingController phoneController = TextEditingController();
  final formKey = GlobalKey<FormBuilderState>();
  int currentIndex = 0;
  bool isLoading = false;
  int checkedIndex = 0;
  String hobby = "";
  bool isCountdownActive = false;

  @override
  Widget build(BuildContext context) {
    return AuthFormWidget(
      onBackTap: () {
        Navigator.canPop(context) ? Navigator.pop(context) : null;
      },
      showHealthProgress: true,
      buttonText: "Continue",
      progress: 3,
      topPadding: 30,
      isButtonLoading: isLoading,
      onButtonTap: () async {
        // setState(() {
        //   isLoading = true;
        // });
        // await Future.delayed(const Duration(seconds: 2));

        // setState(() {
        //   isLoading = false;
        // });

        if (checkedIndex != 0) {
          FocusScope.of(context).unfocus();
          var hobbyDetails =
              formKey.currentState?.fields['hobby']?.value.toString().trim();

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => QuestOnboardScreen(
                pseudonym: widget.pseudonym,
                password: widget.password,
                currentHealth: widget.currentHealth,
                healthDetails: widget.healthDetails,
                healthGoal: checkedIndex,
                primaryHealthGoal: widget.primaryHealthGoal,
                secondaryHealthGoal: widget.secondaryHealthGoal,
                hobby: hobby ?? "",
                hobbyDetails: hobbyDetails ?? "",
              ),
            ),
          );
        }

        // Navigator.pushNamed(context, SignUpSuccessScreen.routeName);
      },
      title: "Choose your hobbies and interests",
      subTitle:
          "This will help us suggest relevant content and communities that align with your preferences",
      child: SingleChildScrollView(
        child: FormBuilder(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  GoalWidget(
                    title: "Reading",
                    isCurrentIndex: currentIndex == 1,
                    onTap: () {
                      setState(() {
                        checkedIndex = 1;
                      });
                    },
                    value: checkedIndex == 1,
                    onChanged: (newValue) {
                      setState(() {
                        checkedIndex = 1;
                        hobby = "Reading";
                      });
                    },
                  ),
                  GoalWidget(
                    title: "Yoga",
                    isCurrentIndex: currentIndex == 2,
                    onTap: () {
                      setState(() {
                        checkedIndex = 2;
                        hobby = "Yoga";
                      });
                    },
                    value: checkedIndex == 2,
                    onChanged: (newValue) {
                      setState(() {
                        checkedIndex = 2;
                      });
                    },
                  ),
                  GoalWidget(
                    title: "Speaking to Someone",
                    isCurrentIndex: currentIndex == 3,
                    onTap: () {
                      setState(() {
                        checkedIndex = 3;
                        hobby = "Speaking to Someone";
                      });
                    },
                    value: checkedIndex == 3,
                    onChanged: (newValue) {
                      setState(() {
                        checkedIndex = 3;
                      });
                    },
                  ),
                  GoalWidget(
                    title: "Meditation",
                    isCurrentIndex: currentIndex == 4,
                    onTap: () {
                      setState(() {
                        checkedIndex = 4;
                        hobby = "Meditation";
                      });
                    },
                    value: checkedIndex == 4,
                    onChanged: (newValue) {
                      setState(() {
                        checkedIndex = 4;
                      });
                    },
                  ),
                  GoalWidget(
                    title: "Listening to music",
                    isCurrentIndex: currentIndex == 5,
                    onTap: () {
                      setState(() {
                        checkedIndex = 5;
                      });
                    },
                    value: checkedIndex == 5,
                    onChanged: (newValue) {
                      setState(() {
                        checkedIndex = 5;
                        hobby = "Listening to music";
                      });
                    },
                  ),
                ],
              ),
              verticalSpacer(30),
              const Text(
                "Others",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: CustomColors.labelTextColor),
              ),
              verticalSpacer(10),
              customMultiTextField(
                "hobby",
                hintText: "Tell us about it",
                onChanged: (value) {
                  // setState(() {
                  //   hobbyDetails = value!;
                  // });
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
