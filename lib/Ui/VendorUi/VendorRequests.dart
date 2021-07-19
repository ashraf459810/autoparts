import 'package:autopart/Ui/VendorUi/AppBar/AppBar.dart';
import 'package:autopart/Ui/VendorUi/VendorOfferPrice.dart';
import 'package:autopart/core/style/base_color.dart';
import 'package:autopart/data/prefs_helper/prefs_helper.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:autopart/Ui/vendorblocs/vendor_requests/vendornotificatios_bloc.dart';

class VendorNotificatios extends StatefulWidget {
  @override
  _VendorNotificatios createState() => _VendorNotificatios();
}

class _VendorNotificatios extends State<VendorNotificatios> {
  PrefsHelper prefsHelper = PrefsHelper();
  ScrollController controller = ScrollController();
  int pages = 0;
  int ssize = 10;
  int vendorid;
  NotificationBar bar = NotificationBar();
  @override
  initState() {
    getvendorid();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return BlocProvider(
        create: (context) => VendornotificatiosBloc()
          ..add(Getrequestsevent(vendorid, pages, ssize)),
        child: Scaffold(
            appBar: PreferredSize(
                preferredSize: Size.fromHeight(100.0),
                child: bar.appbar(context,true)),
            backgroundColor: bgColor,
            body: BlocBuilder<VendornotificatiosBloc, VendornotificatiosState>(
                builder: (context, state) {
              if (state is GetReqestState) {
                if (state.getVendorRequests.isEmpty) {
                  return Center(
                      child: Text("No requests for now",
                          style: TextStyle(
                              color: orange,
                              fontSize: 17,
                              fontWeight: FontWeight.bold)));
                } else {
                  return NotificationListener<ScrollNotification>(
                      onNotification: (notification) {
                        if (notification is ScrollEndNotification &&
                            controller.position.extentAfter == 0) {
                          print("here from listener");
                          pages++;
                          print(pages);

                          context
                              .read<VendornotificatiosBloc>()
                              .add(Getrequestsevent(vendorid, pages, ssize));
                        }

                        return false;
                      },
                      child: ListView.builder(
                        controller: controller,
                        itemCount: state.getVendorRequests.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 8),
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => VendorOfferPrice(
                                        state.getVendorRequests[index])));
                              },
                              child: Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.all(0.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        SizedBox(
                                          width: 6,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(5.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: red,
                                                shape: BoxShape.circle),
                                            child: Padding(
                                                padding:
                                                    const EdgeInsets.all(12.0),
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      'NEW',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 10),
                                                    ),
                                                    Text(
                                                      'Request',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 10),
                                                    ),
                                                  ],
                                                )),
                                          ),
                                        ),
                                        Column(
                                          children: [
                                            Container(
                                              width: size.width * 0.4,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 0,
                                                    right: 8,
                                                    top: 3,
                                                    bottom: 1),
                                                child: Text(
                                                  ' ${state.getVendorRequests[index].product.name}   ',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: heavyBlue),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: size.width * 0.4,
                                              child: Padding(
                                                padding:
                                                    EdgeInsets.only(left: 0),
                                                child: Text(
                                                  '${state.getVendorRequests[index].brand.name}',
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      color: orange),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(bottom: 10,left: 30),
                                              child: Container(
                               
                                                width: size.width * 0.3,
                                                child: Text(
                                                  '${state.getVendorRequests[index].creationDate.year}/${state.getVendorRequests[index].creationDate.month}/${state.getVendorRequests[index].creationDate.day}',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: heavyBlue),
                                                ),
                                              ),
                                            ),
                                        
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ));
                }
              } else {
                return Scaffold(
                    body: Center(child: CircularProgressIndicator()));
              }
            })));
  }

  Future<void> getvendorid() async {
    vendorid = await prefsHelper.getvendorid();
  }
}
