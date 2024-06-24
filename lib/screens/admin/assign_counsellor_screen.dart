import 'package:cozy_cove/data/repositories/user_repo.dart';
import 'package:cozy_cove/locator.dart';
import 'package:cozy_cove/models/user_data.dart';
import 'package:cozy_cove/utils/spacers.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UsersWithoutCounsellorScreen extends StatefulHookConsumerWidget {
  const UsersWithoutCounsellorScreen({super.key});

  @override
  ConsumerState<UsersWithoutCounsellorScreen> createState() =>
      _UsersWithoutCounsellorScreenState();
}

class _UsersWithoutCounsellorScreenState
    extends ConsumerState<UsersWithoutCounsellorScreen> {
  late Future<List<UserDataModel>?> _futureUsers;
  late Future<List<UserDataModel>?> _futureCounsellors;

  @override
  void initState() {
    super.initState();

    _futureUsers = locator<UserRepository>().fetchAllUsersWithoutCounsellor();
    _futureCounsellors = locator<UserRepository>().fetchAllCounsellors();
  }

  void _showCounsellorBottomSheet(
    BuildContext context,
    List<UserDataModel> counsellors,
    UserDataModel user,
  ) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return ListView.builder(
            itemCount: counsellors.length,
            itemBuilder: (context, index) {
              final counsellor = counsellors[index];
              return Card(
                child: ListTile(
                  // leading: CircleAvatar(
                  //   backgroundImage: NetworkImage(user.avatarUrl),
                  // ),
                  // title: Text(user.pseudonym),
                  subtitle: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(counsellor.avatarUrl),
                        radius: 25,
                      ),
                      horizontalSpacer(20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(counsellor.pseudonym),
                          Text('Email: ${counsellor.email}'),
                          Text('Ratings: ${counsellor.healthGoal ?? '4.7'}'),
                          // Text('Ratings: ${user.ratings.toString()}'),
                          verticalSpacer(15),
                          ElevatedButton(
                            onPressed: () async {
                              locator<UserRepository>()
                                  .assignCounsellor(user.id, counsellor);
                              // final counsellors = await _futureCounsellors;
                              // if (counsellors != null &&
                              //     counsellors.isNotEmpty) {
                              //   _showCounsellorBottomSheet(
                              //       context, counsellors);
                              // }
                            },
                            child: const Text('Assign'),
                          ),
                        ],
                      ),
                    ],
                  ),
                  // trailing: ElevatedButton(
                  //   onPressed: () async {
                  //     final counsellors = await _futureCounsellors;
                  //     if (counsellors != null && counsellors.isNotEmpty) {
                  //       _showCounsellorBottomSheet(context, counsellors);
                  //     }
                  //   },
                  //   child: const Text('Assign Counsellor'),
                  // ),
                ),
              );
            },
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users Without Counsellor'),
      ),
      body: FutureBuilder<List<UserDataModel>?>(
        future: _futureUsers,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No users found'));
          } else {
            final users = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final user = users[index];
                  return Card(
                    child: ListTile(
                      // leading: CircleAvatar(
                      //   backgroundImage: NetworkImage(user.avatarUrl),
                      // ),
                      // title: Text(user.pseudonym),
                      subtitle: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(user.avatarUrl),
                            radius: 25,
                          ),
                          horizontalSpacer(20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(user.pseudonym),
                              Text('Email: ${user.email}'),
                              Text('Health Goal: ${user.healthGoal ?? 'N/A'}'),
                              // Text('Ratings: ${user.ratings.toString()}'),
                              verticalSpacer(15),
                              ElevatedButton(
                                onPressed: () async {
                                  final counsellors = await _futureCounsellors;
                                  if (counsellors != null &&
                                      counsellors.isNotEmpty) {
                                    _showCounsellorBottomSheet(
                                        context, counsellors, user);
                                  }
                                },
                                child: const Text('Assign Counsellor'),
                              ),
                            ],
                          ),
                        ],
                      ),
                      // trailing: ElevatedButton(
                      //   onPressed: () async {
                      //     final counsellors = await _futureCounsellors;
                      //     if (counsellors != null && counsellors.isNotEmpty) {
                      //       _showCounsellorBottomSheet(context, counsellors);
                      //     }
                      //   },
                      //   child: const Text('Assign Counsellor'),
                      // ),
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
