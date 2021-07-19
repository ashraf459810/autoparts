
import 'package:autopart/model/VendorProductsModel.dart';

import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  final Content content;
  ProductDetails({this.content});

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
      height: size.height * 0.3,
      width: size.width,
      color: Colors.white,
      child: Container(
        height: size.height * 0.3,
        child: Card(
          child: Container(
            height: size.height * 0.3,
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
                    child: Container(),
                  ),
                ),
                Container(
                
                  width: size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                      
                            width: size.width * 0.45,
                            height:size.height * 0.045, 
                            child: Text(
                              'Your product',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.orange,
                                  
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                   height: size.height * 0.045,
                                   width: size.width* 0.454,
                                child: Text
                                  ("${widget.content.product.name}",
                                    maxLines: 2,
                                                      
                  
                                    style: TextStyle(
                                    color: Colors.black,
                                        fontSize: 14,
                                
                                        fontWeight: FontWeight.normal),
                                                            
                                  ),
                              ),
                            ],
                          ),
                          Container(
                            width: size.width * 0.45,
                             height: size.height * 0.037,

                            child: Row(
                              children: [
                            
                                Container(
                                   height: size.height * 0.037,
                                  child: Text(
                                    'Brand  :${widget.content.brand.name}',
                                    style: TextStyle(
                                      color: Colors.black,
                                                                  
                                                                      fontSize: 14,
                                                              
                                                                      fontWeight: FontWeight.normal),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: size.width * 0.45,
                             height: size.height * 0.037,
                            child: Row(
                              children: [
                          
                                Container(
                                  child: Text(
                                    'Price:${widget.content.price}',
                                    style: TextStyle(
                                      color: Colors.black,
                                                                  
                                                                      fontSize: 14,
                                                              
                                                                      fontWeight: FontWeight.normal),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        child: Column(
                          children: [
                            SizedBox(
                              height: size.height * 0.005,
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 25),
                              child: Container(
                                height: size.height * 0.15,
                                width: size.width * 0.3,
                                child:  widget.content.attachments.isNotEmpty?
                                Image.network(
                                 widget.content.attachments[0].publicUrl ,
                                  
                                  fit: BoxFit.fill,
                                ):Image.asset("assets/images/carIcon.png"),
                              ),
                            ),
                            Divider()
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
