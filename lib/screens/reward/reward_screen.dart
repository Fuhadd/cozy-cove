import 'package:cozy_cove/constants/custom_colors.dart';
import 'package:cozy_cove/constants/custom_string.dart';
import 'package:cozy_cove/utils/spacers.dart';
import 'package:cozy_cove/widgets/challenges_list_widget.dart';
import 'package:cozy_cove/widgets/custom_appbar.dart';
import 'package:cozy_cove/widgets/custom_border_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RewardScreen extends StatefulWidget {
  const RewardScreen({
    super.key,
  });

  @override
  State<RewardScreen> createState() => _RewardScreenState();
}

class _RewardScreenState extends State<RewardScreen> {
  int selectedIndex = 0;
  bool showAmount = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + 20,
          left: 20,
          right: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpacer(10),
            const CustomAppBar(
              title: "Rewards",
            ),
            // verticalSpacer(15),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            CustomColors.gradientBlueColor,
                            CustomColors.gradientPurpleColor,
                          ],
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15.0,
                          vertical: 18,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      ConstantString.starFilled,
                                      height: 26,
                                      color: CustomColors.yellowColor,
                                    ),
                                    horizontalSpacer(5),
                                    const Text(
                                      "45",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 40,
                                          color: CustomColors.whiteColor),
                                    ),
                                  ],
                                ),
                                // verticalSpacer(5),
                                Text(
                                  "Points Earned",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      color: CustomColors.lightWhiteTextColor
                                          .withOpacity(0.7)),
                                ),
                              ],
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: CustomColors.lightWhiteTextColor
                                    .withOpacity(0.14),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 5,
                                ),
                                child: Text(
                                  "View Insights",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color: CustomColors.whiteColor),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    verticalSpacer(10),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: CustomColors.dividerGreyColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15.0,
                          vertical: 10,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SvgPicture.asset(
                              ConstantString.peopleOutlined,
                              height: 17,
                              color: CustomColors.mainBlueColor,
                            ),
                            horizontalSpacer(10),
                            const Text(
                              "Earn more Points by inviting your friends",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 13,
                                  color: CustomColors.mainBlueColor),
                            ),
                          ],
                        ),
                      ),
                    ),
                    verticalSpacer(25),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: CustomColors.borderGreyColor,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 15.0,
                              vertical: 10,
                            ),
                            child: Text(
                              "Daily Reward",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: CustomColors.blackTextColor),
                            ),
                          ),
                          const Divider(
                            color: CustomColors.borderGreyColor,
                          ),
                          verticalSpacer(15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                ConstantString.starFilled,
                                height: 26,
                                color: CustomColors.yellowColor,
                              ),
                              horizontalSpacer(5),
                              const Text(
                                "5",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 40,
                                    color: CustomColors.blackTextColor),
                              ),
                            ],
                          ),
                          verticalSpacer(15),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: CustomBorderButton(
                                title: "Claim in: 12hr 32min",
                                onTap: () {
                                  // Navigator.pushNamed(
                                  //     context, SignInScreen.routeName);
                                }),
                          ),
                          verticalSpacer(15),
                        ],
                      ),
                    ),
                    verticalSpacer(15),
                    const Text(
                      "Completed challenges",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: CustomColors.blackTextColor),
                    ),
                    verticalSpacer(15),
                    const ChallengesListWidget(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
