import 'package:cozy_cove/constants/custom_colors.dart';
import 'package:cozy_cove/screens/app_view_model.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class IdTypeDropdown extends StatefulHookConsumerWidget {
  const IdTypeDropdown({
    super.key,
  });

  @override
  ConsumerState<IdTypeDropdown> createState() => _IdTypeDropdownState();
}

class _IdTypeDropdownState extends ConsumerState<IdTypeDropdown> {
  final List<String> items = [
    "Driver’s License",
    "Nation ID Card",
    "International Passport",
  ];
  String? selecteditem;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 60,
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: CustomColors.textFieldColor,
                borderRadius: BorderRadius.circular(10),
                border: selecteditem == null
                    ? null
                    : Border.all(color: CustomColors.whiteColor)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
                children: [
                  Expanded(
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        icon: const Icon(Icons.keyboard_arrow_down_sharp),
                        // padding: const EdgeInsets.all(30),
                        // isDense: true,
                        // elevation: 10,
                        // selectedItemBuilder: (context) {

                        // },
                        hint: const Text(
                          "Select your type of ID",
                          style: TextStyle(
                              color: CustomColors.greyTextColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                        value: selecteditem,
                        onChanged: (String? newValue) async {
                          if (newValue != null) {
                            selecteditem = newValue;
                            ref.read(idTypeProvider.notifier).state = newValue;
                            setState(() {});
                          }
                        },
                        items:
                            items.map<DropdownMenuItem<String>>((String item) {
                          return DropdownMenuItem<String>(
                            value: item,
                            child: Text(item),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
