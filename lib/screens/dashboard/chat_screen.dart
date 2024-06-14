// ignore_for_file: use_build_context_synchronously

import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:cozy_cove/constants/custom_colors.dart';
import 'package:cozy_cove/constants/custom_string.dart';
import 'package:cozy_cove/models/chat_model.dart';
import 'package:cozy_cove/utils/spacers.dart';
import 'package:cozy_cove/widgets/custom_textfield.dart';
import 'package:cozy_cove/widgets/new_custom_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:huddle01_flutter_client/huddle01_flutter_client.dart';

class ChatScreen extends StatefulHookConsumerWidget {
  final String title;
  final bool isCounsellor;
  static const routeName = '/ChatScreen';
  const ChatScreen({
    super.key,
    this.isCounsellor = true,
    required this.title,
  });

  @override
  ConsumerState<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends ConsumerState<ChatScreen> {
  TextEditingController messageController = TextEditingController();
  int selectedIndex = 0;
  bool botSent = false;
  String message = "";
  List<String> items = ["CAD", "NGN"];
  String projectId = 'YOUR-PROJECT-ID';
  String roomId = 'YOUR-ROOM-ID';
  // HuddleClient huddleClient = HuddleClient();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + 20,
        ),
        child: Column(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.canPop(context)
                                ? Navigator.of(context).pop()
                                : null;
                          },
                          child: SvgPicture.asset(
                            ConstantString.chevronBack,
                            height: 25,
                          ),
                        ),
                        horizontalSpacer(10),
                        Container(
                          height: 35.h,
                          width: 35.w,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage(
                                ConstantString.aiImage,
                              ),
                            ),
                          ),
                        ),
                        horizontalSpacer(10),
                        Text(
                          widget.title,
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 20.sp,
                            color: CustomColors.blackColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  verticalSpacer(20),
                  widget.isCounsellor
                      ? Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, right: 20, bottom: 20),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Session schedule",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: CustomColors.modalLightColor),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: CustomColors.dividerGreyColor,
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        "Mar 24, 9:41 AM",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                            color: CustomColors.checkTextColor),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              verticalSpacer(10),
                              NewCustomButton(
                                  height: 40,
                                  title: "Join",
                                  onTap: () {
                                    // huddleClient.joinRoom();
                                    // Navigator.pushNamed(context, PseudonyminputScreen.routeName);
                                  }),
                            ],
                          ),
                        )
                      : const SizedBox.shrink(),
                  chats.isEmpty
                      ? Expanded(
                          child: Container(
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(ConstantString.chatDoodles),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                  child: Text(
                                    "Start conversation",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12.sp,
                                      color: CustomColors.greyTextColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      : Expanded(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 00.0),
                            child: Container(
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(ConstantString.chatDoodles),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: ListView.builder(
                                padding: const EdgeInsets.only(top: 10),
                                dragStartBehavior: DragStartBehavior.down,
                                itemCount: chats.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: BubbleSpecialThree(
                                      isSender: chats[index].byMe,
                                      text: chats[index].message,
                                      color: chats[index].byMe
                                          ? CustomColors.mainBlueColor
                                          : CustomColors.whiteColor,
                                      tail: true,
                                      delivered: true,
                                      textStyle: chats[index].byMe
                                          ? const TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                            )
                                          : const TextStyle(
                                              color: CustomColors.chatTextColor,
                                              fontSize: 16,
                                            ),
                                    ),
                                    // Padding(
                                    //   padding: EdgeInsets.only(
                                    //       bottom: 10,
                                    //       right: !chats[index].byMe ? 50 : 0,
                                    //       left: chats[index].byMe ? 50 : 0),
                                    //   child: Container(
                                    //     decoration: BoxDecoration(
                                    //       color: chats[index].byMe
                                    //           ? CustomColors.lighterOrange
                                    //           : CustomColors.textFieldColor,
                                    //       borderRadius: BorderRadius.only(
                                    //         topLeft: const Radius.circular(10),
                                    //         topRight: const Radius.circular(10),
                                    //         bottomLeft: !chats[index].byMe
                                    //             ? const Radius.circular(0)
                                    //             : const Radius.circular(10),
                                    //         bottomRight: chats[index].byMe
                                    //             ? const Radius.circular(0)
                                    //             : const Radius.circular(10),
                                    //       ),
                                    //     ),
                                    //     child: Padding(
                                    //       padding: const EdgeInsets.only(
                                    //           right: 15.0,
                                    //           left: 15,
                                    //           top: 10,
                                    //           bottom: 20),
                                    //       child: Text(
                                    //         chats[index].message,
                                    //         style: TextStyle(
                                    //           fontWeight: FontWeight.w500,
                                    //           fontSize: 12.sp,
                                    //           color: CustomColors
                                    //               .lighterBlackTextColor,
                                    //         ),
                                    //       ),
                                    //     ),
                                    //   ),
                                    // ),
                                  );
                                },
                              ),
                            ),
                          ),
                        )
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
              child: Row(
                children: [
                  const Icon(
                    Icons.add,
                    color: CustomColors.mainBlueColor,
                    size: 40,
                  ),
                  horizontalSpacer(10),
                  Expanded(
                    child: chatCustomTextField(
                      "email",
                      controller: messageController,
                      hintText: " Message",
                      onChanged: (value) {
                        setState(() {
                          message = value ?? "";
                        });
                      },
                    ),
                  ),
                  horizontalSpacer(15),
                  GestureDetector(
                    onTap: () async {
                      FocusScope.of(context).unfocus();
                      if (message.isNotEmpty) {
                        ChatModel newChat =
                            ChatModel(message: message, byMe: true);
                        chats.add(newChat);
                        setState(() {
                          message = "";
                          messageController.clear();
                        });
                        if (!botSent) {
                          await Future.delayed(const Duration(seconds: 1));
                          ChatModel botChat = ChatModel(
                              message:
                                  "Hi Just some moments I will be attending to your requests soon",
                              byMe: false);
                          chats.add(botChat);
                          setState(() {
                            botSent = true;
                          });
                        }
                      }
                    },
                    child: SvgPicture.asset(
                      ConstantString.sendIcon,
                      height: 30,
                    ),
                  ),
                ],
              ),
            ),
            verticalSpacer(MediaQuery.of(context).padding.bottom + 5)
          ],
        ),
      ),
    );
  }
}
