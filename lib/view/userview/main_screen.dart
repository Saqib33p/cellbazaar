import 'package:cellbazar/utils/appconstants.dart';
import 'package:cellbazar/view/userview/favourite_screen.dart';
import 'package:cellbazar/view/userview/home_screen.dart';
import 'package:cellbazar/view/userview/orders_screen.dart';
import 'package:cellbazar/view/userview/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _controller = PersistentTabController(initialIndex: 0);

  List<Widget> screens() {
    return [HomeScreen(), FavouriteScreen(), OrdersScreen(), ProfileScreen()];
  }

  List<PersistentBottomNavBarItem> navbaritem() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home),
        title: 'Home',
        activeColorPrimary: AppConstants.textColorWhite,
        inactiveColorPrimary: AppConstants.bottombarIconColor,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.favorite),
        title: 'Favourite',
        activeColorPrimary: AppConstants.textColorWhite,
        inactiveColorPrimary: AppConstants.bottombarIconColor,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.card_giftcard),
        title: 'Orders',
        activeColorPrimary: AppConstants.textColorWhite,
        inactiveColorPrimary: AppConstants.bottombarIconColor,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.person),
        title: 'Profile',
        activeColorPrimary: AppConstants.textColorWhite,
        inactiveColorPrimary: AppConstants.bottombarIconColor,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      backgroundColor: AppConstants.appMainColor,
      context,
      screens: screens(),
      items: navbaritem(),
      controller: _controller,
      navBarStyle: NavBarStyle.style11,
    );
  }
}
