import 'package:autopart/Ui/Quotation_completed/Quotation_completed.dart';
import 'package:autopart/Ui/search_old_product/bloc/old_products_bloc.dart';
import 'package:autopart/Ui/upload_image/UploadPic.dart';

import 'package:autopart/core/style/base_color.dart';
import 'package:autopart/model/Quotation.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fluttertoast/fluttertoast.dart';

// ignore: must_be_immutable
class OrderScreen extends StatefulWidget {
  SendQuotation sendQuotation;
  String brandurl;
  OrderScreen(this.sendQuotation, this.brandurl);

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  List<int> ids = [];
  TextEditingController textEditingController = TextEditingController();
  String message = '';
  bool messagewrote = false;
  List<Photos> list = [];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocProvider(
        create: (context) => OldProductsBloc(),
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(80.0),
            child: AppBar(
              backgroundColor: Colors.white,
              leading: Icon(
                Icons.arrow_back_ios,
                color: lightOrange,
              ),
              elevation: 0,
              centerTitle: false,
              flexibleSpace: Column(
                children: [
                  SizedBox(
                    height: 80,
                  ),
                  Divider(
                    indent: 16,
                    endIndent: 16,
                  )
                ],
              ),
            ),
          ),
          backgroundColor: bgColor,
          body: Stack(
            children: [
              Container(
                width: size.width,
                height: size.height,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Card(
                      margin: EdgeInsets.all(0.0),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 8,
                          ),
                          Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.network(
                                '${widget.brandurl}',
                                height: 60,
                                width: 60,
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: size.width * 0.6,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8, right: 8, top: 16, bottom: 3),
                                  child: Text(
                                    'Order: #${widget.sendQuotation.customer.id}',
                                    style: TextStyle(
                                        fontSize: 15, color: heavyBlue),
                                  ),
                                ),
                              ),
                              Container(
                                width: size.width * 0.6,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8, right: 8, top: 3, bottom: 3),
                                  child: Text(
                                    '"${widget.sendQuotation.carClass}", "${widget.sendQuotation.year}", ${widget.sendQuotation.type}',
                                    style: TextStyle(
                                        fontSize: 15, color: heavyBlue),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                              messagewrote
                                  ? Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Container(
                                          child: Text(
                                        message,
                                        style: TextStyle(
                                            fontSize: 15, color: heavyBlue),
                                      )),
                                    )
                                  : Container(),
                              Container(
                                width: size.width * 0.6,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8, right: 8, top: 3, bottom: 16),
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
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: bgColor,
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
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
              ),
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: bgColor,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () async {
                                ids = await Navigator.of(context)
                                    .push(MaterialPageRoute(
                                  builder: (context) => UploadPic(
                                    phototag: "QUOTATION",
                                  ),
                                ));
                                print(ids);
                              },
                              child: Icon(
                                Icons.image,
                                color: heavyBlue,
                                size: 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          width: size.width * 0.65,
                          height: 45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(
                                width: 1,
                                style: BorderStyle.none,
                                color: Colors.white),
                          ),
                          child: TextFormField(
                            controller: textEditingController,
                            textAlign: TextAlign.start,
                          style: TextStyle(fontFamily: "Arabic"),
                            keyboardType: TextInputType.text,
                            decoration: fieldDecoration("enter your message"),
                            onChanged: (value) {
                              message = value;
                            },
                            onSaved: (value) {
                              message = value;
                            },
                          ),
                        ),
                      ),
                      BlocConsumer<OldProductsBloc, OldProductsState>(
                        builder: (context, state) {
                          if (state is Loading) {
                            return Center(child: CircularProgressIndicator());
                          }
                          if (state is QutationResponse) {}
                          return Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: InkWell(
                              onTap: () {
                                messagewrote = true;
                                setState(() {});

                                widget.sendQuotation.notes = message;

                                print("check for send quotation");
                                print(widget.sendQuotation.brand);
                                list = getphotosId(ids, list);
                                widget.sendQuotation.attachments = list;
                                print(list.length);
                                print(widget.sendQuotation.attachments.length);
                                context.read<OldProductsBloc>().add(
                                    SendQutationEvent(widget.sendQuotation));
                              },
                              child: Container(
                                //                width: 5,
                                //                height: 5,
                                decoration: BoxDecoration(
                                  color: lightOrange,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.arrow_upward,
                                    color: Colors.white,
                                    size: 18,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        listener: (context, state) {
                          if (state is QutationResponse) {
                            print("here from the state");
                            print(state.result);

                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        OrderCompletedScreen(state.result,widget.brandurl)));
                          }
                          if (state is Onerror) {
                            Fluttertoast.showToast(
                                msg: state.error,
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                backgroundColor: lightOrange,
                                textColor: Colors.white,
                                fontSize: 16.0);
                          }
                        },
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }

  InputDecoration fieldDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(fontSize: 16),
      filled: true,
      contentPadding: EdgeInsets.only(left: 16, right: 16),
      fillColor: Colors.white,
      border: InputBorder.none,
    );
  }
}

List<Photos> getphotosId(List<int> ids, List<Photos> list) {
  if (ids.isEmpty) {
    List<Photos> list = [];
    return list;
  } else {
    for (var i = 0; i < ids.length; i++) {
      Photos photos = Photos(id: ids[i]);
      list.add(photos);
    }
    return list;
  }
}
