import 'package:cozy_cove/utils/spacers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/custom_colors.dart';

class CustomIconButton extends StatelessWidget {
  final String title, icon;
  final String? routeName;
  final bool isLoading;
  final bool isBoldTitle;
  final bool borderButton;
  final double? width, height;
  final void Function()? onTap;
  const CustomIconButton({
    super.key,
    required this.title,
    required this.icon,
    this.routeName,
    this.onTap,
    this.isLoading = false,
    this.isBoldTitle = true,
    this.borderButton = false,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ??
          () {
            // Navigator.pushNamed(context, routeName!);
            // Navigator.canPop(context) ? Navigator.pop(context) : null;
          },
      child: Container(
        height: height ?? 55,
        width: width ?? double.infinity,
        decoration: BoxDecoration(
            color: borderButton
                ? CustomColors.orangeColor.withOpacity(0.2)
                : onTap == null
                    ? CustomColors.greyColor
                    : CustomColors.orangeColor,
            borderRadius: BorderRadius.circular(27.5),
            border: borderButton
                ? Border.all(
                    color: CustomColors.orangeColor,
                  )
                : null),
        child: Center(
          child: isLoading
              ? const SizedBox(
                  height: 30,
                  width: 30,
                  child: CircularProgressIndicator(
                    color: CustomColors.whiteColor,
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(icon),
                    horizontalSpacer(5),
                    Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        color: borderButton
                            ? CustomColors.orangeColor
                            : CustomColors.whiteColor,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
