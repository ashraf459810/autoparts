import 'package:autopart/Ui/CartHistory/bloc/carthistory_bloc.dart';
import 'package:autopart/model/ReturnRequestModel/ReturnRequestsModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReturnRequests extends StatefulWidget {
  ReturnRequests({Key key}) : super(key: key);

  @override
  _ReturnRequestsState createState() => _ReturnRequestsState();
}

class _ReturnRequestsState extends State<ReturnRequests> {
  int page = 0;
  int ssize = 10;
  List<CContent> requests = [];
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocProvider(
        create: (context) =>
            CarthistoryBloc()..add(ReturnOrdersEvent(page, ssize)),
        child: Scaffold(
          body: SafeArea(
            top: true,
            child: Builder(
              builder: (context) => NotificationListener<ScrollNotification>(
                onNotification: (notification) {
                  if (notification is ScrollEndNotification &&
                      scrollController.position.extentAfter == 0) {
                    print("here from listener");
                    page++;

                    context
                        .read<CarthistoryBloc>()
                        .add(GetCartHistoryEvent(page, ssize));
                  }

                  return false;
                },
                child: BlocBuilder<CarthistoryBloc, CarthistoryState>(
                    builder: (context, state) {
                  if (state is CarthistoryInitial) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is ReturnOrdersState) {
                    print("here from returnorders state");
                    requests = state.requests;
                  }

                  return requests.isNotEmpty
                      ? Container(
                          height: size.height * 0.9,
                          child: ListView.builder(
                            controller: scrollController,
                            itemCount: requests.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            height: size.height * 0.2,
                                            width: size.width * 0.3,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.white),
                                            child: SizedBox(
                                              height: size.height * 0.2,
                                              width: size.width * 0.2,
                                              child: requests[index]
                                                      .attachments
                                                      .isNotEmpty
                                                  ? Image.network(
                                                      '${requests[index].attachments[0].publicUrl}',
                                                      width: size.width * 0.3,
                                                      height: size.height * 0.1,
                                                    )
                                                  : Image.asset(
                                                      "assets/images/carIcon.png"),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 40, bottom: 40),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: size.height * 0.04,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Container(
                                                      height:
                                                          size.height * 0.02,
                                                      width: size.width * 0.4,
                                                      child: Text(
                                                        "Date : ${requests[index].creationDate.day}/${requests[index].creationDate.month}/${requests[index].creationDate.year}",
                                                        maxLines: 1,
                                                        style: TextStyle(
                                                            color: Colors.grey,

                                                            // overflow: TextOverflow
                                                            // .ellipsis,
                                                            fontSize: 10),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Container(
                                                      height:
                                                          size.height * 0.023,
                                                      width: size.width * 0.3,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    20)),
                                                      ),
                                                      child: Text(
                                                        "${requests[index].item.product.name}",
                                                        style: TextStyle(
                                                          color: Colors.grey,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: size.height * 0.01,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      height:
                                                          size.height * 0.02,
                                                      width: size.width * 0.3,
                                                      child: Text(
                                                        "Order : ${requests[index].id}",
                                                        style: TextStyle(
                                                            color: Colors.grey,
                                                            fontSize: 15),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: size.height * 0.015,
                                                ),
                                                Container(
                                                  height: size.height * 0.07,
                                                  width: size.width * 0.4,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "status : ${requests[index].status}",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.orange,
                                                            fontSize: 15),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: size.height * 0.02,
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: size.width * 0.08,
                                          ),
                                        ],
                                      ),
                                      Container(
                                          height: 0.5, color: Colors.grey[300]),
                                    ]),
                              );
                            },
                          ),
                        )
                      : Container(
                          child: Center(
                            child: Text("No Requests For you"),
                          ),
                        );
                }),
              ),
            ),
          ),
        ));
  }
}
