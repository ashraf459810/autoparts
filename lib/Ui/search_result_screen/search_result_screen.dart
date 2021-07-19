import 'package:autopart/Ui/product_page/product_page.dart';
import 'package:autopart/Ui/search_screen/bloc/searchscreen_bloc.dart';
import 'package:autopart/core/style/base_color.dart';
import 'package:autopart/model/SearchedProduct.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultScreen extends StatefulWidget {
  final int brand;
  final int car;

  final int lowprice;

  final int highprice;

  final String name;

  // final String year;
  SearchResultScreen({
    this.brand,
    this.car,
    this.highprice,
    this.lowprice,
    this.name,
    // this.year
  });

  @override
  _SearchResultScreenState createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  int pages = 0;
  ScrollController controller = ScrollController();

  int ssize = 10;

  List<SearchResult> products = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocProvider(
        create: (context) => SearchscreenBloc()
          ..add(SearchProduct(
              brand: widget.brand,
              car: widget.car,
              highprice: widget.highprice,
              lowprice: widget.lowprice,
              name: widget.name,
              // year: widget.year,
              pages: pages,
              size: ssize)),
        child: Scaffold(
            // appBar: PreferredSize(
            //   preferredSize: Size.fromHeight(100.0),
            //   child: AppBar(
            //     backgroundColor: Colors.white,
            //     elevation: 0,
            //     titleSpacing: 0,
            //     leading: Icon(
            //       Icons.arrow_back_ios,
            //       color: lightOrange,
            //     ),
            //     flexibleSpace: Column(
            //       children: [
            //         SizedBox(
            //           height: size.height * 0.035,
            //         ),
            //         Padding(
            //           padding: const EdgeInsets.all(5.0),
            //           child: Container(
            //             width: size.width * 0.73,
            //             height: 45,
            //             decoration: BoxDecoration(
            //               color: bgColor,
            //               borderRadius: BorderRadius.all(
            //                 Radius.circular(50),
            //               ),
            //               border: Border.all(
            //                   width: 1,
            //                   style: BorderStyle.solid,
            //                   color: bgColor),
            //             ),
            //             child: TextFormField(
            //                 textAlign: TextAlign.start,
            //                 keyboardType: TextInputType.text,
            //                 decoration: fieldDecoration("Gears").copyWith(
            //                   prefixIcon: Padding(
            //                     padding: const EdgeInsets.all(8.0),
            //                     child: Padding(
            //                       padding: const EdgeInsets.all(8.0),
            //                       child: Icon(
            //                         Icons.search,
            //                         color: heavyBlue,
            //                       ),
            //                     ),
            //                   ),
            //                 )),
            //           ),
            //         ),

            //       ],
            //     ),
            //     centerTitle: false,
            //     // bottom: PreferredSize(
            //     //   preferredSize: Size.fromHeight(80.0),
            //       // child: Expanded(
            //       //   child: ListView.builder(
            //       //     scrollDirection: Axis.horizontal,
            //       //     itemCount: 9,
            //       //     itemBuilder: (context, index) {
            //       //       return Container(
            //       //         margin: EdgeInsets.all(0.0),
            //       //         child: Row(
            //       //           children: [
            //       //             Container(
            //       //               child: Padding(
            //       //                 padding: const EdgeInsets.only(
            //       //                     left: 8, right: 8, top: 8, bottom: 8),
            //       //                 child: Text(
            //       //                   'BEST MATCH',
            //       //                   style: TextStyle(
            //       //                       fontSize: 13, color: heavyBlue),
            //       //                 ),
            //       //               ),
            //       //             ),
            //       //           ],
            //       //         ),
            //       //       );
            //       //     },
            //       //   ),
            //       // ),
            //     ),
            //   //   actions: [
            //   //     Padding(
            //   //       padding: const EdgeInsets.all(16.0),
            //   //       child: SvgPicture.asset(
            //   //         'assets/images/filter.svg',
            //   //         width: 24,
            //   //         height: 24,
            //   //       ),
            //   //     ),
            //   //   ],
            //   // ),
            // ),

            backgroundColor: bgColor,
            body: BlocBuilder<SearchscreenBloc, SearchscreenState>(
                builder: (context, state) {
              if (state is SearchscreenInitial) {
                return Center(
                  child: LinearProgressIndicator(),
                );
              }
              if (state is Loading) {
                return Center(
                  child: LinearProgressIndicator(),
                );
              }
              if (state is Error) {
                return Center(child: Text("${state.error}"));
              }
              if (state is Searchedproducts) {
                print("here from state");
                products = state.products;
              }
              return Builder(
                builder: (context) => NotificationListener<ScrollNotification>(
                    onNotification: (notification) {
                      if (notification is ScrollEndNotification &&
                          controller.position.extentAfter == 0) {
                        print("here from listener");
                        print(pages);
                        pages++;
                        print(pages);
                        context.read<SearchscreenBloc>().add(SearchProduct(
                            brand: widget.brand,
                            car: widget.car,
                            highprice: widget.highprice,
                            lowprice: widget.lowprice,
                            name: widget.name,
                            // year: widget.year,
                            pages: pages,
                            size: ssize));
                      }

                      return false;
                    },
                    child: products.isNotEmpty
                        ? GridView.builder(
                            controller: controller,
                            padding: EdgeInsets.only(
                                left: 8, right: 8, top: 4, bottom: 4),
                            //        physics: NeverScrollableScrollPhysics(),
                            itemCount: products.length,
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: size.width / 500,
                              crossAxisSpacing: 0.0,
                              mainAxisSpacing: 0.0,
                            ),
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(
                                    left: 2, right: 2, top: 4, bottom: 4),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) =>
                                          ProductPage(products[index]),
                                    ));
                                  },
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 16,
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                  width: size.width * 0.35,
                                                  child: Text(
                                                      '${products[index].productType}',
                                                      style: TextStyle(
                                                          color: heavyBlue,
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign:
                                                          TextAlign.end)),
                                            ],
                                          ),
                                          products[index].attachments.isNotEmpty
                                              ? Container(
                                                  child: Image.network(
                                                    '${products[index].attachments[0].publicUrl}',
                                                    width: size.width * 0.3,
                                                    height: size.height * 0.1,
                                                    fit: BoxFit.fill,
                                                  ),
                                                )
                                              : Image.asset(
                                                  'assets/images/carIcon.png',
                                                  width: size.width * 0.3,
                                                  height: size.height * 0.1,
                                                  fit: BoxFit.fill,
                                                ),
                                          SizedBox(
                                            height: 16,
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                  width: size.width * 0.28,
                                                  child: Text(
                                                      '${products[index].product.name}',
                                                      style: TextStyle(
                                                          color: heavyBlue,
                                                          fontSize: 15),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign:
                                                          TextAlign.start)),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                  width: size.width * 0.27,
                                                  child: Text(
                                                      '${products[index].price}AED',
                                                      style: TextStyle(
                                                          color: heavyBlue,
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign:
                                                          TextAlign.start)),
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: lightOrange,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(50),
                                                  ),
                                                  border: Border.all(
                                                      width: 0.007,
                                                      style: BorderStyle.solid,
                                                      color: lightOrange),
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(3.0),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                          '${products[index].rates.ratesAvg}',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 9,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.start),
                                                      Icon(
                                                        Icons.star,
                                                        color: Colors.white,
                                                        size: 9,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          )
                        : Container(
                            child: Center(
                                child: Text(
                              "Nothing Found",
                              style: TextStyle(color: orange, fontSize: 18),
                            )),
                          )),
              );
            })));
  }

  InputDecoration fieldDecoration(String hint) {
    return InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(fontSize: 16, color: heavyBlue),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: BorderSide(
            color: bgColor,
            width: 0.5,
          ),
        ),
        filled: true,
        contentPadding: EdgeInsets.only(left: 16, right: 16),
        fillColor: bgColor);
  }
}
