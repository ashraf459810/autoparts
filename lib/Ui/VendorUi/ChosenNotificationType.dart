import 'package:autopart/Ui/VendorUi/VendorNotOffer.dart';

import 'package:autopart/core/style/base_color.dart';
import 'package:autopart/data/prefs_helper/prefs_helper.dart';
import 'package:autopart/model/VendorChosenNotification/VendorChosenNotification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:autopart/Ui/vendorblocs/ChosenNotificationType/chosennotifications_bloc.dart';

class ChosenNotificationType extends StatefulWidget {
  final String type;

  ChosenNotificationType({
    Key key,
    this.type,
  }) : super(key: key);

  @override
  _ChosenNotificationTypeState createState() => _ChosenNotificationTypeState();
}

class _ChosenNotificationTypeState extends State<ChosenNotificationType> {
  ChosennotificationsBloc chosennotificationsBloc = ChosennotificationsBloc();
  @override
  void initState() {
    chosennotificationsBloc
        .add(GetNotificationsEvent(widget.type, pages, ssize));
    super.initState();
  }

  int pages = 0;
  int ssize = 20;
  ScrollController controller = ScrollController();
  List<Notifications> list = [];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
        body: BlocBuilder(
            bloc: chosennotificationsBloc,
            builder: (context, state) {
              if (state is ChosennotificationsInitial) {
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
              if (state is ChosenNotificationState) {
                list = state.notifications;
              }

              return NotificationListener<ScrollNotification>(
                  onNotification: (notification) {
                    if (notification is ScrollEndNotification &&
                        controller.position.extentAfter == 0) {
                      print("here from listener");
                      pages++;
                      print(pages);

                   chosennotificationsBloc.add(
                          GetNotificationsEvent(widget.type, pages, ssize));
                    }

                    return false;
                  },
                  child: list.length != 0
                      ? Container(
                          height: size.height * 0.9,
                          width: size.width,
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                              itemCount: list.length,
                              controller: controller,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () async {
                                    PrefsHelper prefsHelper = PrefsHelper();
                                    int id = await prefsHelper.getvendorid();
                                    await Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) => VendorNotOffer(
                                        offerid: list[index].id,
                                        vendorid: id,
                                        chosennotificationsBloc:
                                            chosennotificationsBloc,
                                        type: widget.type,
                                      ),
                                    ));
                                  },
                                  child: Container(
                                    color: Colors.white,
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(width: size.width * 0.02),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10.0),
                                              child: Icon(
                                                Icons.email,
                                                size: 40,
                                                color: lightOrange,
                                              ),
                                            ),
                                            SizedBox(width: size.width * 0.1),
                                            Text(
                                              "pending offers              ",
                                              style: TextStyle(
                                                  color: Colors.black87,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(width: size.width * 0.2),
                                            Container(
                                              height: size.height * 0.04,
                                              width: size.width * 0.2,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(20)),
                                      ),
                                              child: Center(
                                                  child: Text(
                                                "${list[index].creationDate.day}/${list[index].creationDate.month}/${list[index].creationDate.year}\n     ${list[index].creationDate.hour}:${list[index].creationDate.minute}\n${list[index].creationDate.hour}:${list[index].creationDate.minute}",
                                                style: TextStyle(
                                                    color: Colors.grey),
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
            }));
  }
}
