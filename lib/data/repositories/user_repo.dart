// ignore_for_file: prefer_typing_uninitialized_variables, unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cozy_cove/locator.dart';
import 'package:cozy_cove/models/user_data.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../local_cache/local_cache.dart';

abstract class UserRepository {
  Future<User?> createUserWithEmail(String email, String password);
  Future<User?> loginWithEmail(String email, String password);

  Future<bool> checkIfEmailExists(String email);
  Future<bool> checkIfPseudonymExists(String pseudonym);
  Future isUserSignedIn();
  Future logOut();
  Future resetPassword(String email);
  Future<UserDataModel> fetchCurrentUser();
  Future<String?> saveUserCredentials({
    required String email,
    required String pseudonym,
    required String pass,
    required String avatarUrl,
    required DateTime accountCreated,
    int? currentHealth,
    int? healthGoal,
    String? healthDetails,
    String? primaryHealthGoal,
    String? secondaryHealthGoal,
    String? hobby,
    String? hobbyDetails,
    List<String>? selectedInterests,
  });
  Future<UserDataModel?> getUsersCredentials();
  // Stream<QuerySnapshot<Object?>>? getAllConfessions();
  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> getAllConfessions();

  // Future<bool?> sendConfession(
  //     {required String message,
  //     required String destinationName,
  //     required String destinationId,
  //     required String destinationImage});

  Stream<QuerySnapshot> getAllConfessionStream();
  Stream<QuerySnapshot> getAllReadConfessionStream();
  Stream<QuerySnapshot> getAllUnreadConfessionStream();
  Future<bool?> readConfession({
    required String confessionId,
  });
  //  Future<GenericResponse> getUsersForMatching(int pageNumber, int pageSize);
}

class UserRepositoryImpl implements UserRepository {
  late LocalCache cache;

  UserRepositoryImpl({
    required this.cache,
  }) : super();

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  // CollectionReference firebaseFirestore =
  //     FirebaseFirestore.instance.collection('UserData');

  CollectionReference firebaseFirestore =
      FirebaseFirestore.instance.collection('users');
  CollectionReference confessionsFirebaseFirestore =
      FirebaseFirestore.instance.collection('Confessions');

  @override
  Future<User?> createUserWithEmail(String email, String password) async {
    try {
      UserCredential result = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = result.user;
      if (user != null) {
        return user;
      } else {
        return null;
      }
    } on FirebaseAuthException catch (error) {
      var message = 'An Error Occuresd';
      switch (error.code) {
        case 'invalid-email:':
          message = 'pseudonym is Invalid!';
          break;
        case 'email-already-in-use:':
          message =
              'The pseudonym already exists.Please proceed to login Screen ';
          break;
        case 'wrong-password':
          message = 'Invalid password. Please enter correct password.';
          break;
      }
      throw Exception(message);
      print(message);
    }
  }

  @override
  Future<UserDataModel> fetchCurrentUser() async {
    throw UnimplementedError();
    //  try {
    //   String? userJson = await SharedPreferenceHelper().getcurrentUser();
    //   AppUser currentUser = AppUser.fromJson(json.decode(userJson!));
    //   return currentUser;
    // } on PlatformException catch (error) {
    //   throw Exception(error);
    // }
  }

  @override
  Future isUserSignedIn() async {
    User? user = firebaseAuth.currentUser;
    return user != null && user.uid.isNotEmpty;
  }

