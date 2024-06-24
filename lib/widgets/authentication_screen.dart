import 'package:cozy_cove/constants/custom_colors.dart';
import 'package:cozy_cove/constants/custom_string.dart';
import 'package:cozy_cove/utils/spacers.dart';
import 'package:cozy_cove/widgets/get_help_row.dart';
import 'package:cozy_cove/widgets/new_custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AuthFormWidget extends StatefulWidget {
  final Widget child;
  final Widget? footer;
  final String title, subTitle;
  final bool showFooter;
  final bool showButton;
  final bool showHealthProgress;
  final int progress;
  final bool isAddressScreen;
  final bool removePadding;
  final double? topPadding;
  final bool isButtonLoading;
  final bool resizeToAvoidBottomInset;
  final bool isFormValid;
  final String buttonText;
  final void Function()? onButtonTap;
  final void Function()? onBackTap;
  final void Function()? onSkipButtonTap;

  final ScrollController? outerScrollController, innerScrollController;
  const AuthFormWidget(
      {super.key,
      required this.child,
      required this.subTitle,
      required this.title,
      this.removePadding = false,
      this.showFooter = false,
      this.showButton = true,
      this.isAddressScreen = false,
      this.buttonText = "Proceed",
      this.footer,
      this.onButtonTap,
      this.onBackTap,
      this.onSkipButtonTap,
      this.isButtonLoading = false,
      this.resizeToAvoidBottomInset = true,
      this.isFormValid = false,
      this.showHealthProgress = false,
      this.progress = 1,
      this.topPadding,
      this.outerScrollController,
      this.innerScrollController});

  @override
  State<AuthFormWidget> createState() => _AuthFormWidgetState();
}

class _AuthFormWidgetState extends State<AuthFormWidget> {
  final TextEditingController phoneController = TextEditingController();

