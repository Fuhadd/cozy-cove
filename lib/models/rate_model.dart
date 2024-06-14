import 'package:cozy_cove/constants/custom_string.dart';

class RateModel {
  RateModel({
    required this.flagImage,
    required this.isProfit,
  });

  String flagImage;
  bool isProfit;
}

List<RateModel> rates = [
  RateModel(
    flagImage: ConstantString.flag1Img,
    isProfit: true,
  ),
  RateModel(
    flagImage: ConstantString.flag2Img,
    isProfit: false,
  ),
  RateModel(
    flagImage: ConstantString.flag3Img,
    isProfit: true,
  ),
  RateModel(
    flagImage: ConstantString.flag4Img,
    isProfit: false,
  ),
  RateModel(
    flagImage: ConstantString.flag5Img,
    isProfit: false,
  ),
  RateModel(
    flagImage: ConstantString.flag6Img,
    isProfit: true,
  ),
];
