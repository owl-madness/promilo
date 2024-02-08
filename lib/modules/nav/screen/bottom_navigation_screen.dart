import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:promilo_app/modules/account/screen/account_screen.dart';
import 'package:promilo_app/modules/explore/screen/explore_screen.dart';
import 'package:promilo_app/modules/home/screen/home_screen.dart';
import 'package:promilo_app/modules/meetup/screen/meetup_screen.dart';
import 'package:promilo_app/modules/prolet/screen/prolet_screen.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({super.key});

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  int activeIndex = 2;
  final _tabController = PersistentTabController(initialIndex: 2);

  @override
  void initState() {
    super.initState();
  }

  List<Widget> get buildScreens => [
        HomeScreen(),
        ProletScreen(),
        MeetupScreen(),
        ExploreScreen(),
        AccountScreen(),
      ];

  List<PersistentBottomNavBarItem> get navBarItems => [
        PersistentBottomNavBarItem(
          icon: ImageIcon(AssetImage('assets/icons/home.png')),
          title: ("Home"),
          activeColorPrimary: CupertinoColors.activeBlue,
          inactiveColorPrimary: CupertinoColors.black,
        ),
        PersistentBottomNavBarItem(
          icon: ImageIcon(AssetImage('assets/icons/menu.png')),
          title: ("Prolet"),
          activeColorPrimary: CupertinoColors.activeBlue,
          inactiveColorPrimary: CupertinoColors.black,
        ),
        PersistentBottomNavBarItem(
          icon: ImageIcon(AssetImage('assets/icons/handshake.png')),
          title: ("Meetup"),
          activeColorPrimary: CupertinoColors.activeBlue,
          inactiveColorPrimary: CupertinoColors.black,
        ),
        PersistentBottomNavBarItem(
          icon: ImageIcon(AssetImage('assets/icons/folder.png')),
          title: ("Explore"),
          activeColorPrimary: CupertinoColors.activeBlue,
          inactiveColorPrimary: CupertinoColors.black,
        ),
        PersistentBottomNavBarItem(
          icon: ImageIcon(
            AssetImage('assets/icons/user.png'),
          ),
          title: ("Account"),
          activeColorPrimary: CupertinoColors.activeBlue,
          inactiveColorPrimary: CupertinoColors.black,
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      screens: buildScreens,
      items: navBarItems,
      controller: _tabController,
      navBarStyle: NavBarStyle.simple,
    );
  }
}
