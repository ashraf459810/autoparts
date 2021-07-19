import 'package:autopart/Ui/VendorUI/vendorHomePage.dart';


import 'package:autopart/core/style/base_color.dart';
import 'package:flutter/material.dart';
import 'package:autopart/Ui/VendorUI/profile_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VendorNavBar extends StatefulWidget {
  VendorNavBar({Key key}) : super(key: key);

  @override
  _VendorNavBarState createState() => _VendorNavBarState();
}

class _VendorNavBarState extends State<VendorNavBar> {
  int _currentIndex = 0;
  PageController _pageController;
  var pages = [
    VendorHomePage(),
    
    ProfileScreen(),
  
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
 
    return Scaffold(
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
            icon: SvgPicture.asset('assets/images/my_profile.svg'),
            // ignore: deprecated_member_use
            title: Text(
              'Dashboard',
              style: TextStyle(
                  color: _currentIndex == 1 ? lightOrange : Colors.grey),
            ),
            activeIcon: SvgPicture.asset(
              'assets/images/my_profile.svg',
              color: lightOrange,
            ),
          ),
   
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
}
