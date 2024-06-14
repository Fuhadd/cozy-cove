import 'dart:async';

import 'package:cozy_cove/constants/custom_colors.dart';
import 'package:cozy_cove/models/misc_model.dart';
import 'package:cozy_cove/screens/authentication/auth_view_model.dart';
import 'package:cozy_cove/screens/authentication/sign_in/sign_up_success_screen.dart';
import 'package:cozy_cove/utils/spacers.dart';
import 'package:cozy_cove/widgets/authentication_screen.dart';
import 'package:cozy_cove/widgets/custom_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class QuestOnboardScreen extends StatefulHookConsumerWidget {
  final String pseudonym,
      password,
      healthDetails,
      primaryHealthGoal,
      secondaryHealthGoal,
      hobbyDetails,
      hobby;
  final int currentHealth, healthGoal;
  static const routeName = '/QuestOnboardScreen';
  const QuestOnboardScreen({
    super.key,
    required this.pseudonym,
    required this.password,
    required this.currentHealth,
    required this.healthDetails,
    required this.healthGoal,
    required this.primaryHealthGoal,
    required this.secondaryHealthGoal,
    required this.hobbyDetails,
    required this.hobby,
  });

  @override
  ConsumerState<QuestOnboardScreen> createState() => _HobbiesScreenState();
}

class _HobbiesScreenState extends ConsumerState<QuestOnboardScreen> {
  final TextEditingController phoneController = TextEditingController();
  int currentIndex = 0;
  bool isLoading = false;
  final pinController = TextEditingController();
  int checkedIndex = 0;

  bool buttonActive = false;

  Timer? countdownTimer;
  Duration myDuration = const Duration(minutes: 3);
  String reason = "";
  bool isCountdownActive = false;
  List<String> selectedInterests = [];

