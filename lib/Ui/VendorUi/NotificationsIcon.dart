import 'package:autopart/Ui/VendorUi/VendorNotOffer.dart';

import 'package:autopart/Ui/customer_notification_offer/CustomerOfferDetails.dart';
import 'package:autopart/Ui/vendorblocs/VendorNotification/vendornotifications_bloc.dart';
import 'package:autopart/core/style/base_color.dart';

import 'package:autopart/data/prefs_helper/prefs_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:autopart/model/VendorNotificationsModel.dart';
import 'package:autopart/Ui/VendorUi/ChosenNotificationType.dart';

class VendorNotificationsType extends StatefulWidget {
  VendorNotificationsType({Key key, this.isvendor}) : super(key: key);
  final bool isvendor;

  @override
  _VendorNotificationsTypeState createState() =>
      _VendorNotificationsTypeState();
}

class _VendorNotificationsTypeState extends State<VendorNotificationsType> {
  int pages = 0;
  int ssize = 15;
  List<VendorNot> list = [];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    ScrollController controller = ScrollController();
    //
    return widget.isvendor
        ? SafeArea(top: true,
                  child: Scaffold(
              appBar: PreferredSize(
                  preferredSize: Size.fromHeight(size.height * 0.4),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30, top: 60, bottom: 20),
                    child: Row(
                      children: [
                        Container(
                          child: Text("Notifications",
                              style: TextStyle(
                                  color: heavyBlue,
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  )),
              backgroundColor: bgColor,
              body: Column(children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ChosenNotificationType(
                        type: "SEND_PENDING",
                      ),
                    ));
                  },
                  child: Row(
                    children: [
                      SizedBox(width: size.width * 0.02),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: SvgPicture.asset('assets/images/Group 323.svg'),
                      ),
                      SizedBox(width: size.width * 0.02),
                      Text(
                        "Pending Requests",
                        style: TextStyle(color: blue, fontSize: 18),
                      ),
                      SizedBox(width: size.width * 0.186),
                      // Container(
                      //   height: size.height * 0.03,
                      //   width: size.width * 0.15,
                      //   decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.all(Radius.circular(20)),
                      //       color: darkBlue),
                      //   child: Center(
                      //       child: Text(
                      //     'Details',
                      //     style: TextStyle(color: Colors.white),
                      //   )),
                      // )
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ChosenNotificationType(
                        type: "REPLY_PENDING",
                      ),
                    ));
                  },
                  child: Row(
                    children: [
                      SizedBox(width: size.width * 0.02),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: SvgPicture.asset('assets/images/Group 323.svg'),
                      ),
                      SizedBox(width: size.width * 0.02),
                      Text(
                        "Pending offers",
                        style: TextStyle(color: blue, fontSize: 18),
                      ),
                      SizedBox(width: size.width * 0.25),
                      // Container(
                      //   height: size.height * 0.03,
                      //   width: size.width * 0.15,
                      //   decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.all(Radius.circular(20)),
                      //       color: darkBlue),
                      //   child: Center(
                      //       child: Text(
                      //     'Details',
                      //     style: TextStyle(color: Colors.white),
                      //   )),
                      // )
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ChosenNotificationType(
                        type: "NOT_AVAILABLE",
                      ),
                    ));
                  },
                  child: Row(
                    children: [
                      SizedBox(width: size.width * 0.02),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Stack(
                          children: [
                            SvgPicture.asset('assets/images/icon.svg'),
                          ],
                        ),
                      ),
                      SizedBox(width: size.width * 0.02),
                      Text(
                        "Not Available   ",
                        style: TextStyle(color: yalowColor, fontSize: 18),
                      ),
                      SizedBox(width: size.width * 0.25),
                      // Container(
                      //   height: size.height * 0.03,
                      //   width: size.width * 0.15,
                      //   decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.all(Radius.circular(20)),
                      //       color: yalowColor),
                      //   child: Center(
                      //       child: Text(
                      //     'Details',
                      //     style: TextStyle(color: Colors.white),
                      //   )),
                      // )
                    ],
                  ),
                ),
                // InkWell(
                //   onTap: () {
                //     Navigator.of(context).push(MaterialPageRoute(
                //       builder: (context) => ChosenNotificationType(
                //         type: "REJECTED",
                //       ),
                //     ));
                //   },
                //   child: Row(
                //     children: [
                //       SizedBox(width: size.width * 0.02),
                //       Padding(
                //         padding: const EdgeInsets.only(top: 10.0),
                //         child: Stack(
                //           children: [
                //             SvgPicture.asset('assets/images/icon1.svg'),
                //           ],
                //         ),
                //       ),
                //       SizedBox(width: size.width * 0.02),
                //       Text(
                //         "Rejected           ",
                //         style: TextStyle(color: red, fontSize: 18),
                //       ),
                //       SizedBox(width: size.width * 0.25),
                //       // Container(
                //       //   height: size.height * 0.03,
                //       //   width: size.width * 0.15,
                //       //   decoration: BoxDecoration(
                //       //       borderRadius: BorderRadius.all(Radius.circular(20)),
                //       //       color: red),
                //       //   child: Center(
                //       //       child: Text(
                //       //     'Detai',
                //       //     style: TextStyle(color: Colors.white),
                //       //   )),
                //       // )
                //     ],
                //   ),
                // ),

                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ChosenNotificationType(
                        type: "ACCEPTED",
                      ),
                    ));
                  },
                  child: Row(
                    children: [
                      SizedBox(width: size.width * 0.02),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Stack(
                          children: [
                            SvgPicture.asset('assets/images/icon2.svg'),
                          ],
                        ),
                      ),
                      SizedBox(width: size.width * 0.03),
                      Text(
                        "Accepted             ",
                        style: TextStyle(color: cayan, fontSize: 18),
                      ),
                      SizedBox(width: size.width * 0.2),
                      // Container(
                      //   height: size.height * 0.03,
                      //   width: size.width * 0.15,
                      //   decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.all(Radius.circular(20)),
                      //       color: cayan),
                      //   child: Center(
                      //       child: Text(
                      //     'Details',
                      //     style: TextStyle(color: Colors.grey[300]),
                      //   )),
                      // )
                    ],
                  ),
                ),
              ])),
        )
        : SafeArea(top: true,
                  child: Scaffold(
              body: BlocProvider(
                  create: (context) => VendornotificationsBloc()
                    ..add(GetCustomerNotificationEvent(pages, ssize)),
                  child: BlocBuilder<VendornotificationsBloc,
                      VendornotificationsState>(builder: (context, state) {
                    if (state is VendornotificationsInitial) {
                      return Container(
                          color: Colors.white,
                          child: Center(child: CircularProgressIndicator()));
                    }
                    if (state is Loading) {
                      return Container(
                          color: Colors.white,
                          child: Center(child: CircularProgressIndicator()));
                    }
                    if (state is Error) {
                      return Center(child: Text(state.error));
                    }
                    if (state is GetVendorNotificationsState) {
                      list = state.listl;
                    }
                    if (state is GetCustomerNotificationsState) {
                      list = state.listl;
                    }

                    return NotificationListener<ScrollNotification>(
                        onNotification: (notification) {
                          if (notification is ScrollEndNotification &&
                              controller.position.extentAfter == 0) {
                            print("here from listener");
                            pages++;
                            print(pages);
                            if (widget.isvendor) {
                              print("here from vendor");
                              context
                                  .read<VendornotificationsBloc>()
                                  .add(GetVendorNotificationEvent(pages, ssize));
                            } else {
                              pages++;
                              print("here from customer");
                              context.read<VendornotificationsBloc>().add(
                                  GetCustomerNotificationEvent(pages, ssize));
                            }
                          }

                          return false;
                        },
                        child: list.length != 0
                            ? Container(
                                height: size.height  ,
                                width: size.width,
                                child: ListView.builder(
                                  physics:const AlwaysScrollableScrollPhysics(),
                                    itemCount: list.length,
                                    scrollDirection: Axis.vertical,
                                    controller: controller,
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: () async {
                                          if (widget.isvendor == true) {
                                            PrefsHelper prefsHelper =
                                                PrefsHelper();
                                            int id =
                                                await prefsHelper.getvendorid();
                                            print("here the vendor id $id");
                                            print(
                                                "here the request id ${list[index].id}");
                                            Navigator.of(context).pushReplacement(
                                                MaterialPageRoute(
                                              builder: (context) =>
                                                  VendorNotOffer(
                                                offerid: list[index].targetId,
                                                vendorid: id,
                                              ),
                                            ));
                                          }
                                          if (widget.isvendor == false) {
                                            print(widget.isvendor);

                                            print(list[index].targetId);

                                            Navigator.of(context)
                                                .push(MaterialPageRoute(
                                              builder: (context) =>
                                                  CustomerOfferDetails(
                                                      list[index].targetId),
                                            ));
                                          }
                                        },
                                        child: Container(
                                          color: Colors.white,
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  SizedBox(
                                                      width: size.width * 0.02),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 10.0),
                                                    child: Icon(
                                                      Icons.email,
                                                      size: 40,
                                                      color: lightOrange,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                      width: size.width * 0.02),
                                                  Text(
                                                    list[index]
                                                        .notificationType
                                                        .substring(7, 23),
                                                    style: TextStyle(
                                                        color: orange,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  SizedBox(
                                                      width: size.width * 0.2),
                                                  Container(
                                                    height: size.height * 0.04,
                                                    width: size.width * 0.2,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  20)),
                                                    ),
                                                    child: Center(
                                                        child: Text(
                                                      "${list[index].creationDate.day}/${list[index].creationDate.month}/${list[index].creationDate.year}\n    ${list[index].creationDate.hour}:${list[index].creationDate.minute}",
                                                      style: TextStyle(
                                                          color: lightOrange),
                                                    )),
                                                  )
                                                ],
                                              ),
                                              Divider()
                                            ],
                                          ),
                                        ),
                                      );
                                    }),
                              )
                            : Center(
                                child: Container(
                                child: Text(
                                  "No Notifiacations for you now",
                                  style: TextStyle(color: orange, fontSize: 18),
                                ),
                              )));
                  }))),
        );
  }
}
