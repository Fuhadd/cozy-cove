import 'package:cozy_cove/constants/custom_string.dart';

class ChallengesListModel {
  ChallengesListModel({
    this.imageUrl,
    required this.title,
  });

  String title;
  String? imageUrl;
}

List<ChallengesListModel> challengesLists = [
  ChallengesListModel(
    imageUrl: ConstantString.challengesImg,
    title: "50 Push ups",
  ),
  ChallengesListModel(
    imageUrl: ConstantString.challengesImg,
    title: "Yoga Palates del la..",
  ),
];
