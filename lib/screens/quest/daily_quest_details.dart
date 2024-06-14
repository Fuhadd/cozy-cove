import 'package:cozy_cove/constants/custom_colors.dart';
import 'package:cozy_cove/constants/custom_string.dart';
import 'package:cozy_cove/utils/spacers.dart';
import 'package:cozy_cove/widgets/custom_border_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class DailyQuestDetailsScreen extends StatefulWidget {
  const DailyQuestDetailsScreen({
    super.key,
  });

  @override
  State<DailyQuestDetailsScreen> createState() =>
      _DailyQuestDetailsScreenState();
}

class _DailyQuestDetailsScreenState extends State<DailyQuestDetailsScreen> {
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
          "Daily Quest",
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
                          padding: EdgeInsets.only(
                              left: 15.0, right: 15, top: 10, bottom: 3),
                          child: Row(
                            children: [
                              Text(
                                "Monthly 50 Push ups",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: CustomColors.blackTextColor),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15.0,
                          ),
                          child: Row(
                            children: [
                              Text(
                                "Exercise | Day 7 of 30",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14.sp,
                                    color: CustomColors.modalLightColor),
                              ),
                            ],
                          ),
                        ),
                        verticalSpacer(15),
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
                            Column(
                              children: [
                                Container(
                                  height: 55,
                                  width: 55,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: AssetImage(ConstantString.youPic),
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
                          ],
                        ),
                        verticalSpacer(35),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: CustomBorderButton(
                              title: "Update Activity",
                              onTap: () {
                                // Navigator.pushNamed(
                                //     context, SignInScreen.routeName);
                              }),
                        ),
                        verticalSpacer(15),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const Center(
              child: Text(
                "Skip Challenge",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: CustomColors.redColor),
              ),
            ),
            verticalSpacer(30),
          ],
        ),
      ),
    );
  }
}