  @override
  Future logOut() async {
    try {
      await firebaseAuth.signOut();
    } catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<User?> loginWithEmail(String email, String password) async {
    try {
      UserCredential result = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      if (user != null) {
        return user;
      }
    } on FirebaseAuthException catch (error) {
      var message = 'An error has occured.'; // default message
      switch (error.code) {
        case 'user-disabled':
          message =
              'This user has been temporarily disabled, Contact Support for more information';
          break;
        case 'user-not-found':
          message =
              'The pseudonym is not assocciated with a user.Try another pseudonym up or Register with this pseudonym';
          break;
        case 'wrong-password':
          message = 'Invalid password. Please enter correct password.';
          break;
        case 'invalid-credential':
          message = 'Invalid credentials. Please enter correct credentials.';
          break;
      }
      throw Exception(message);
    }
    return null;
  }

  @override
  Future resetPassword(String email) async {
    try {
      await firebaseAuth.sendPasswordResetEmail(email: email);
    } on PlatformException catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<String?> saveUserCredentials({
    required String email,
    required String pseudonym,
    required String pass,
    required String avatarUrl,
    required DateTime accountCreated,
    int? currentHealth,
    int? healthGoal,
    String? healthDetails,
    String? primaryHealthGoal,
    String? secondaryHealthGoal,
    String? hobby,
    String? hobbyDetails,
    List<String>? selectedInterests,
  }) async {
    String? uid = firebaseAuth.currentUser?.uid.toString();

    await firebaseFirestore.doc(uid.toString()).set(
        {
          'id': uid.toString(),
          "pseudonym": pseudonym,
          "email": email,
          "pass": pass,
          'avatarUrl': avatarUrl,
          "currentHealth": currentHealth,
          "healthDetails": healthDetails,
          "healthGoal": healthGoal,
          "primaryHealthGoal": primaryHealthGoal,
          "secondaryHealthGoal": secondaryHealthGoal,
          "hobby": hobby,
          'hobbyDetails': hobbyDetails,
          'selectedInterests': selectedInterests,
        },
        SetOptions(
          merge: true,
        ));
    return uid;
  }

  @override
  Future<UserDataModel?> getUsersCredentials() async {
    try {
      String uid = firebaseAuth.currentUser!.uid;

      final appUser = firebaseFirestore.doc(uid);
      final snapshot = await appUser.get();

      if (snapshot.exists) {
        return UserDataModel.fromJson(snapshot.data());
      }
    } catch (error) {}
    return null;
  }

  @override
  Future<bool> checkIfEmailExists(String email) async {
    try {
      final list =
          await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);
      if (list.isNotEmpty) {
        // The email is already in use
        return true;
      } else {
        // The email is available
        return false;
      }
    } catch (e) {
      print('Error: $e');
      return false; // Assuming false for error cases
    }
  }

  @override
  Future<bool> checkIfPseudonymExists(String pseudonym) async {
    try {
      final querySnapshot = await firebaseFirestore
          .where('pseudonym', isEqualTo: pseudonym)
          .get();
      return querySnapshot.docs.isNotEmpty;
    } catch (e) {
      print('Error: $e');
      return false; // Assuming false for error cases
    }
  }

  @override
  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>>
      getAllConfessions() async {
    String uid = firebaseAuth.currentUser!.uid;

    final confessions = firebaseFirestore.doc(uid).collection("confessions");
    final snapshot = await confessions.get();
    return snapshot.docs;
  }

  @override
  Stream<QuerySnapshot> getAllConfessionStream() {
    // construct chat room from Id of user
    String uid = firebaseAuth.currentUser!.uid;
    final confessions =
        confessionsFirebaseFirestore.where('destinationId', isEqualTo: uid);
    // final confessions = firebaseFirestore.doc(uid).collection("confessions");
    return confessions.snapshots();

    // return chatFirebaseFirestore
    //     .doc(chatRoomId)
    //     .collection('messages')
    //     .orderBy('timestamp', descending: false)
    //     .snapshots();
  }

  // @override
  // Future<bool?> sendConfession(
  //     {required String message,
  //     required String destinationName,
  //     required String destinationId,
  //     required String destinationImage}) async {
  //   try {
  //     String? uid = firebaseAuth.currentUser?.uid.toString();
  //     final docUser = confessionsFirebaseFirestore.doc();
  //     final userData = locator<LocalCache>().getUserData();
  //     await docUser.set(
  //         {
  //           "id": docUser.id,
  //           "imageUrl": userData.firstName,
  //           "userName": userData.lastName,
  //           "title": "Send me a message",
  //           "content": message,
  //           "destinationName": destinationName,
  //           "destinationId": destinationId,
  //           "destinationImage": destinationImage,
  //           "read": 0,
  //           "createdAt": Timestamp.now(),
  //         },
  //         SetOptions(
  //           merge: true,
  //         ));
  //     if (uid != null) {
  //       Map<String, dynamic> pastConfessorMap = {
  //         "id": destinationId,
  //         "name": destinationName,
  //       };
  //       await firebaseFirestore.doc(uid.toString()).update(
  //         {
  //           'pastConfessors': FieldValue.arrayUnion([pastConfessorMap]),
  //         },
  //       );
  //     }

  //     return true;
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  @override
  Future<bool?> readConfession({
    required String confessionId,
  }) async {
    try {
      await confessionsFirebaseFirestore.doc(confessionId).update(
        {
          'read': 1,
        },
      );

      return true;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Stream<QuerySnapshot<Object?>> getAllReadConfessionStream() {
    String uid = firebaseAuth.currentUser!.uid;
    final confessions = confessionsFirebaseFirestore
        .where('destinationId', isEqualTo: uid)
        .where('read', isEqualTo: 1);
    return confessions.snapshots();
  }

  @override
  Stream<QuerySnapshot<Object?>> getAllUnreadConfessionStream() {
    String uid = firebaseAuth.currentUser!.uid;
    final confessions = confessionsFirebaseFirestore
        .where('destinationId', isEqualTo: uid)
        .where('read', isEqualTo: 0);
    return confessions.snapshots();
  }
}
