import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

import '../constants/custom_colors.dart';

Widget customTextField(String name,
    {String? hintText,
    IconData? prefixIcon,
    IconData? suffixIcon,
    Widget? prefix,
    String? initialValue,
    bool isHint = false,
    bool obscureText = false,
    bool readOnly = false,
    String? helperText,
    String? Function(String?)? validator,
    TextEditingController? controller,
    void Function()? onSuffixTap,
    void Function(String?)? onChanged}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        // height: 50,
        child: FormBuilderTextField(
          initialValue: initialValue,
          cursorColor: CustomColors.mainBlueColor.withOpacity(0.7),
          name: name,
          obscureText: obscureText,
          validator: validator,
          readOnly: readOnly,
          onChanged: onChanged,
          controller: controller,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 13),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: CustomColors.lightGreyColor),
            ),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: CustomColors.mainBlueColor.withOpacity(0.3))),
            focusedErrorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red)),

            errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red.withOpacity(0.6))),

            suffixIcon: GestureDetector(
              onTap: onSuffixTap,
              child: Icon(
                suffixIcon,
                size: 16,
                color: CustomColors.blackColor,
              ),
            ),
            prefixIcon: prefixIcon != null
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        prefixIcon,
                        size: 16,
                        color: CustomColors.blackColor,
                      ),
                    ],
                  )
                : prefix,
            fillColor: CustomColors.textFieldColor,
            // filled: true,
            hintText: hintText,
            hintStyle: const TextStyle(
                color: CustomColors.hintTextColor,
                fontSize: 14,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
    ],
  );
}

Widget customTextField2(String name,
    {String? hintText,
    IconData? prefixIcon,
    IconData? suffixIcon,
    Widget? prefix,
    Widget? suffix,
    String? initialValue,
    bool lighterText = false,
    bool boldTitle = false,
    bool isHint = false,
    bool obscureText = false,
    bool readOnly = false,
    String? helperText,
    String? Function(String?)? validator,
    TextEditingController? controller,
    void Function()? onSuffixTap,
    void Function(String?)? onChanged}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        // height: 50,
        child: FormBuilderTextField(
          initialValue: initialValue,
          cursorColor: CustomColors.orangeColor.withOpacity(0.4),
          name: name,
          obscureText: obscureText,
          validator: validator,
          readOnly: readOnly,
          onChanged: onChanged,
          controller: controller,
          style: TextStyle(
              color: lighterText
                  ? CustomColors.greyTextColor
                  : CustomColors.blackColor,
              fontSize: boldTitle ? 16 : 13,
              fontWeight: boldTitle ? FontWeight.w700 : FontWeight.w500),
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 13),
            enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: CustomColors.whiteColor.withOpacity(0.5)),
            ),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: CustomColors.orangeColor.withOpacity(0.3))),
            focusedErrorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red)),
            suffixIcon: GestureDetector(
              onTap: onSuffixTap,
              child: suffix ??
                  Icon(
                    suffixIcon,
                    size: 16,
                    color: CustomColors.blackColor,
                  ),
            ),
            prefixIcon: prefix ??
                (prefixIcon != null
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            prefixIcon,
                            size: 16,
                            color: CustomColors.blackColor,
                          ),
                        ],
                      )
                    : null),
            fillColor: CustomColors.textFieldColor,
            filled: true,
            hintText: hintText,
            hintStyle: const TextStyle(
                color: CustomColors.greyTextColor,
                fontSize: 14,
                fontWeight: FontWeight.w400),
          ),
        ),
      ),
    ],
  );
}

Widget sendCustomTextField(String name,
    {String? hintText,
    IconData? prefixIcon,
    IconData? suffixIcon,
    Widget? prefix,
    Widget? suffix,
    String? initialValue,
    bool lighterText = false,
    bool isHint = false,
    bool obscureText = false,
    bool readOnly = false,
    TextInputType? keyboardType,
    String? helperText,
    String? Function(String?)? validator,
    TextEditingController? controller,
    void Function()? onSuffixTap,
    void Function(String?)? onChanged}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        // height: 50,
        child: FormBuilderTextField(
          initialValue: initialValue,
          cursorColor: CustomColors.blackColor,
          name: name,
          obscureText: obscureText,
          validator: validator,
          readOnly: readOnly,
          onChanged: onChanged,
          controller: controller,
          keyboardType: keyboardType,
          style: TextStyle(
              color: lighterText
                  ? CustomColors.greyTextColor
                  : CustomColors.blackColor,
              fontSize: 13,
              fontWeight: FontWeight.w500),
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
            ),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent)),
            focusedErrorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red)),
            suffixIcon: GestureDetector(
              onTap: onSuffixTap,
              child: suffix ??
                  Icon(
                    suffixIcon,
                    size: 16,
                    color: CustomColors.blackColor,
                  ),
            ),
            prefixIcon: prefixIcon != null
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        prefixIcon,
                        size: 16,
                        color: CustomColors.blackColor,
                      ),
                    ],
                  )
                : null,
            fillColor: CustomColors.textFieldColor,
            filled: true,
            hintText: hintText,
            hintStyle: const TextStyle(
                color: CustomColors.greyTextColor,
                fontSize: 12,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
    ],
  );
}

