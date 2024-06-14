import 'package:cozy_cove/constants/custom_string.dart';

class QuestListModel {
  QuestListModel({
    this.imageUrl,
    required this.title,
    required this.subTitle,
    this.isPersonal = true,
    // this.subTitleDetails,
  });

  String title;
  String subTitle;
  bool isPersonal;
  String? subTitleDetails;
  String? imageUrl;
}

List<QuestListModel> personalQuestLists = [
  QuestListModel(
    imageUrl: ConstantString.pushupImg,
    title: "Monthly 50 Push ups",
    subTitle: "Exercise | Day 7 of 30",
  ),
  QuestListModel(
    imageUrl: ConstantString.pushupImg,
    title: "Monthly 50 Push ups",
    subTitle: "Exercise | Day 7 of 30",
  ),
];

List<QuestListModel> friendQuestLists = [
  QuestListModel(
    imageUrl: ConstantString.pushupImg,
    title: "Yoga",
    subTitle: "Exercise",
    isPersonal: false,
  ),
  QuestListModel(
    imageUrl: ConstantString.pushupImg,
    title: "Amala Spots",
    subTitle: "Food",
    isPersonal: false,
  ),
];
