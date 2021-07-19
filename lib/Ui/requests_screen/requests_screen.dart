import 'package:autopart/Ui/CheckCustomerOffers!/GetCustomerOffers.dart';
import 'package:autopart/Ui/requests_screen/bloc/customer_requests_bloc.dart';

import 'package:autopart/core/style/base_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RequestsScreen extends StatefulWidget {
  @override
  _RequestsScreenState createState() => _RequestsScreenState();
}

class _RequestsScreenState extends State<RequestsScreen> {
  ScrollController controller = ScrollController();
  int listsize = 10;
  int pages = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocProvider(
        create: (context) =>
            CustomerRequestsBloc()..add(LoadRequests(pages, listsize)),
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              centerTitle: false,
              titleSpacing: 0,
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(20.0),
                child: Column(
                  children: [
                    Divider(
                      endIndent: 16,
                      indent: 16,
                    ),
                  ],
                ),
              ),
              leading: Icon(
                Icons.arrow_back_ios,
                color: lightOrange,
              ),
              title: Text(
                'Your Requests',
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: heavyBlue),
              ),
              actions: [],
            ),
            backgroundColor: bgColor,
            body: BlocBuilder<CustomerRequestsBloc, CustomerRequestsState>(
                builder: (context, state) {
              if (state is Loadedrequests) {
                print("the list lenght ${state.list.length}");
                if (state.list.isEmpty) {
                  return Center(
                    child: Text(
                      "there is no requests for you",
                      style: TextStyle(color: Colors.orange, fontSize: 17),
                    ),
                  );
                }
                if (state.list != null) {
                  return NotificationListener<ScrollNotification>(
                      onNotification: (notification) {
                        if (notification is ScrollEndNotification &&
                            controller.position.extentAfter == 0) {
                          print("here from listener");
                          pages++;
                          print(pages);

                          context
                              .read<CustomerRequestsBloc>()
                              .add(LoadRequests(pages, listsize));
                        }

                        return false;
                      },
                      child: ListView.builder(
                        itemCount: state.list.length,
                        controller: controller,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              print(state.list[index].id);

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          RequestDetailsScreen(
                                              state.list[index])));
                            },
                            child: Container(
                              margin: EdgeInsets.all(0.0),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.all(12.0),
                                            child: Container(
                                              width: size.width * 0.2,
                                              height: size.width * 0.2,
                                              decoration: BoxDecoration(
                                                color: lightBlues,
                                                borderRadius:
                                                    BorderRadius.circular(150),
                                              ),
                                              child: Center(
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      16.0),
                                                  child: Text(
                                                    "${index + 1}",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 22),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                                color: Colors.transparent,
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                border: Border.all(
                                                    color: heavyBlue)),
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                  left: 8,
                                                  right: 8,
                                                  top: 0,
                                                  bottom: 0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 8,
                                                        right: 8,
                                                        top: 5,
                                                        bottom: 5),
                                                    child: Text(
                                                      '${state.list[index].status}',
                                                      style: TextStyle(
                                                          color: heavyBlue,
                                                          fontSize: 7,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Container(
                                            width: size.width * 0.45,
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                  left: 8,
                                                  right: 8,
                                                  top: 16,
                                                  bottom: 3),
                                              child: Text(
                                                "order:#${state.list[index].id}",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: heavyBlue),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: size.width * 0.46,
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                  left: 8,
                                                  right: 8,
                                                  top: 3,
                                                  bottom: 3),
                                              child: Text(
                                                "${state.list[index].status}",
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    color: heavyBlue),
                                                overflow: TextOverflow.clip,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: size.width * 0.45,
                                            child: Row(
                                              children: [
                                                Container(
                                                  width: size.width * 0.41,
                                                  child: Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 8,
                                                        right: 8,
                                                        top: 3,
                                                        bottom: 16),
                                                    child: Text(
                                                      'Price offer number:',
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          color: heavyBlue),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Center(
                                            child: Text(
                                              "${state.list[index].creationDate.hour}:${state.list[index].creationDate.minute}",
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  color: heavyBlue),
                                            ),
                                          ),
                                          SizedBox(height: size.height *0.008),
                                          Center(
                                            child: Container(
                                              width: size.width * 0.25,
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                  left: 8,
                                                  right: 8,
                                                  bottom: 50,
                                                ),
                                                child: Text(
                                                  "${state.list[index].creationDate.day}/${state.list[index].creationDate.month}/${state.list[index].creationDate.year}",
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      color: heavyBlue),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  Divider(
                                    endIndent: 16,
                                    indent: 16,
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ));
                }
              }
              return Center(child: CircularProgressIndicator());
            })));
  }
}
