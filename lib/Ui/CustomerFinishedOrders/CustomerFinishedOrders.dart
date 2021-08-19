import 'package:autopart/Ui/vendorblocs/profilebloc/profilebloc_bloc.dart';
import 'package:autopart/model/FinishedOrdersCustomer.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomerFinishedOrders extends StatefulWidget {
  CustomerFinishedOrders({Key key}) : super(key: key);

  @override
  _CustomerFinishedOrdersState createState() => _CustomerFinishedOrdersState();
}

class _CustomerFinishedOrdersState extends State<CustomerFinishedOrders> {
  List<FinishedOrders> finishedorders = [];
  ProfileblocBloc profileblocBloc = ProfileblocBloc();
  @override
  void initState() {
    profileblocBloc.add(CustomerFinishedOrdersEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder(
        bloc: profileblocBloc,
        builder: (context, state) {
          if (state is Loading) {
            return Center(
                child: CircularProgressIndicator(
              backgroundColor: Colors.orange,
            ));
          }
          if (state is Error) {
            return Center(
              child: Text(state.error),
            );
          }
          if (state is CustomerFinishedOrdersState) {
            print("state is finished orders ");
            print(state.finishedorders.length);
            finishedorders = state.finishedorders;
          }

          return Container();
        },
      ),
    );
  }
}
