import 'package:autopart/Ui/wallet/bloc/wallet_bloc.dart';
import 'package:autopart/core/style/base_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Wallet extends StatefulWidget {
  Wallet({Key key}) : super(key: key);

  @override
  _WalletState createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  String points;
  WalletBloc walletBloc = WalletBloc();
  @override
  void initState() {
    walletBloc.add(GetPointsEvnt());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: AppBar(
            backgroundColor: Colors.white,
            title: Padding(
              padding: const EdgeInsets.only(top: 20, right: 100),
              child: Container(
                child: Text(
                  "My Wallet",
                  style: TextStyle(
                      color: heavyBlue,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            elevation: 0,
          )),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.03,
            ),
            Row(
              children: [
                SizedBox(
                  width: size.width * 0.04,
                ),
                SvgPicture.asset("assets/images/coins.svg",
                    height: size.height * 0.12, width: size.width * 0.02),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Container(
                    height: size.height * 0.06,
                    child: Text(
                      "My Points",
                      style: TextStyle(color: heavyBlue, fontSize: 29),
                    ))
              ],
            ),
            SizedBox(
              height: size.height * 0.04,
            ),
            Container(
              width: size.width * 0.9,
              height: size.height * 0.22,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.01,
                  ),

                  // Row(children: [
                  //   SizedBox(width: size.width * 0.06),
                  //      SvgPicture.asset("assets/images/clock.svg",height: size.height *0.03,width: size.width *0.2),
                  //      SizedBox(width: size.width * 0.15),
                  //      Column(children: [
                  //        Text("Last points you get",style: TextStyle(color: heavyBlue,fontSize: 13),),
                  //        Text("12 Dec, 2020",style: TextStyle(color: Colors.grey,fontSize: 12),)
                  //      ],),
                  //      SizedBox(width: size.width * 0.15),
                  //      Text("2500 pt",style: TextStyle(color: Colors.blue,fontSize: 15),),

                  // ],),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  // Divider(
                  //   height: 1,
                  //   color: Colors.grey,
                  // ),

                  SizedBox(
                    height: size.height * 0.02,
                  ),

                  // Row(children: [
                  //   SizedBox(width: size.width * 0.045),
                  //      SvgPicture.asset("assets/images/Group 394.svg",height: size.height *0.03,width: size.width *0.2),
                  //      SizedBox(width: size.width * 0.15),
                  //      Column(children: [
                  //        Text("Last points you get",style: TextStyle(color: heavyBlue,fontSize: 13),),
                  //        Text("12 Dec, 2020",style: TextStyle(color: Colors.grey,fontSize: 12),)
                  //      ],),
                  //      SizedBox(width: size.width * 0.15),
                  //      Text("2500 pt",style: TextStyle(color: Colors.red,fontSize: 15),),

                  // ],),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  //  Divider(
                  //       height: 1,
                  //       color: Colors.grey,),

                  //       SizedBox(height: size.height *0.02,),

                  Row(
                    children: [
                      SizedBox(width: size.width * 0.06),
                      SvgPicture.asset("assets/images/Group 395.svg",
                          height: size.height * 0.04, width: size.width * 0.2),
                      SizedBox(width: size.width * 0.15),
                      Column(
                        children: [
                          Text(
                            "Total points",
                            style: TextStyle(color: heavyBlue, fontSize: 13),
                          ),
                          // Text(
                          //   "12 Dec, 2020",
                          //   style: TextStyle(color: Colors.grey, fontSize: 12),
                          // )
                        ],
                      ),
                      SizedBox(width: size.width * 0.15),
                      BlocBuilder(
                        bloc: walletBloc,
                        builder: (context, state) {
                          if (state is Loading) {
                            return CircularProgressIndicator();
                          }
                          if (state is Error) {
                            return  Center(child: Text(state.error));
                          }
                          if (state is GetPointsState) {
                            points = state.points;
                          }
                          return points != null
                              ? Text(
                                  points,
                                  
                                  style: TextStyle(
                                      color: Colors.orange, fontSize: 15),
                                )
                              : Text("0");
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
