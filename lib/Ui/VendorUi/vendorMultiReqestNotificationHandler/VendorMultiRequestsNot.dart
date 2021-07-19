import 'package:autopart/Ui/VendorUi/AppBar/VendorAdding1offer.dart';

import 'package:autopart/Ui/vendorblocs/MultiReqests/vendormultireqestnotificationhandler_bloc.dart';
import 'package:autopart/core/style/base_color.dart';
import 'package:autopart/model/MultiReqestforQuotationNotification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VendorMultiReqestsNot extends StatefulWidget {
  final int requestid;
  final int vendorid;

  VendorMultiReqestsNot({this.requestid, this.vendorid});

  @override
  _VendorMultiReqestsNotState createState() => _VendorMultiReqestsNotState();
}

class _VendorMultiReqestsNotState extends State<VendorMultiReqestsNot> {
  List<int> answerd = [];
  VendormultireqestnotificationhandlerBloc
      vendormultireqestnotificationhandlerBloc =
      VendormultireqestnotificationhandlerBloc();
  List<MultiReqestQModel> list = [];
  @override
  void initState() {
    vendormultireqestnotificationhandlerBloc
        .add(GetRequestsEvent(widget.requestid));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        child: BlocBuilder (
          bloc: vendormultireqestnotificationhandlerBloc,
          builder: (context, state) {
            if (state is Loading) {
              return Container(
                height: 400,
                width: 300,
                child: Center(
                  child: CircularProgressIndicator(
                    backgroundColor: orange,
                  ),
                ),
              );
            }
            if (state is GetRequestsState) {
              list = state.list;
            }
            if (state is Error) {
              return Text(state.error);
            }
            return ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: !answerd.contains( list[index].id )? InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => VendorAddingOneOffer(
                                multiReqestQModel: list[index], isanswerd:isanswerd,
      
                              )));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // SizedBox(width: size.width *0.02),
                   
                   !answerd.contains( list[index].id )?     Icon(
                          Icons.email,
                          size: 30,
                          color: lightOrange,
                        ):Icon(
                          Icons.open_in_new,
                          size: 30,
                          color: Colors.grey,
                        ),
                        // SizedBox(
                        //   width: size.width * 0.3,
                        // ),
                        Text("New Request"),
                        Column(
                          children: [
                            Text(
                                "${list[index].creationDate.day}/${list[index].creationDate.month}/${list[index].creationDate.year}"),
                            Text(
                                "${list[index].creationDate.hour}:${list[index].creationDate.minute}")
                          ],
                        )
                      ],
                    ),
                  ):Container(),
                );
              },
            );
          },
        ),
      ),
    );
  }

  void isanswerd(int n){
    answerd.add(n) ;
    setState(() {
      
    });

  }
        
}
