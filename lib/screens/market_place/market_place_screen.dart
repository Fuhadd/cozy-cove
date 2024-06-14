import 'package:cozy_cove/constants/custom_colors.dart';
import 'package:cozy_cove/utils/spacers.dart';
import 'package:cozy_cove/widgets/custom_appbar.dart';
import 'package:cozy_cove/widgets/marketplace_list_widget.dart';
import 'package:flutter/material.dart';

class MarketPlaceScreen extends StatefulWidget {
  // final void Function()? onTradeTap, onConvertTap;

  const MarketPlaceScreen({
    super.key,
  });

  @override
  State<MarketPlaceScreen> createState() => _MarketPlaceScreenState();
}

class _MarketPlaceScreenState extends State<MarketPlaceScreen>
    with SingleTickerProviderStateMixin {
  int selectedIndex = 0;
  bool showAmount = true;
  int currentFilterIndex = 0;

  List<String> filterTexts = [
    "Top Deals",
    "Travels",
    "Gym",
    "Events",
    "Wears",
  ];

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
              title: "Marketplace",
            ),
            SizedBox(
              height: 45,
              child: ListView.builder(
                itemCount: filterTexts.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 2.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          currentFilterIndex = index;
                        });
                      },
                      child: Center(
                        child: Container(
                          height: 47,
                          width: 95,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: index == currentFilterIndex
                                ? CustomColors.lightBlueColor
                                : null,
                          ),
                          child: Center(
                            child: Text(
                              filterTexts[index],
                              style: TextStyle(
                                  fontWeight: index == currentFilterIndex
                                      ? FontWeight.w500
                                      : FontWeight.w400,
                                  fontSize: 16,
                                  color: index == currentFilterIndex
                                      ? CustomColors.mainBlueColor
                                      : CustomColors.chipLabelColor),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            verticalSpacer(15),
            const Expanded(child: MarketPlaceListWidget()),
          ],
        ),
      ),
    );
  }
}
