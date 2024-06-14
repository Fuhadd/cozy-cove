import 'package:cozy_cove/constants/custom_colors.dart';
import 'package:cozy_cove/constants/custom_string.dart';
import 'package:cozy_cove/screens/reward/reward_screen.dart';
import 'package:cozy_cove/screens/dashboard/dashboard_screen.dart';
import 'package:cozy_cove/screens/market_place/market_place_screen.dart';
import 'package:cozy_cove/screens/quest/quest_screen.dart';
import 'package:cozy_cove/utils/spacers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomNavigationScreen extends StatefulWidget {
  static const routeName = '/BottomNavigationScreen';

  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> screenLists = [
      const HomeScreen(),
      const RewardScreen(),
      const QuestScreen(),
      const MarketPlaceScreen(),
    ];
    return PopScope(
      // },
      canPop: false,
      child: SafeArea(
        top: false,
        child: Scaffold(
          // resizeToAvoidBottomInset: false,

          bottomNavigationBar: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Divider(
                color: CustomColors.dividerGreyColor,
              ),
              BottomAppBar(
                // height: 80,
                // shadowColor: Colors.black.withOpacity(0.33),
                elevation: 0,
                padding: EdgeInsets.zero,
                // height: 70,

                color: CustomColors.whiteColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            index = 0;
                          });
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(
                              index == 0
                                  ? ConstantString.chatFilled
                                  : ConstantString.chatOutlined,
                              height: 20,
                              // color: index == 0
                              //     ? CustomColors.orangeColor
                              //     : CustomColors.greyColor,
                            ),
                            verticalSpacer(4),
                            Text(
                              "Chats",
                              style: TextStyle(
                                  color: index == 0
                                      ? CustomColors.mainBlueColor
                                      : CustomColors.hintTextColor,
                                  fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          index = 1;
                        });
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            index == 1
                                ? ConstantString.starFilled
                                : ConstantString.starOutlined,
                            height: 20,
                            // color: index == 1
                            //     ? CustomColors.orangeColor
                            //     : CustomColors.greyColor,
                          ),
                          verticalSpacer(4),
                          Text(
                            "Reward",
                            style: TextStyle(
                                color: index == 1
                                    ? CustomColors.mainBlueColor
                                    : CustomColors.hintTextColor,
                                fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          index = 2;
                        });
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            index == 2 ? Icons.people : Icons.people_outline,
                            size: 25,
                            color: index == 2
                                ? CustomColors.mainBlueColor
                                : CustomColors.hintTextColor,
                          ),
                          // SvgPicture.asset(
                          //   index == 2
                          //       ? ConstantString.peopleFilled
                          //       : ConstantString.peopleOutlined,
                          //   height: 20,
                          //   // color: index == 2
                          //   //     ? CustomColors.orangeColor
                          //   //     : CustomColors.greyColor,
                          // ),
                          verticalSpacer(4),
                          Text(
                            "Quest",
                            style: TextStyle(
                                color: index == 2
                                    ? CustomColors.mainBlueColor
                                    : CustomColors.hintTextColor,
                                fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          index = 3;
                        });
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            index == 3
                                ? ConstantString.marketplaceFilled
                                : ConstantString.marketplaceOutlined,
                            height: 20,
                          ),
                          verticalSpacer(4),
                          Text(
                            "Marketplace",
                            style: TextStyle(
                                color: index == 3
                                    ? CustomColors.mainBlueColor
                                    : CustomColors.hintTextColor,
                                fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(right: 10.0),
                    //   child: GestureDetector(
                    //     onTap: () {
                    //       setState(() {
                    //         index = 4;
                    //       });
                    //     },
                    //     child: Column(
                    //       mainAxisSize: MainAxisSize.min,
                    //       children: [
                    //         SvgPicture.asset(
                    //           ConstantString.moreIcon,
                    //           height: 24,
                    //           color: index == 4
                    //               ? CustomColors.orangeColor
                    //               : CustomColors.greyColor,
                    //         ),
                    //         verticalSpacer(4),
                    //         Text(
                    //           "More",
                    //           style: TextStyle(
                    //               color: index == 4
                    //                   ? CustomColors.orangeColor
                    //                   : CustomColors.greyColor,
                    //               fontSize: 13),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          ),
          body: screenLists[index],
        ),
      ),
    );
  }
}
