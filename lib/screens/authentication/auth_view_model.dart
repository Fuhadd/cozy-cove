import 'dart:async';
import 'dart:convert';
import 'dart:math' as maths;

import 'package:cozy_cove/models/user_data.dart';
import 'package:cozy_cove/screens/authentication/sign_in/sign_up_success_screen.dart';
import 'package:cozy_cove/screens/dashboard/bottom_navigation_screen.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../constants/custom_string.dart';
import '../../data/view_model/base_change_notifier.dart';
import '../dashboard/dashboard_screen.dart';

final authProvider = ChangeNotifierProvider.autoDispose<AuthViewModel>((ref) {
  return AuthViewModel.initWhoAmI();
});

class AuthViewModel extends BaseChangeNotifier {
  bool _isloading;

  String authorized = 'Not Authorized';

  AuthViewModel.initWhoAmI()
      : _isloading = false,
        _userId = "",
        _userName = "",
        _password = "",
        _email = "";
  AuthViewModel.profile()
      : _userId = "",
        _userName = "",
        _email = "",
        _password = "",
        _isloading = false;

  bool get isLoading => _isloading;
  String _email, _userId, _userName, _password = "";

  String get email => _email;
  String get password => _password;
  String get userId => _userId;

  String get userName => _userName;

  set isLoading(bool isloading) {
    _isloading = isloading;
    notifyListeners();
  }

  FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  Future<void> signUp({
    required String pseudonym,
    required String password,
    int? currentHealth,
    String? healthDetails,
    int? healthGoal,
    String? primaryHealthGoal,
    String? secondaryHealthGoal,
    String? hobbyDetails,
    String? hobby,
    required BuildContext? context,
    List<String>? selectedInterests,
  }) async {
    try {
      isLoading = true;
      String email = '$pseudonym@ecozycove.com'; // Generate pseudo email

      isLoading = true;
      final user = await userRepository.createUserWithEmail(
        email,
        password,
      );

      if (user != null) {
        _email = email;
        maths.Random random = maths.Random();
        int randomNumber = random.nextInt(11);
        String avatarUrl = ConstantString.avatarLinks[randomNumber];

        var userId = await userRepository.saveUserCredentials(
          email: email,
          pseudonym: pseudonym,
          pass: password,
          avatarUrl: avatarUrl,
          accountCreated: DateTime.now(),
          currentHealth: currentHealth,
          healthGoal: healthGoal,
          healthDetails: healthDetails,
          primaryHealthGoal: primaryHealthGoal,
          secondaryHealthGoal: secondaryHealthGoal,
          hobby: hobby,
          hobbyDetails: hobbyDetails,
          selectedInterests: selectedInterests,
        );

        if (userId != null) {
          UserDataModel user = UserDataModel(
            id: userId,
            email: email,
            pseudonym: pseudonym,
            pass: password,
            avatarUrl: avatarUrl,
            // accountCreated: DateTime.now(),
            currentHealth: currentHealth,
            healthGoal: healthGoal,
            healthDetails: healthDetails,
            primaryHealthGoal: primaryHealthGoal,
            secondaryHealthGoal: secondaryHealthGoal,
            hobby: hobby,
            hobbyDetails: hobbyDetails,
            selectedInterests: selectedInterests,
          );
          final userJson = json.encode(user.toJson());
          localCache.saveToLocalCache(
              key: ConstantString.userJson, value: userJson);
        }

        navigationHandler.push(SignUpSuccessScreen(
          pseudonym: pseudonym,
        ));

        isLoading = false;

        // navigationHandler.pushNamed(
        //   DashboardScreen.routeName,
        // );
      } else {
        isLoading = false;
        ScaffoldMessenger.of(context!)
          ..removeCurrentSnackBar()
          ..showSnackBar(const SnackBar(
            content: Text("Request Failed, Please try again later"),
            backgroundColor: Colors.red,
          ));
        // GenericDialog().showSimplePopup(
        //   type: InfoBoxType.warning,
        //   title: ConstantString.apiErrorResponseTitle,
        //   content: res.message,
        // );
      }
    } catch (e, stacktrace) {
      isLoading = false;
      ScaffoldMessenger.of(context!)
        ..removeCurrentSnackBar()
        ..showSnackBar(SnackBar(
          content: Text(e.toString()),
          backgroundColor: Colors.red,
        ));
      debugPrint(e.toString());

      log(e.toString());
      log(stacktrace.toString());
    }
  }

  Future<void> signIn(pseudonym, password, {BuildContext? context}) async {
    try {
      isLoading = true;
      String email = '$pseudonym@ecozycove.com'; // Generate pseudo email
      final user = await userRepository.loginWithEmail(
        email,
        password,
      );

      if (user != null) {
        _email = email;
        var user = await userRepository.getUsersCredentials();

        if (user != null) {
          final userJson = json.encode(user.toJson());
          localCache.saveToLocalCache(
              key: ConstantString.userJson, value: userJson);
        }

        isLoading = false;
        navigationHandler.pushNamed(BottomNavigationScreen.routeName);

        // navigationHandler.pushNamed(
        //   DashboardScreen.routeName,
        // );
      } else {
        isLoading = false;
      }
    } catch (e, stacktrace) {
      isLoading = false;
      ScaffoldMessenger.of(context!)
        ..removeCurrentSnackBar()
        ..showSnackBar(SnackBar(
          content: Text(e.toString()),
          backgroundColor: Colors.red,
        ));
      debugPrint(e.toString());

      log(e.toString());
      log(stacktrace.toString());
    }
  }

  Future<bool> checkIfPseudonymExists(String pseudonym,
      {BuildContext? context}) async {
    try {
      isLoading = true;
      return await userRepository.checkIfPseudonymExists(pseudonym);
    } catch (e, stacktrace) {
      isLoading = false;
      ScaffoldMessenger.of(context!)
        ..removeCurrentSnackBar()
        ..showSnackBar(SnackBar(
          content: Text(e.toString()),
          backgroundColor: Colors.red,
        ));
      debugPrint(e.toString());

      log(e.toString());
      log(stacktrace.toString());
      return false;
    }
  }
}
