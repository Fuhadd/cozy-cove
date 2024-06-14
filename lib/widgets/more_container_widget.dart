import 'package:cozy_cove/constants/custom_string.dart';
import 'package:cozy_cove/utils/spacers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class MoreWidgets extends StatelessWidget {
  final String icon, title;
  final void Function()? onTap;
  final Widget? endLabel;
  final double bottomPadding;
  final Color? color;

  const MoreWidgets({
    super.key,
    required this.icon,
    required this.onTap,
    required this.title,
    this.endLabel,
    this.bottomPadding = 40,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: bottomPadding),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  icon,
                ),
                horizontalSpacer(16),
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp,
                    color: color,
                  ),
                ),
              ],
            ),
            endLabel ?? SvgPicture.asset(ConstantString.arrowRightGrey),
          ],
        ),
      ),
    );
  }
}
