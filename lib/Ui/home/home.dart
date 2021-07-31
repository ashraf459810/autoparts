import 'package:autopart/Ui//vendorUi/profile_screen.dart';
import 'package:autopart/Ui/search_screen/search_screen.dart';

import 'package:autopart/core/style/base_color.dart';
import 'package:autopart/Ui/cart/cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:autopart/Ui/home_page/home_page.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

// var scaffoldKey = GlobalKey<ScaffoldState>();

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  int i = 0;

  var pages = [
    HomePage(),
    SearchScreen(),
    Cart(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: scaffoldKey,
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/images/home.svg'),
            // ignore: deprecated_member_use
            title: Text(
              'Home',
              style: TextStyle(
                  color: _currentIndex == 0 ? lightOrange : Colors.grey),
            ),
            activeIcon: SvgPicture.asset(
              'assets/images/home.svg',
              color: lightOrange,
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/images/quotation.svg'),
            // ignore: deprecated_member_use
            title: Text(
              "Quotation",
              style: TextStyle(
                  color: _currentIndex == 1 ? lightOrange : Colors.grey),
            ),
            activeIcon: SvgPicture.asset(
              'assets/images/quotation.svg',
              color: lightOrange,
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/images/cart.svg'),
            // ignore: deprecated_member_use
            title: Text(
              'Cart',
              style: TextStyle(
                  color: _currentIndex == 2 ? lightOrange : Colors.grey),
            ),
            activeIcon: SvgPicture.asset(
              'assets/images/cart.svg',
              color: lightOrange,
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/images/my_profile.svg'),
            // ignore: deprecated_member_use
            title: Text(
              'Profile',
              style: TextStyle(
                  color: _currentIndex == 3 ? lightOrange : Colors.grey),
            ),
            activeIcon: SvgPicture.asset(
              'assets/images/my_profile.svg',
              color: lightOrange,
            ),
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(
          //     Icons.menu,
          //     color: heavyBlue,
          //   ),
          //   // ignore: deprecated_member_use
          //   title: Text(
          //     'More',
          //     style: TextStyle(
          //         color: _currentIndex == 4 ? lightOrange : Colors.grey),
          //   ),
          //   activeIcon: Icon(
          //     Icons.menu,
          //     color: lightOrange,
          //   ),
          // ),
        ],
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        // onTap: (index) {
        //   // if(i == 2){
        //   //   Navigator.push(context, MaterialPageRoute(builder: (context)=>AddProductPage()));
        //   // }
        //
        //   setState(() {
        //     i = index;
        //   });
        // },
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  // Future<bool> _onWillPop() async {
  //   if (_currentIndex == 0) {
  //     Navigator.pop(context);
  //     Navigator.of(context).pop(true);
  //     exit(0);
  // }
  // setState(() {
  //   _currentIndex = 0;
  // });
  // }
}
