import 'package:cozy_cove/constants/custom_colors.dart';
import 'package:cozy_cove/constants/custom_string.dart';
import 'package:cozy_cove/models/market_place_model.dart';
import 'package:cozy_cove/utils/spacers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MarketPlaceListWidget extends StatelessWidget {
  const MarketPlaceListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      // physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: marketplaceLists.length,
      itemBuilder: (context, index) {
        var marketPlace = marketplaceLists[index];
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Container(
                        height: 100,
                        width: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          image: const DecorationImage(
                            image: AssetImage(ConstantString.marketplaceImg),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      horizontalSpacer(20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: const TextSpan(
                                text: 'AVI Travels. ',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                    color: CustomColors.hintTextColor),
                                children: [
                                  TextSpan(
                                    text: 'USDC 2500',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      color: CustomColors.blackTextColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            verticalSpacer(10),
                            SizedBox(
                              child: Text(
                                "10% Discount on Trip to ${marketPlace.title}",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16.sp,
                                    color: CustomColors.blackTextColor),
                              ),
                            ),
                            verticalSpacer(10),
                            RichText(
                              text: const TextSpan(
                                text: 'Cost: ',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    color: CustomColors.greyTextColor),
                                children: [
                                  TextSpan(
                                    text: '4500 Points',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                        color: CustomColors.mainBlueColor),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
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
        );
      },
    );
  }
}
