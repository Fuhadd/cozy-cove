// ignore_for_file: must_be_immutable

import 'package:cozy_cove/constants/custom_colors.dart';
import 'package:cozy_cove/constants/custom_string.dart';
import 'package:cozy_cove/utils/spacers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SelectCurrencyDialog extends StatefulHookConsumerWidget {
  final Function()? onAmountChanged;
  StateProvider<String> provider;
  SelectCurrencyDialog({
    super.key,
    this.onAmountChanged,
    required this.provider,
  });

  @override
  _SelectCurrencyDialogState createState() => _SelectCurrencyDialogState();
}

class _SelectCurrencyDialogState extends ConsumerState<SelectCurrencyDialog> {
  String amount = "";

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: AlertDialog(
        backgroundColor: Colors.white,
        insetPadding: EdgeInsets.zero,
        contentPadding: EdgeInsets.zero,
        content: Container(
          width: 1.sw - 50.w,
          decoration: BoxDecoration(
              color: CustomColors.whiteColor,
              borderRadius: BorderRadius.circular(6)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      ref.read(widget.provider.notifier).state = "CAD";
                    });
                    Navigator.pop(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Container(
                              height: 17,
                              width: 17,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.amber,
                                  image: DecorationImage(
                                    image: AssetImage(
                                      ConstantString.fullCadFlag,
                                    ),
                                    fit: BoxFit.cover,
                                  )),
                            ),
                            horizontalSpacer(10),
                            Expanded(
                              child: Text(
                                "Canadian Dollar (CAD)",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15.sp,
                                  color: CustomColors.blackColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Visibility(
                        visible: ref.watch(widget.provider) == "CAD",
                        child: SvgPicture.asset(
                          ConstantString.selectedIcon,
                        ),
                      ),
                    ],
                  ),
                ),
                verticalSpacer(20),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      ref.read(widget.provider.notifier).state = "NGN";
                    });
                    Navigator.pop(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              height: 17,
                              width: 17,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: AssetImage(
                                      ConstantString.fullNgnFlag,
                                    ),
                                    fit: BoxFit.cover,
                                  )),
                            ),
                            horizontalSpacer(10),
                            Expanded(
                              child: Text(
                                "Naira (NGN)",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15.sp,
                                  color: CustomColors.blackColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Visibility(
                        visible: ref.watch(widget.provider) == "NGN",
                        child: SvgPicture.asset(
                          ConstantString.selectedIcon,
                        ),
                      ),
                    ],
                  ),
                ),
                verticalSpacer(30),
                GestureDetector(
                  onTap: () async {
                    Navigator.of(context).pop();
                  },
                  child: Row(
                    children: [
                      const Icon(
                        Icons.add,
                        color: CustomColors.orangeColor,
                      ),
                      horizontalSpacer(10),
                      Text(
                        "Add new currency",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15.sp,
                          color: CustomColors.orangeColor,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
