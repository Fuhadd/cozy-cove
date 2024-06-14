import 'package:flutter/material.dart';

import '../constants/custom_colors.dart';

class CustomBorderButton extends StatelessWidget {
  final String title;
  final String? routeName;
  final Color? textColor;
  final bool isLoading;
  final bool isBoldTitle;
  final bool borderButton;
  final double? width, height;
  final Widget? buttonChild;
  final void Function()? onTap;
  final Color? buttonColor;
  const CustomBorderButton(
      {super.key,
      required this.title,
      this.routeName,
      this.onTap,
      this.isLoading = false,
      this.isBoldTitle = true,
      this.borderButton = false,
      this.width,
      this.height,
      this.buttonChild,
      this.buttonColor,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ??
          () {
            // Navigator.pushNamed(context, routeName!);
            // Navigator.canPop(context) ? Navigator.pop(context) : null;
          },
      child: Stack(
        children: [
          Container(
            height: height ?? 54,
            width: width ?? double.infinity,
            decoration: BoxDecoration(
                color: CustomColors.borderGreyColor,

                // borderButton
                borderRadius: BorderRadius.circular(15),
                border: borderButton
                    ? Border.all(
                        color: CustomColors.orangeColor,
                      )
                    : null),
          ),
          Container(
            height: height ?? 50,
            width: width ?? double.infinity,
            decoration: BoxDecoration(
                color: CustomColors.whiteColor,

                // borderButton
                //     ? CustomColors.orangeColor.withOpacity(0.2)
                //     : onTap == null
                //         ? CustomColors.greyColor
                //         : buttonColor ?? CustomColors.orangeColor,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: CustomColors.borderGreyColor,
                )),
            child: Center(
              child: isLoading
                  ? const SizedBox(
                      height: 30,
                      width: 30,
                      child: CircularProgressIndicator(
                        color: CustomColors.whiteColor,
                      ),
                    )
                  : buttonChild ??
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Text(
                          title,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                            color: borderButton
                                ? CustomColors.orangeColor
                                : textColor ?? CustomColors.blackTextColor,
                          ),
                        ),
                      ),
            ),
          ),
        ],
      ),
    );
  }
}
