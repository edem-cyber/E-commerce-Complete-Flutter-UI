import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:saharago_b2b/screens/cart/cart_screen.dart';
import 'package:saharago_b2b/screens/home/home_screen.dart';
import 'package:saharago_b2b/screens/profile/profile_screen.dart';
import 'package:saharago_b2b/size_config.dart';

class Base extends StatefulWidget {
  static String routeName = "/base";
  Base({Key? key}) : super(key: key);

  @override
  State<Base> createState() => _BaseState();
}

class _BaseState extends State<Base> {
  var _currentIndex = 0;
  final List pages = [
    {
      'title': 'Home',
      'icon': 'assets/icons/home.svg',
      'activeIcon': 'assets/icons/home_active.svg',
      'page': HomeScreen(),
    },
    {
      'title': 'Cart',
      'icon': 'assets/icons/cart.svg',
      'activeIcon': 'assets/icons/cart_active.svg',
      'page': CartScreen(),
    },
    {
      'title': 'Chat',
      'icon': 'assets/icons/chat.svg',
      'activeIcon': 'assets/icons/chat_active.svg',
      'page': HomeScreen(),
    },
    {
      'title': 'Profile',
      'icon': 'assets/icons/profile.svg',
      'activeIcon': 'assets/icons/profile_active.svg',
      'page': ProfileScreen(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(child: pages[_currentIndex]['page']),
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          backgroundColor: Colors.white,
          onTap: (index) => setState(() {
            _currentIndex = index;
          }),
          type: BottomNavigationBarType.fixed,
          items: pages
              .map(
                (page) => BottomNavigationBarItem(
                  // activeIcon: SvgPicture.asset(
                  //   page['activeIcon'],
                  //   height: getProportionateScreenHeight(30),
                  // ),
                  icon: SvgPicture.asset(
                    page['icon'],
                    height: getProportionateScreenHeight(30),
                  ),
                  label: page['title'],
                ),
              )
              .toList(),
          currentIndex: _currentIndex,
        ));
  }
}
