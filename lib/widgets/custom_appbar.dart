import 'package:cozy_cove/constants/custom_colors.dart';
import 'package:cozy_cove/constants/custom_string.dart';
import 'package:cozy_cove/utils/spacers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  const CustomAppBar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 23,
                      color: CustomColors.blackTextColor),
                ),
              ],
            ),
            Row(
              children: [
                SvgPicture.asset(ConstantString.searchIcon),
                horizontalSpacer(20),
                SvgPicture.asset(ConstantString.notificationBell),
                horizontalSpacer(20),
                Container(
                  height: 40.h,
                  width: 40.w,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(
                        ConstantString.profilePic,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        verticalSpacer(5),
        const Divider(
          color: CustomColors.dividerGreyColor,
        ),
        verticalSpacer(15),
      ],
    );
  }
}
