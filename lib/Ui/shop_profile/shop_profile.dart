import 'package:autopart/Ui/auto_part_shop_tab/auto_part_shop_tab.dart';

import 'package:autopart/core/style/base_color.dart';
import 'package:flutter/material.dart';


class ShopProfilePage extends StatefulWidget {
  @override
  _ShopProfilePageState createState() => _ShopProfilePageState();
}

class _ShopProfilePageState extends State<ShopProfilePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 1, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: bgColor,
      body: Column(
        children: [
          Container(
            child: Stack(
              children: [
                Image.asset(
                  "assets/images/review_cover.png",
                  width: size.width,
                  height: 200,
                  fit: BoxFit.fill,
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'AutoParts',
                        style: TextStyle(fontSize: 22, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Feel The Luxury of Exceptional Service',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white.withAlpha(150)),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: 20,
                  top: 50,
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                ),
                Positioned(
                  right: 20,
                  top: 50,
                  child: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
          Container(
            child: TabBar(
              unselectedLabelColor: Colors.blueGrey,
              labelColor: heavyBlue,
              indicatorColor: lightOrange,
              tabs: [
                Tab(
                  text: 'Auto Part Shop',
                ),
                // Tab(
                //   text: 'Reviews',
                // )
              ],
              controller: _tabController,
              indicatorSize: TabBarIndicatorSize.tab,
            ),
          ),
          Expanded(
            child: TabBarView(
              children: [
                AutoPartShopPage(),
                // ReviewsPage()
              ],
              controller: _tabController,
            ),
          ),
        ],
      ),
    );
  }
}
