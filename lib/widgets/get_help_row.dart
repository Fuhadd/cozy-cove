import 'package:cozy_cove/constants/custom_colors.dart';
import 'package:cozy_cove/constants/custom_string.dart';
import 'package:cozy_cove/utils/spacers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class GetHelpRow extends StatelessWidget {
  final bool centerAlign;
  const GetHelpRow({
    super.key,
    this.centerAlign = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          centerAlign ? MainAxisAlignment.center : MainAxisAlignment.end,
      children: [
        SvgPicture.asset(
          ConstantString.helpIcon,
        ),
        horizontalSpacer(5),
        Text(
          "Get Help",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 12.sp,
            color: CustomColors.orangeColor,
          ),
        ),
      ],
    );
  }
}
