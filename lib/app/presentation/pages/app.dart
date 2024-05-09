import 'dart:math';

import 'package:effective_flight/core/constants/colors.dart';
import 'package:effective_flight/features/presentation/pages/briefly_speaking_screen.dart';
import 'package:effective_flight/features/presentation/pages/hotel_screen.dart';
import 'package:effective_flight/features/presentation/pages/profile_screen.dart';
import 'package:effective_flight/features/presentation/pages/subscription_screen.dart';
import 'package:effective_flight/features/presentation/pages/ticket_search_screen.dart';
import 'package:flutter/cupertino.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final CupertinoTabController _tabController = CupertinoTabController();
  GlobalKey<NavigatorState>? navigatorKey = GlobalKey<NavigatorState>();
  late int selectedTab = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void onSelectTabBarItem(int item) {
    setState(() {
      selectedTab = item;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      controller: _tabController,
      tabBar: CupertinoTabBar(
        backgroundColor: AppColors.black,
        onTap: (index) => selectedTab,
        iconSize: 25,
        items: [
          BottomNavigationBarItem(
            icon: Transform.rotate(
              angle: -pi / 4,
              child: const Icon(CupertinoIcons.airplane),
            ),
            label: "Авиабилеты",
          ),
          const BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.bed_double_fill),
            label: "Отели",
          ),
          const BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.location_solid),
            label: "Короче",
          ),
          const BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.bell_fill),
            label: "Подписки",
          ),
          const BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person_fill),
            label: "Профиль",
          ),
        ],
      ),
      tabBuilder: (context, index) {
        return CupertinoTabView(
          builder: (context) {
            switch (index) {
              case 1:
                return const HotelScreen();
              case 2:
                return const BrieflySpeakingScreen();
              case 3:
                return const SubscriptionScreen();
              case 4:
                return const ProfileScreen();
              default:
                return const TicketSearchScreen();
            }
          },
        );
      },
    );
  }
}