  @override
  Widget build(BuildContext context) {
    final authVM = ref.watch(authProvider);
    return AuthFormWidget(
      onBackTap: () {
        Navigator.canPop(context) ? Navigator.pop(context) : null;
      },
      showHealthProgress: true,
      buttonText: "Continue",
      progress: 4,
      topPadding: 30,
      isButtonLoading: authVM.isLoading,
      onButtonTap: selectedInterests.length < 2
          ? null
          : () async {
              await authVM.signUp(
                pseudonym: widget.pseudonym,
                password: widget.password,
                currentHealth: widget.currentHealth,
                healthDetails: widget.healthDetails,
                healthGoal: checkedIndex,
                primaryHealthGoal: widget.primaryHealthGoal,
                secondaryHealthGoal: widget.secondaryHealthGoal,
                hobby: widget.hobby,
                hobbyDetails: widget.hobbyDetails,
                selectedInterests: selectedInterests,
                context: context,
              );
              // ..Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => SignUpSuccessScreen(
              //       pseudonym: widget.pseudonym,
              //       password: widget.password,
              //       currentHealth: widget.currentHealth,
              //       healthDetails: widget.healthDetails,
              //       healthGoal: checkedIndex,
              //       primaryHealthGoal: widget.primaryHealthGoal,
              //       secondaryHealthGoal: widget.secondaryHealthGoal,
              //       hobby: widget.hobby,
              //       hobbyDetails: widget.hobbyDetails,
              //       selectedInterests: selectedInterests,
              //     ),
              //   ),
              // );
            },
      title: "Choose your Quests",
      subTitle: "This will help us recommend tasks to your preferences",
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FormBuilder(
                    child: FormBuilderField<List<String>>(
                      name: 'interests',
                      builder: (FormFieldState<List<String>> field) {
                        return InputDecorator(
                          decoration: InputDecoration(
                            labelStyle: const TextStyle(color: Colors.white),
                            hoverColor: Colors.white,
                            floatingLabelStyle: const TextStyle(
                                color: CustomColors.mainBlueColor),
                            fillColor: CustomColors.mainBlueColor,
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: CustomColors.redBgColor),
                            ),
                            errorText: field.errorText,
                          ),
                          child: Wrap(
                            spacing: 10,
                            runSpacing: 10,
                            alignment: WrapAlignment.center,
                            children: options.map((item) {
                              final bool isSelected =
                                  field.value?.contains(item.value) ?? false;
                              final bool isMaxReached =
                                  (field.value?.length ?? 0) >= 4;
                              final bool isSelectable =
                                  isSelected || !isMaxReached;

                              return FilterChip(
                                // label: item.child.data,
                                label: Text(
                                  (item.child as Text).data!,
                                  style: TextStyle(
                                    fontSize: 13,
                                    // color: CustomColors.formChipGreyColor,
                                    color: isSelected
                                        ? CustomColors.mainBlueColor
                                        : CustomColors.formChipGreyColor,
                                  ),
                                ),
                                selected: isSelected,
                                onSelected: isSelectable
                                    ? (isSelected) {
                                        var currentValue = field.value ?? [];
                                        if (isSelected) {
                                          if (currentValue.length < 4) {
                                            field.didChange(
                                                [...currentValue, item.value]);
                                          }
                                        } else {
                                          field.didChange(
                                              currentValue..remove(item.value));
                                        }
                                        setState(() {
                                          selectedInterests = field.value ?? [];
                                        });
                                      }
                                    : null,
                                // shape: StadiumBorder(
                                //   side: BorderSide(
                                //     color: isSelected
                                //         ? CustomColors.mainBlueColor
                                //         : Colors.amber,
                                //     width: 2,
                                //   ),
                                // ),
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: isSelected
                                        ? CustomColors.mainBlueColor
                                        : CustomColors
                                            .formChipGreyColor, // Border color when unselected
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                backgroundColor: isSelectable
                                    ? CustomColors.whiteColor
                                    : CustomColors.mainBlueColor
                                        .withOpacity(0.1),
                                selectedColor: Colors.transparent,
                                checkmarkColor: CustomColors.whiteColor,
                                showCheckmark: false,
                                elevation: 0,
                              );
                            }).toList(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Opacity(
            opacity: 0.7,
            child: MaximumSelectWidget(
              value: selectedInterests.length > 1,
            ),
          ),
        ],
      ),
    );
  }
}

class MaximumSelectWidget extends StatefulWidget {
  final bool value;
  const MaximumSelectWidget({
    super.key,
    required this.value,
  });

  @override
  State<MaximumSelectWidget> createState() => _GoalWidgetState();
}

class _GoalWidgetState extends State<MaximumSelectWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 19,
            height: 19,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: CustomColors.hintTextColor,
                width: 2,
              ),
              color: widget.value
                  ? CustomColors.mainBlueColor
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
          horizontalSpacer(10),
          const Text(
            "Select up to 4",
            style: TextStyle(
              fontSize: 14,
              color: CustomColors.checkTextColor,
            ),
          ),
        ],
      ),
    );
  }
}

// var options = const [
//   FormBuilderChipOption(value: 'cooking', child: Text('#Cooking')),
//   FormBuilderChipOption(value: 'career_coaching', child: Text('#Career coaching')),
//   FormBuilderChipOption(value: 'music', child: Text('#Music')),
//   FormBuilderChipOption(value: 'Ice Hockey', child: Text('Ice Hockey')),
//   FormBuilderChipOption(value: 'Wrestling', child: Text('Wrestling')),
//   FormBuilderChipOption(value: 'Gaming', child: Text('Gaming')),
//   FormBuilderChipOption(value: 'Motorsports', child: Text('Motorsports')),
//   FormBuilderChipOption(value: 'Bandy', child: Text('Bandy')),
//   FormBuilderChipOption(value: 'Rugby', child: Text('Rugby')),
//   FormBuilderChipOption(value: 'Skiing', child: Text('Skiing')),
//   FormBuilderChipOption(value: 'Shooting', child: Text('Shooting')),
// ];

var options = quests
    .map((quest) => FormBuilderChipOption(
          value: quest.id,
          child: Text(
            "#${quest.name}",
            style: const TextStyle(
              fontSize: 14,
              color: CustomColors.formChipGreyColor,
            ),
          ),
        ))
    .toList();
