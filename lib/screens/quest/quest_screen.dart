import 'package:cozy_cove/constants/custom_colors.dart';
import 'package:cozy_cove/utils/spacers.dart';
import 'package:cozy_cove/widgets/custom_appbar.dart';
import 'package:cozy_cove/widgets/friends_quest_list_widget.dart';
import 'package:cozy_cove/widgets/quest_list_widget.dart';
import 'package:flutter/material.dart';

class QuestScreen extends StatefulWidget {
  const QuestScreen({
    super.key,
  });

  @override
  State<QuestScreen> createState() => _QuestScreenState();
}

class _QuestScreenState extends State<QuestScreen> {
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
              title: "Challenges",
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
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Row(
                                      children: [
                                        Text(
                                          "2/4",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 40,
                                              color: CustomColors.whiteColor),
                                        ),
                                      ],
                                    ),
                                    // verticalSpacer(5),
                                    Text(
                                      "Challenges completed",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          color: CustomColors
                                              .lightWhiteTextColor
                                              .withOpacity(0.7)),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            verticalSpacer(15),
                            LinearProgressIndicator(
                              value: 0.5, // 70% progress
                              backgroundColor: Colors.grey.withOpacity(0.4),
                              valueColor: const AlwaysStoppedAnimation<Color>(
                                CustomColors.progressGreenColor,
                              ),
                              borderRadius: BorderRadius.circular(5),

                              minHeight: 7.0, // Minimum height of the line
                            ),
                          ],
                        ),
                      ),
                    ),
                    verticalSpacer(35),
                    const Text(
                      "Personal Quest",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: CustomColors.blackTextColor),
                    ),
                    verticalSpacer(10),
                    const QuestListWidget(),
                    verticalSpacer(30),
                    const Text(
                      "Friends Quest",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: CustomColors.blackTextColor),
                    ),
                    verticalSpacer(10),
                    const FriendsQuestListWidget()
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
