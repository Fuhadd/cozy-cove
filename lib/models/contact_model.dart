import 'package:cozy_cove/constants/custom_colors.dart';
import 'package:flutter/material.dart';

class ContactModel {
  ContactModel({
    required this.firstName,
    required this.lastName,
    required this.isNigeria,
  });

  String firstName;
  String lastName;
  bool isNigeria;
}

class FullContactModel {
  FullContactModel({
    required this.firstName,
    required this.lastName,
    required this.isNigeria,
    required this.color,
  });

  String firstName;
  String lastName;
  Color color;
  bool isNigeria;
}

class DetailedContactModel {
  DetailedContactModel({
    required this.firstName,
    required this.lastName,
    required this.isNigeria,
    required this.color,
    required this.accountNumber,
    required this.bankName,
  });

  String firstName;
  String lastName;
  String accountNumber;
  String bankName;
  Color color;
  bool isNigeria;
}

List<ContactModel> contacts = [
  ContactModel(
    firstName: "Galbat",
    lastName: "Peace",
    isNigeria: true,
  ),
  ContactModel(
    firstName: "Galbat",
    lastName: "Peace",
    isNigeria: false,
  ),
  ContactModel(
    firstName: "Galbat",
    lastName: "Peace",
    isNigeria: true,
  ),
  ContactModel(
    firstName: "Galbat",
    lastName: "Peace",
    isNigeria: true,
  ),
  ContactModel(
    firstName: "Galbat",
    lastName: "Peace",
    isNigeria: false,
  ),
  ContactModel(
    firstName: "Galbat",
    lastName: "Peace",
    isNigeria: false,
  ),
  ContactModel(
    firstName: "Galbat",
    lastName: "Peace",
    isNigeria: false,
  ),
];

List<FullContactModel> newContacts = [
  FullContactModel(
    firstName: "Ronald",
    lastName: "Richards",
    isNigeria: true,
    color: CustomColors.contactBlackBgColor,
  ),
  FullContactModel(
    firstName: "Albert",
    lastName: "Flores",
    isNigeria: false,
    color: CustomColors.darkGreenColor,
  ),
  FullContactModel(
    firstName: "Jane",
    lastName: "Cooper",
    isNigeria: true,
    color: CustomColors.purpleColor,
  ),
  FullContactModel(
    firstName: "Darrell",
    lastName: "Steward",
    isNigeria: true,
    color: CustomColors.contactBlueBgColor,
  ),
  FullContactModel(
    firstName: "Guy",
    lastName: "Hawkins",
    isNigeria: false,
    color: CustomColors.brownColor,
  ),
  FullContactModel(
    firstName: "Kathryn",
    lastName: "Murphy",
    isNigeria: false,
    color: CustomColors.deepYellowColor,
  ),
  FullContactModel(
    firstName: "Galbat",
    lastName: "Peace",
    isNigeria: false,
    color: CustomColors.blackColor,
  ),
];

List<DetailedContactModel> detailedContacts = [
  DetailedContactModel(
    firstName: "Arlene",
    lastName: "McCoy",
    isNigeria: false,
    accountNumber: "0023432345",
    bankName: "Access",
    color: CustomColors.deepPurpleColor,
  ),
  DetailedContactModel(
    firstName: "Cameron",
    lastName: "Williamson",
    isNigeria: true,
    accountNumber: "0023432345",
    bankName: "Access",
    color: CustomColors.color1,
  ),
  DetailedContactModel(
    firstName: "Wade",
    lastName: "Warren",
    isNigeria: false,
    accountNumber: "0023432345",
    bankName: "Access",
    color: CustomColors.color2,
  ),
  DetailedContactModel(
    firstName: "Kathryn",
    lastName: "Murphy",
    isNigeria: true,
    accountNumber: "0023432345",
    bankName: "Access",
    color: CustomColors.color3,
  ),
  DetailedContactModel(
    firstName: "Albert",
    lastName: "Flores",
    isNigeria: false,
    accountNumber: "0023432345",
    bankName: "Access",
    color: CustomColors.color2,
  ),
  DetailedContactModel(
    firstName: "Marvin",
    lastName: "McKinney",
    isNigeria: false,
    accountNumber: "0023432345",
    bankName: "Access",
    color: CustomColors.deepPurpleColor,
  ),
  DetailedContactModel(
    firstName: "Courtney",
    lastName: "Henry",
    isNigeria: true,
    accountNumber: "0023432345",
    bankName: "Access",
    color: CustomColors.lightBlackTextColor,
  ),
  DetailedContactModel(
    firstName: "Jerome",
    lastName: "Bell",
    isNigeria: true,
    accountNumber: "0023432345",
    bankName: "Access",
    color: CustomColors.color3,
  ),
  DetailedContactModel(
    firstName: "Esther",
    lastName: "Howard",
    isNigeria: true,
    accountNumber: "0023432345",
    bankName: "Access",
    color: CustomColors.color4,
  ),
  DetailedContactModel(
    firstName: "Ronald",
    lastName: "Richards",
    isNigeria: false,
    accountNumber: "0023432345",
    bankName: "Access",
    color: CustomColors.color5,
  ),
];