Widget customMultiTextField(String name,
    {String? hintText,
    IconData? prefixIcon,
    IconData? suffixIcon,
    Widget? prefix,
    String? initialValue,
    double height = 120,
    bool isHint = false,
    bool obscureText = false,
    bool readOnly = false,
    String? helperText,
    String? Function(String?)? validator,
    TextEditingController? controller,
    void Function()? onSuffixTap,
    void Function(String?)? onChanged}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        height: height,
        child: FormBuilderTextField(
          initialValue: initialValue,
          cursorColor: CustomColors.orangeColor.withOpacity(0.4),
          name: name,
          obscureText: obscureText,
          validator: validator,
          readOnly: readOnly,
          maxLines: 20,
          onChanged: onChanged,
          controller: controller,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 13),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: CustomColors.lightGreyColor),
            ),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: CustomColors.mainBlueColor.withOpacity(0.3))),
            focusedErrorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red)),
            suffixIcon: GestureDetector(
              onTap: onSuffixTap,
              child: Icon(
                suffixIcon,
                size: 16,
                color: CustomColors.blackColor,
              ),
            ),
            prefixIcon: prefixIcon != null
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        prefixIcon,
                        size: 16,
                        color: CustomColors.blackColor,
                      ),
                    ],
                  )
                : prefix,
            fillColor: CustomColors.textFieldColor,
            // filled: true,
            hintText: hintText,
            hintStyle: const TextStyle(
                color: CustomColors.hintTextColor,
                fontSize: 14,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
    ],
  );
}

Widget customTextField3(String name,
    {required String hintText,
    IconData? prefixIcon,
    IconData? suffixIcon,
    Widget? prefix,
    String? initialValue,
    bool isHint = false,
    bool obscureText = false,
    String? helperText,
    String? Function(String?)? validator,
    void Function()? onSuffixTap,
    void Function(String?)? onChanged}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        height: 45,
        child: FormBuilderTextField(
          initialValue: initialValue,
          cursorColor: CustomColors.orangeColor.withOpacity(0.4),
          name: name,
          obscureText: obscureText,
          validator: validator,
          onChanged: onChanged,
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: CustomColors.whiteColor),
                borderRadius: BorderRadius.circular(5),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: const BorderSide(color: CustomColors.orangeColor),
                borderRadius: BorderRadius.circular(5),
              ),
              suffixIcon: GestureDetector(
                onTap: onSuffixTap,
                child: Icon(
                  suffixIcon,
                  size: 16,
                  color: CustomColors.blackColor,
                ),
              ),
              fillColor: CustomColors.whiteColor,
              filled: true,
              hintText: hintText,
              // labelText: hintText,
              hintStyle: const TextStyle(
                  color: CustomColors.greyTextColor, fontSize: 13)),
        ),
      ),
    ],
  );
}

Widget customPhoneTextField(
  String name, {
  required String hintText,
  IconData? prefixIcon,
  IconData? suffixIcon,
  Widget? prefix,
  String? initialValue,
  bool isHint = false,
  bool obscureText = false,
  String? helperText,
  String? Function(String?)? validator,
  FocusNode? focusNode,
  void Function()? onSuffixTap,
  void Function(PhoneNumber)? onChanged,
  TextEditingController? controller,
}) {
  return IntlPhoneField(
    controller: controller,
    dropdownIconPosition: IconPosition.trailing,
    pickerDialogStyle:
        PickerDialogStyle(backgroundColor: CustomColors.whiteColor),
    dropdownIcon: const Icon(
      Icons.keyboard_arrow_down_sharp,
      size: 20,
    ),
    cursorColor: CustomColors.orangeColor.withOpacity(0.3),
    decoration: InputDecoration(
        counterText: "",
        // labelText: hintText,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        errorBorder:
            const OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
        enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: CustomColors.whiteColor.withOpacity(0.5)),
        ),
        focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: CustomColors.orangeColor.withOpacity(0.3))),
        floatingLabelStyle: TextStyle(
            color: CustomColors.orangeColor.withOpacity(0.3),
            fontWeight: FontWeight.w700),
        suffixIcon: GestureDetector(
          onTap: onSuffixTap,
          child: Icon(
            suffixIcon,
            size: 16,
            color: CustomColors.blackColor,
          ),
        ),
        fillColor: CustomColors.textFieldColor,
        filled: true,
        hintText: hintText,
        hintStyle: TextStyle(
            color: CustomColors.hintTextColor.withOpacity(0.2),
            fontSize: 13,
            fontWeight: FontWeight.w500),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 0, vertical: 18)),
    initialCountryCode: 'US',
    onChanged: onChanged,
  );
}