  String mobileNumberDialCode = "";
  String mobileNumber = "";
  String completeMobileNumber = "";
  String password = "";
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;
  // final bool _isChecked = false;
  bool _isConsentChecked = true;
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: widget.onBackTap == null ? false : true,
      child: Scaffold(
        resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset,
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: SingleChildScrollView(
            controller: widget.outerScrollController,
            child: SizedBox(
              height: 1.sh,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        verticalSpacer(MediaQuery.of(context).padding.top + 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            widget.showHealthProgress
                                ? Padding(
                                    padding: const EdgeInsets.only(bottom: 9.0),
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        TweenAnimationBuilder(
                                            tween: widget.progress == 1
                                                ? Tween(begin: 0.0, end: 0.25)
// : widget.progress == 1
//     ? Tween(begin: 0.25, end: 0.5)
                                                : widget.progress == 2
                                                    ? Tween(
                                                        begin: 0.25, end: 0.5)
                                                    : widget.progress == 3
                                                        ? Tween(
                                                            begin: 0.5,
                                                            end: 0.75)
                                                        : Tween(
                                                            begin: 0.75,
                                                            end: 1.0),
                                            duration: const Duration(
                                                milliseconds: 1300),
                                            builder: (context, value, _) {
                                              return SizedBox(
                                                height: 40,
                                                width: 40,
                                                child:
                                                    CircularProgressIndicator(
                                                  value: value,
                                                  backgroundColor: CustomColors
                                                      .progressGreyColor,
                                                  color: CustomColors
                                                      .mainBlueColor,
                                                  strokeWidth: 6,
                                                ),
                                              );
                                            }),
                                        RichText(
                                          text: TextSpan(
                                            text: '${widget.progress}',
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 14,
                                                color: CustomColors
                                                    .blackTextColor),
                                            children: const [
                                              TextSpan(
                                                text: '/4',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 14,
                                                    color:
                                                        CustomColors.greyColor),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                : GestureDetector(
                                    onTap: widget.onBackTap,
                                    child: SvgPicture.asset(
                                      ConstantString.chevronBack,
                                    ),
                                  ),
                            widget.onSkipButtonTap != null
                                ? GestureDetector(
                                    onTap: widget.onSkipButtonTap,
                                    child: const Text(
                                      "Skip",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                          color: CustomColors.mainBlueColor,
                                          decoration: TextDecoration.underline),
                                    ),
                                  )
                                : const SizedBox.shrink(),
                          ],
                        ),
                        verticalSpacer(20),
                        Text(
                          widget.title,
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                            color: CustomColors.blackTextColor,
                          ),
                        ),
                        verticalSpacer(11),
                        Text(
                          widget.subTitle,
                          style: const TextStyle(
                              fontSize: 14,
                              color: CustomColors.greyTextColor,
                              height: 1.35),
                        ),
                        widget.topPadding != null
                            ? verticalSpacer(widget.topPadding!)
                            : widget.removePadding
                                ? verticalSpacer(0)
                                : widget.isAddressScreen
                                    ? verticalSpacer(30)
                                    : verticalSpacer(50),
                        Expanded(
                          child: widget.isAddressScreen
                              ? NotificationListener<ScrollNotification>(
                                  onNotification: (scrollNotification) {
                                    if (scrollNotification
                                        is ScrollEndNotification) {
                                      if (widget.innerScrollController!.position
                                              .pixels ==
                                          widget.innerScrollController!.position
                                              .minScrollExtent) {
                                        // Inner ScrollView reached the top
                                        widget.outerScrollController!.animateTo(
                                          widget.outerScrollController!.position
                                              .minScrollExtent,
                                          duration:
                                              const Duration(milliseconds: 300),
                                          curve: Curves.ease,
                                        );
                                      } else if (scrollNotification
                                              .metrics.extentAfter ==
                                          0) {
                                        // Inner ScrollView reached the end
                                        widget.outerScrollController!.animateTo(
                                          widget.outerScrollController!.position
                                              .maxScrollExtent,
                                          duration:
                                              const Duration(milliseconds: 300),
                                          curve: Curves.ease,
                                        );
                                      }
                                    }
                                    return true;
                                  },
                                  child: widget.child,
                                )
                              : widget.child,
                        ),
                      ],
                    ),
                  ),
                  widget.removePadding ? verticalSpacer(0) : verticalSpacer(20),
                  widget.showButton
                      ? NewCustomButton(
                          title: widget.buttonText,
                          onTap: widget.isButtonLoading
                              ? null
                              : widget.onButtonTap,
                          isLoading: widget.isButtonLoading,
                        )
                      : const SizedBox.shrink(),
                  verticalSpacer(20),
                  widget.showFooter
                      ? Column(
                          children: [
                            GestureDetector(
                              // onTap: () {
                              //   setState(() {
                              //     _isChecked = !_isChecked;
                              //   });
                              // },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    color:
                                        CustomColors.greyColor.withOpacity(0.3),
                                    height: 15,
                                    width: 15,
                                    child: Checkbox(
                                      checkColor: CustomColors.whiteColor,
                                      activeColor: CustomColors.orangeColor,
                                      // shape: recta
                                      value: _isConsentChecked,
                                      onChanged: (value) {
                                        setState(() {
                                          _isConsentChecked = value!;
                                        });
                                      },
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                      ),
                                      side: MaterialStateBorderSide.resolveWith(
                                        (states) => BorderSide(
                                            width: 1.0,
                                            color: _isConsentChecked
                                                ? CustomColors.orangeColor
                                                : CustomColors.blackColor),
                                      ),
                                    ),
                                  ),
                                  horizontalSpacer(10),
                                  const SizedBox(
                                    child: Text(
                                      'I Consent to receiving communication from Bongo',
                                      style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w400,
                                          color: CustomColors.greyTextColor),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            verticalSpacer(20),
                            const GetHelpRow(
                              centerAlign: true,
                            ),
                            verticalSpacer(30),
                          ],
                        )
                      : widget.footer ?? const SizedBox.shrink(),
                  verticalSpacer(20)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
