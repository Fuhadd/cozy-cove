import 'package:cozy_cove/constants/custom_colors.dart';
import 'package:cozy_cove/models/quest_model.dart';
import 'package:cozy_cove/screens/quest/daily_quest_details.dart';
import 'package:cozy_cove/utils/spacers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuestListWidget extends StatelessWidget {
  const QuestListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: personalQuestLists.length,
      itemBuilder: (context, index) {
        var chat = personalQuestLists[index];
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const DailyQuestDetailsScreen(
                    // title: chat.title,
                    // isCounsellor: chat.isCouncellor,
                    )));
          },
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 60,
                        width: 60,
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        chat.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp,
                            color: CustomColors.blackTextColor),
                      ),
                      verticalSpacer(8),
                      Text(
                        chat.subTitle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp,
                            color: CustomColors.modalLightColor),
                      ),
                      verticalSpacer(8),
                      SizedBox(
                        height: 5,
                        width: 1.sw - 150,
                        child: LinearProgressIndicator(
                          value: 0.4, // 70% progress
                          backgroundColor: Colors.grey.withOpacity(0.4),
                          valueColor: const AlwaysStoppedAnimation<Color>(
                            CustomColors.mainBlueColor,
                          ),
                          borderRadius: BorderRadius.circular(5),

                          minHeight: 7.0, // Minimum height of the line
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              verticalSpacer(10),
              index == personalQuestLists.length - 1
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
          ),
        );
      },
    );
  }
}
