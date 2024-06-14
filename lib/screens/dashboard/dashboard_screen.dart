import 'package:cozy_cove/constants/custom_colors.dart';
import 'package:cozy_cove/screens/app_view_model.dart';
import 'package:cozy_cove/screens/dashboard/counsellors_screen.dart';
import 'package:cozy_cove/utils/spacers.dart';
import 'package:cozy_cove/widgets/chat_list_widget.dart';
import 'package:cozy_cove/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends StatefulHookConsumerWidget {
  const HomeScreen({
    super.key,
  });

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int selectedIndex = 0;
  bool showAmount = true;

  @override
  void initState() {
    _tabController = TabController(
      length: 2,
      vsync: this,
    );

    super.initState();
  }

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
              title: "Chats",
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: CustomColors.blackColor.withOpacity(0.04),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: TabBar(
                        indicatorSize: TabBarIndicatorSize.tab,
                        labelColor: CustomColors.blackColor,
                        unselectedLabelColor:
                            CustomColors.blackTextColor.withOpacity(0.6),
                        labelStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: CustomColors.blackTextColor),
                        unselectedLabelStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: CustomColors.greyTextColor),
                        dividerColor: Colors.transparent,
                        indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: CustomColors.greyColor.withOpacity(0.3),
                              blurRadius: 10,
                              spreadRadius: 3,
                            ),
                          ],
                          color: CustomColors.whiteColor,
                        ),
                        controller: _tabController,
                        tabs: const [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 25.0),
                            child: Tab(
                              text: 'Personal',
                            ),
                          ),
                          Padding(
                            //   padding: EdgeInsets.symmetric(
                            //     horizontal: 25.0, vertical: 2),
                            // child: Text("Personal"),
                            padding: EdgeInsets.symmetric(horizontal: 25.0),
                            child: Tab(
                              text: 'Counsellors',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            verticalSpacer(15),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _tabController,
                  children: [
                    const ChatListWidget(),
                    ref.watch(hasPaidProvider)
                        ? const ChatListWidget(
                            showCouncellor: true,
                          )
                        : const ChatListWidget(
                            showCouncellor: true,
                          )

                    //HERE
                    ///const CounsellorScreen(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
