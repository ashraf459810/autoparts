import 'package:autopart/Ui/OfferDetailsScreen/OfferDetailsScreen.dart';
import 'package:autopart/Ui/CheckCustomerOffers!/CustomerOffers/bloc/customeroffers_bloc.dart';
import 'package:autopart/core/style/base_color.dart';
import 'package:autopart/model/RequestForCustomers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:convert' show utf8;
import 'package:autopart/model/CustomerOffers.dart/CustomerOffers.dart';

class RequestDetailsScreen extends StatefulWidget {
  final CustomerRequests customerRequests;

  RequestDetailsScreen(this.customerRequests);

  @override
  _RequestDetailsScreenState createState() => _RequestDetailsScreenState();
}

class _RequestDetailsScreenState extends State<RequestDetailsScreen> {
  List<Offer> offers = [];
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
        create: (context) => CustomeroffersBloc()
          ..add(GetOfferEvent(pages, listsize, widget.customerRequests.id)),
        child: BlocBuilder<CustomeroffersBloc, CustomeroffersState>(
            builder: (context, state) {
          // if (state is Loading) {
          //   return Scaffold(
          //       body: Center(
          //           child: SizedBox(
          //               child: CircularProgressIndicator(
          //     backgroundColor: orange,
          //   ))));
          // }

          if (state is OnError) {
            return Scaffold(
                body: Center(
                    child: Text(
              "Error please check your internet",
              style: TextStyle(color: orange),
            )));
          }

          if (state is GetOffersState) {
            print("here in the state");
            print(state.offers.length);
            offers = state.offers;

            if (offers.isEmpty) {
              print("here the list is null");
              return Scaffold(
                  body: Center(
                      child: Text(
                "no offers for now",
                style: TextStyle(color: orange),
              )));
            }
          }
          return Scaffold(
              body: Container(
            child: Column(
              children: [
                Divider(
                  endIndent: 16,
                  indent: 16,
                ),
                SizedBox(
                  height: size.height * 0.06,
                ),
                Padding(
                  padding: EdgeInsets.all(0.0),
                  child: Card(
                    margin: EdgeInsets.all(0.0),
                    child: Container(
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: size.width * 0.8,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 8, top: 16, bottom: 3),
                                  child: Text(
                                    'Order: # ${widget.customerRequests.id} ',
                                    style: TextStyle(
                                        fontSize: 15, color: heavyBlue),
                                  ),
                                ),
                              ),
                              Container(
                                width: size.width * 0.8,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 8, right: 8, top: 3, bottom: 3),
                                  child: Text(
                                    '   ${widget.customerRequests.brand.name}   ',
                                    style: TextStyle(
                                        fontSize: 15, color: heavyBlue),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                              Container(
                                width: size.width * 0.8,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 20, right: 8, top: 3, bottom: 16),
                                  child: Text(
                                    'Request product',
                                    style: TextStyle(
                                        fontSize: 15, color: lightOrange),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: bgColor,
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(5.0),
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  color: heavyBlue,
                                  size: 16,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                NotificationListener<ScrollNotification>(
                  onNotification: (notification) {
                    if (notification is ScrollEndNotification &&
                        controller.position.extentAfter == 0) {
                      print("here from listener");
                      pages++;
                      print(pages);

                      context.read<CustomeroffersBloc>().add(GetOfferEvent(
                          pages, listsize, widget.customerRequests.id));
                    }

                    return false;
                  },
                  child: Container(
                    height: size.height * 0.7,
                    width: size.width,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      controller: controller,
                      itemCount: offers.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          OneRequestDetailsScreen(
                                              offers[index])));
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(15.0),
                                        child: Container(
                                          width: size.width * 0.18,
                                          height: size.width * 0.18,
                                          decoration: BoxDecoration(
                                            color: lightOrange,
                                            borderRadius:
                                                BorderRadius.circular(150),
                                          ),
                                          child: Center(
                                            child: Padding(
                                              padding: EdgeInsets.all(16.0),
                                              child: Text(
                                                "${index + 1}",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 22),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 6),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: size.width * 0.45,
                                          child: Text(
                                            'Offer number ${index+1}',
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: heavyBlue,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Container(
                                          width: size.width * 0.45,
                                          child: offers[index].notes!=null? Text(
                                            '${utf8.decode(offers[index].notes.codeUnits)}',
                                            style: TextStyle(
                                                fontSize: 14, color: heavyBlue,fontFamily: "Arabic"),
                                            overflow: TextOverflow.ellipsis,
                                            
                                          ):Text("Note")
                                        ),
                                        Container(
                                          width: size.width * 0.45,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                child: Text(
                                                  'المدة بالايام ',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: heavyBlue,
                                                      fontWeight:
                                                          FontWeight.w100),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                              Container(
                                                child: Text(
                                                  '${offers[index].daysToDeliver}',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: heavyBlue,
                                                      fontWeight:
                                                          FontWeight.w300),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: size.width * 0.45,
                                          child: Row(
                                            children: [
                                              Container(
                                                child: Text(
                                                  'النوعية : ',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: heavyBlue,
                                                      fontWeight:
                                                          FontWeight.w100),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                              Container(
                                                child: Text(
                                                  '${offers[index].brand.name}',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: heavyBlue,
                                                      fontWeight:
                                                          FontWeight.w300),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: size.width * 0.45,
                                          child: Row(
                                            children: [
                                              Container(
                                                child: Text(
                                                  'Price: ',
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color: heavyBlue),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                              Container(
                                                child: Text(
                                                  '${offers[index].fullPrice}',
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color: lightBlues),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: Column(
                                      children: [
                                        Container(
                                          width: size.width * 0.25,
                                          child: Text(
                                            '${offers[index].creationDate.year}/${offers[index].creationDate.month}/${offers[index].creationDate.day}',
                                            style: TextStyle(
                                                fontSize: 13, color: heavyBlue),
                                          ),
                                        ),
                                        SizedBox(
                                          height: size.height * 0.005,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(right: 25),
                                          child: Container(
                                            height: size.height * 0.1,
                                            width: size.width * 0.2,
                                            child: Image.asset(
                                              'assets/images/carIcon.png',
                                              width: size.width * 0.4,
                                              height: size.width * 0.4,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                        Divider(),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ));
                      },
                    ),
                  ),
                )
              ],
            ),
          ));
        }));
  }
}