Widget customPhoneTextField1(
  String name, {
  required String hintText,
  IconData? prefixIcon,
  IconData? suffixIcon,
  Widget? prefix,
  String? initialValue,
  bool isHint = false,
  bool obscureText = false,
  String? helperText,
  String? Function(String?)? validator,
  FocusNode? focusNode,
  void Function()? onSuffixTap,
  void Function(PhoneNumber)? onChanged,
  TextEditingController? controller,
}) {
  return IntlPhoneField(
    dropdownTextStyle:
        TextStyle(color: CustomColors.greyColor.withOpacity(0.8)),
    controller: controller,
    decoration: InputDecoration(
        labelText: hintText,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        enabledBorder: UnderlineInputBorder(
          borderSide:
              BorderSide(color: CustomColors.greyColor.withOpacity(0.5)),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: CustomColors.orangeColor),
        ),
        floatingLabelStyle: TextStyle(
            color: CustomColors.orangeColor.withOpacity(0.3),
            fontWeight: FontWeight.w700),
        suffixIcon: GestureDetector(
          onTap: onSuffixTap,
          child: Icon(
            suffixIcon,
            size: 16,
            color: CustomColors.blackColor,
          ),
        ),
        //     fillColor: Colors.grey.shade200,
        //     filled: true,
        // hintText: hintText,
        labelStyle: const TextStyle(color: CustomColors.greyColor),
        contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8)),
    initialCountryCode: 'NG',
    onChanged: onChanged,
    // validator: (input) => input!.number.length < 6
    //     ? 'Password must be atleast 6 characters'
    //     : null,
    validator: FormBuilderValidators.compose(
      [
        FormBuilderValidators.required(
            errorText: 'Phone Number cannot be empty '),
      ],
    ),
  );
}

Widget searchCustomTextField(String name,
    {String? hintText,
    IconData? prefixIcon,
    IconData? suffixIcon,
    Widget? prefix,
    String? initialValue,
    bool isHint = false,
    bool obscureText = false,
    bool readOnly = false,
    String? helperText,
    String? Function(String?)? validator,
    TextEditingController? controller,
    void Function()? onSuffixTap,
    void Function(String?)? onChanged}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        // height: 50,
        child: FormBuilderTextField(
          initialValue: initialValue,
          cursorColor: CustomColors.orangeColor.withOpacity(0.4),
          name: name,
          obscureText: obscureText,
          validator: validator,
          readOnly: readOnly,
          onChanged: onChanged,
          controller: controller,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 18),
            enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: CustomColors.whiteColor.withOpacity(0.5)),
              borderRadius: BorderRadius.circular(20),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: CustomColors.orangeColor.withOpacity(0.3)),
              borderRadius: BorderRadius.circular(20),
            ),
            focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
            ),
            suffixIcon: GestureDetector(
              onTap: onSuffixTap,
              child: Icon(
                suffixIcon,
                size: 16,
                color: CustomColors.blackColor,
              ),
            ),
            prefixIcon: prefixIcon != null
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        prefixIcon,
                        size: 16,
                        color: CustomColors.blackColor,
                      ),
                    ],
                  )
                : prefix,
            fillColor: CustomColors.textFieldColor,
            filled: true,
            hintText: hintText,
            hintStyle: const TextStyle(
                color: CustomColors.greyTextColor,
                fontSize: 12,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
    ],
  );
}

Widget chatCustomTextField(String name,
    {String? hintText,
    IconData? prefixIcon,
    IconData? suffixIcon,
    Widget? prefix,
    Widget? suffix,
    String? initialValue,
    bool lighterText = false,
    bool isHint = false,
    bool obscureText = false,
    bool readOnly = false,
    TextInputType? keyboardType,
    String? helperText,
    String? Function(String?)? validator,
    TextEditingController? controller,
    void Function()? onSuffixTap,
    void Function(String?)? onChanged}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        height: 40,
        child: FormBuilderTextField(
          initialValue: initialValue,
          cursorColor: CustomColors.blackColor,
          name: name,
          obscureText: obscureText,
          validator: validator,
          readOnly: readOnly,
          onChanged: onChanged,
          controller: controller,
          keyboardType: keyboardType,
          style: TextStyle(
              color: lighterText
                  ? CustomColors.greyTextColor
                  : CustomColors.blackColor,
              fontSize: 13,
              fontWeight: FontWeight.w500),
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            enabledBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: CustomColors.messageBorderColor),
              borderRadius: BorderRadius.circular(20),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: CustomColors.messageBorderColor),
              borderRadius: BorderRadius.circular(20),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: CustomColors.messageBorderColor),
              borderRadius: BorderRadius.circular(20),
            ),
            suffixIcon: GestureDetector(
              onTap: onSuffixTap,
              child: suffix ??
                  Icon(
                    suffixIcon,
                    size: 16,
                    color: CustomColors.blackColor,
                  ),
            ),
            prefixIcon: prefixIcon != null
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        prefixIcon,
                        size: 16,
                        color: CustomColors.blackColor,
                      ),
                    ],
                  )
                : prefix,
            fillColor: CustomColors.dividerGreyColor,
            filled: true,
            hintText: hintText,
            hintStyle: const TextStyle(
                color: CustomColors.greyTextColor,
                fontSize: 12,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
    ],
  );
}
