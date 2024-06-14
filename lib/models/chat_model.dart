import 'package:cozy_cove/constants/custom_string.dart';

class ChatModel {
  ChatModel({
    required this.message,
    required this.byMe,
  });

  String message;
  bool byMe;
}

class ChatListModel {
  ChatListModel({
    this.imageUrl,
    required this.lastMessage,
    required this.title,
    this.subTitle,
    required this.lastMessageTime,
    this.unreadMessages,
    required this.isCouncellor,
  });

  String title;
  String? subTitle;
  String lastMessage;
  String? imageUrl;
  String lastMessageTime;
  int? unreadMessages;
  bool isCouncellor;
}

List<ChatModel> chats = [];

List<ChatListModel> chatLists = [
  ChatListModel(
    imageUrl: ConstantString.aiImage,
    lastMessage: "Sure thing, I’ll have a look today.",
    title: "My AI",
    lastMessageTime: "2:34 PM",
    isCouncellor: false,
  ),
  ChatListModel(
    imageUrl: ConstantString.dumzy,
    lastMessage: "There’s a meeting soon",
    title: "Dumzy",
    lastMessageTime: "1:02 PM",
    subTitle: "Massage Enthusiast",
    isCouncellor: true,
  ),
  ChatListModel(
      imageUrl: ConstantString.revenant,
      lastMessage: "Did you start the raid",
      title: "Revenant",
      subTitle: "Art curator",
      lastMessageTime: "2:56 AM",
      isCouncellor: false,
      unreadMessages: 2),
];
