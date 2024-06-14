import 'package:cozy_cove/constants/custom_colors.dart';
import 'package:cozy_cove/constants/custom_string.dart';
import 'package:cozy_cove/models/challenges_model.dart';
import 'package:cozy_cove/utils/spacers.dart';
import 'package:cozy_cove/widgets/custom_border_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ChallengesListWidget extends StatelessWidget {
  const ChallengesListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: challengesLists.length,
      itemBuilder: (context, index) {
        var chat = challengesLists[index];
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(chat.imageUrl!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    horizontalSpacer(10),
                  ],
                ),
                Expanded(
                  child: Text(
                    chat.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                        color: CustomColors.blackTextColor),
                  ),
                ),
                Row(
                  children: [
                    horizontalSpacer(10),
                    SvgPicture.asset(ConstantString.greenCheckmark),
                    horizontalSpacer(10),
                    SizedBox(
                      width: 110,
                      child: CustomBorderButton(
                          title: "Claim 15 pts",
                          onTap: () {
                            // Navigator.pushNamed(
                            //     context, SignInScreen.routeName);
                          }),
                    ),
                  ],
                ),
              ],
            ),
            verticalSpacer(10),
            index == challengesLists.length - 1
                ? const SizedBox.shrink()
                : Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.0),
                        child: Divider(
                          color: CustomColors.otpInputColor,
                        ),
                      ),
                      verticalSpacer(10),
                    ],
                  ),
          ],
        );
      },
    );
  }
}
