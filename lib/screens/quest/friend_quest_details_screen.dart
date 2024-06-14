import 'package:cozy_cove/constants/custom_colors.dart';
import 'package:cozy_cove/constants/custom_string.dart';
import 'package:cozy_cove/utils/spacers.dart';
import 'package:cozy_cove/widgets/custom_border_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FriendQuestDetailsScreen extends StatefulWidget {
  const FriendQuestDetailsScreen({
    super.key,
  });

  @override
  State<FriendQuestDetailsScreen> createState() =>
      _FriendQuestDetailsScreenState();
}

class _FriendQuestDetailsScreenState extends State<FriendQuestDetailsScreen> {
  int selectedIndex = 0;
  bool showAmount = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).canPop() ? Navigator.pop(context) : null;
          },
          child: SizedBox(
            height: 30,
            width: 30,
            child: Center(
              child: SvgPicture.asset(
                ConstantString.chevronBack,
                height: 30,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        centerTitle: true,
        title: const Text(
          "Friends Quest",
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: CustomColors.blackTextColor),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 20,
          left: 20,
          right: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpacer(10),

            // verticalSpacer(15),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                            child: Row(
                              children: [
                                Text(
                                  "Yoga: 15 Palates ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      color: CustomColors.blackTextColor),
                                ),
                              ],
                            ),
                          ),
                          verticalSpacer(5),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15.0,
                            ),
                            child: LinearProgressIndicator(
                              value: 0.2, // 70% progress
                              backgroundColor: Colors.grey.withOpacity(0.4),
                              valueColor: const AlwaysStoppedAnimation<Color>(
                                CustomColors.mainBlueColor,
                              ),
                              borderRadius: BorderRadius.circular(5),

                              minHeight: 7.0, // Minimum height of the line
                            ),
                          ),
                          verticalSpacer(5),
                          const Divider(
                            color: CustomColors.borderGreyColor,
                          ),
                          verticalSpacer(15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Expanded(
                                child: SizedBox(),
                              ),
                              Column(
                                children: [
                                  Container(
                                    height: 55,
                                    width: 55,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        image:
                                            AssetImage(ConstantString.youPic),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  verticalSpacer(15),
                                  const Text(
                                    "You",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        color: CustomColors.blackTextColor),
                                  ),
                                ],
                              ),
                              const Expanded(
                                child: SizedBox(),
                              ),
                              Container(
                                height: 80,
                                width: 2,
                                decoration: const BoxDecoration(
                                  color: CustomColors.borderGreyColor,
                                ),
                              ),
                              const Expanded(
                                child: SizedBox(),
                              ),
                              Column(
                                children: [
                                  Container(
                                    height: 55,
                                    width: 55,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        image: AssetImage(
                                            ConstantString.friendPic),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  verticalSpacer(15),
                                  const Text(
                                    "Dunmola",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        color: CustomColors.blackTextColor),
                                  ),
                                ],
                              ),
                              const Expanded(
                                child: SizedBox(),
                              ),
                            ],
                          ),
                          verticalSpacer(35),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: CustomBorderButton(
                                title: "Claim in: 12hr 32min",
                                buttonChild: Padding(
                                  padding: const EdgeInsets.only(top: 4.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(ConstantString.bellIcon),
                                      horizontalSpacer(13),
                                      const Text(
                                        "Send reminder",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 14,
                                          color: CustomColors.blackTextColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  // Navigator.pushNamed(
                                  //     context, SignInScreen.routeName);
                                }),
                          ),
                          verticalSpacer(15),
                        ],
                      ),
                    ),
                    verticalSpacer(30),
                    RichText(
                      text: const TextSpan(
                        text: 'Location: ',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: CustomColors.greyColor),
                        children: [
                          TextSpan(
                            text: '24, Yanaworo. Twin towers',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: CustomColors.blackTextColor),
                          ),
                        ],
                      ),
                    ),
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
