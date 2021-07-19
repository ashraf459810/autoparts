import 'package:autopart/Ui/VendorUi/AppBar/AppBar.dart';
import 'package:autopart/Ui/VendorUi/VendorProductDetails.dart';
import 'package:autopart/model/VendorProductsModel.dart';
import 'package:flutter/material.dart';
import 'package:autopart/core/style/base_color.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:autopart/Ui/VendorUi/AddProducts.dart';
import 'package:autopart/Ui/vendorblocs/vendor_products_bloc/pullProducts/pullvendorproducts_bloc.dart';

class VendorProducts extends StatefulWidget {
  VendorProducts({Key key}) : super(key: key);

  @override
  _VendorProductsState createState() => _VendorProductsState();
}

class _VendorProductsState extends State<VendorProducts> {
  ScrollController _scrollController = new ScrollController();
  List<Content> vendorcontent = [];
  int listsize = 10;
  int pages = 0;
  int count = 10;
  String type = " ";
  NotificationBar bar = NotificationBar();

  List<String> products = ["1", "2", "3"];
  ScrollController controller = ScrollController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    // return BlocProvider(
    //   create: (context) => PullvendorproductsBloc(),
    return BlocProvider(
        create: (context) =>
            PullvendorproductsBloc()..add(Pullten(pages, listsize, type)),
        child: Scaffold(
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(80.0),
              child: bar.appbar(context, true)),
          backgroundColor: bgColor,
          body: Container(
              height: size.height,
              width: size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/login_bg.png'),
                      fit: BoxFit.fill)),
              child: SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: 16, right: 16, bottom: 8, top: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Products',
                            style: TextStyle(
                                fontSize: 30,
                                color: heavyBlue,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    BlocBuilder<PullvendorproductsBloc,
                        PullvendorproductsState>(builder: (context, state) {
                      if (state is GetNextPage) {
                        print("loading");
                        return CircularProgressIndicator(
                          backgroundColor: red,
                        );
                      }

                      if (state is GetVendorProductsState) {
                        print("here from state ");
                        print(state.content.length);
                        if (state.content.length == 0) {
                          return Opacity(
                            opacity: 0.6,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AddProducts()));
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(30)),
                                      color: Colors.white),
                                  child: Column(
                                    children: [
                                      SizedBox(height: size.height * 0.08),
                                      Container(
                                        width: 75,
                                        height: 75,
                                        decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.grey),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(60))),
                                        child: Icon(
                                          Icons.add,
                                          size: 50,
                                        ),
                                      ),
                                      SizedBox(
                                        height: size.height * 0.02,
                                      ),
                                      Text('Add new product',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16))
                                    ],
                                  )),
                            ),
                          );
                        } else
                        
                        return NotificationListener<ScrollNotification>(
                          onNotification: (notification) {
                            if (notification is ScrollEndNotification &&
                                _scrollController.position.extentAfter == 0) {
                              print("here from listener");
                              pages++;

                              context
                                  .read<PullvendorproductsBloc>()
                                  .add(Pullten(pages, listsize, type));
                            }

                            return false;
                          },
                          child: Container(
                            height: size.height *0.8,
                            child: GridView.builder(
                                controller: _scrollController,
                                padding: EdgeInsets.only(
                                    left: 8, right: 8, top: 4, bottom: 4),
                                itemCount: state.content.length + 1,
                                shrinkWrap: true,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: size.width / 450,
                                  crossAxisSpacing: 10.0,
                                  mainAxisSpacing: 10.0,
                                ),
                                itemBuilder: (context, index) {
                                  if (index < state.content.length)
                                    return ClipRRect(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(30)),
                                      child: Card(
                                        child: InkWell(
                                          onTap: () {
                                            print(state.content[index]);
                                            Navigator.of(context)
                                                .push(MaterialPageRoute(
                                              builder: (context) =>
                                                  ProductDetails(
                                                content: state.content[index],
                                              ),
                                            ));
                                          },
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height: size.height * 0.16,
                                                child: state.content[index]
                                                        .attachments.isNotEmpty
                                                    ? Image.network(
                                                        state
                                                            .content[index]
                                                            .attachments[0]
                                                            .publicUrl,
                                                        width:
                                                            size.width * 0.5,
                                                        height:
                                                            size.height * 0.15,
                                                        fit: BoxFit.cover   ,
                                                      )
                                                    : Image.asset(
                                                        "assets/images/carIcon.png"),
                                              ),
                                            
                                            
                                              SizedBox(
                                                height: 15,
                                              ),
                                              Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Container(
                                                          width:
                                                              size.width * 0.21,
                                                          child: Text(
                                                              '${state.content[index].product.name}',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .grey,
                                                                  fontSize: 13,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .center)),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      SizedBox(
                                                          width: size.width *
                                                              0.01),
                                                      Container(
                                                          width:
                                                              size.width * 0.15,
                                                          child: Text(
                                                              "    ${state.content[index].brand.name}",
                                                              style: TextStyle(
                                                                  color:
                                                                      heavyBlue,
                                                                  fontSize: 13,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .center)),
                                                      SizedBox(
                                                        width:
                                                            size.width * 0.12,
                                                      ),
                                                      Container(
                                                          decoration: BoxDecoration(
                                                              color: Colors
                                                                  .deepOrange,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          30)),
                                                          height: 15,
                                                          width: 40,
                                                          child: Center(
                                                            child: Text(
                                                                "${state.content[index].productType}",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        12)),
                                                          )),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  else
                                    return Opacity(
                                      opacity: 0.6,
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      AddProducts()));
                                        },
                                        child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(30)),
                                                color: Colors.white),
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                    height: size.height * 0.08),
                                                Container(
                                                  width: 75,
                                                  height: 75,
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.grey),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  60))),
                                                  child: Icon(
                                                    Icons.add,
                                                    size: 50,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: size.height * 0.02,
                                                ),
                                                Text('Add new product',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 16))
                                              ],
                                            )),
                                      ),
                                    );
                                }),
                          ),
                        );
                      }

                      return Opacity(
                        opacity: 0.6,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AddProducts()));
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                  color: Colors.white),
                              child: Column(
                                children: [
                                  SizedBox(height: size.height * 0.08),
                                  Container(
                                    width: 75,
                                    height: 75,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(60))),
                                    child: Icon(
                                      Icons.add,
                                      size: 50,
                                    ),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.02,
                                  ),
                                  Text('Add new product',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16))
                                ],
                              )),
                        ),
                      ); // //   ),
                      // );
                    }),
                  
                  ]))),
        ));
  }
}
