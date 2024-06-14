import 'package:cozy_cove/constants/custom_colors.dart';
import 'package:cozy_cove/models/chat_model.dart';
import 'package:cozy_cove/screens/dashboard/chat_screen.dart';
import 'package:cozy_cove/utils/spacers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatListWidget extends StatelessWidget {
  final bool showCouncellor;
  const ChatListWidget({
    super.key,
    this.showCouncellor = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: chatLists.length,
      itemBuilder: (context, index) {
        var chat = chatLists[index];
        return (showCouncellor && (index == 0 || index == 2))
            ? const SizedBox.shrink()
            : GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ChatScreen(
                            title: chat.title,
                            isCounsellor: chat.isCouncellor,
                          )));
                },
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage(chat.imageUrl!),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            horizontalSpacer(10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      chat.title,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16.sp,
                                          color: CustomColors.blackTextColor),
                                    ),
                                    chat.subTitle != null
                                        ? RichText(
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            text: TextSpan(
                                              text: " | ",
                                              style: TextStyle(
                                                  fontSize: 14.sp,
                                                  color: CustomColors
                                                      .blackTextColor),
                                              children: [
                                                TextSpan(
                                                  text: chat.subTitle!,
                                                  style: TextStyle(
                                                      fontSize: 14.sp,
                                                      color: CustomColors
                                                          .blackTextColor),
                                                )
                                              ],
                                            ),
                                          )
                                        : const SizedBox.shrink()
                                  ],
                                ),
                                verticalSpacer(3),
                                Text(
                                  chat.lastMessage,
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      color: CustomColors.greyTextColor),
                                )
                              ],
                            )
                          ],
                        ),
                        chat.unreadMessages == null
                            ? Align(
                                alignment: Alignment.topCenter,
                                child: Text(
                                  chat.lastMessageTime,
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      color: CustomColors.greyTextColor),
                                ),
                              )
                            : Column(
                                children: [
                                  Text(
                                    chat.lastMessageTime,
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        color: CustomColors.mainBlueColor),
                                  ),
                                  verticalSpacer(5),
                                  Container(
                                    height: 20,
                                    width: 20,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: CustomColors.mainBlueColor,
                                    ),
                                    child: Center(
                                      child: Text(
                                        chat.unreadMessages.toString(),
                                        style: TextStyle(
                                            fontSize: 12.sp,
                                            color: CustomColors.whiteColor),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                      ],
                    ),
                    verticalSpacer(10),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: Divider(
                        color: CustomColors.otpInputColor,
                      ),
                    ),
                    verticalSpacer(10),
                  ],
                ),
              );
      },
    );
  }
}
