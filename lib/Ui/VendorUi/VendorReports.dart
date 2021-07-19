import 'package:auto_size_text/auto_size_text.dart';
import 'package:autopart/core/style/base_color.dart';
import 'package:autopart/model/VendorStatistics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:autopart/Ui/vendorblocs/VendorStatistics/vendorstatistics_bloc.dart';

class VendorReports extends StatefulWidget {
  VendorReports({Key key}) : super(key: key);

  @override
  _VendorReportsState createState() => _VendorReportsState();
}

class _VendorReportsState extends State<VendorReports> {
  VendorStatisics vendorStatisics;

  DateTime dateTime1;
  DateTime dateTime2;
  @override
  void initState() {
    super.initState();
    dateTime1 = DateTime.now();
    dateTime2 = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return BlocProvider(
        create: (context) => VendorstatisticsBloc(),
        child: Scaffold(
            appBar: PreferredSize(
                preferredSize: Size.fromHeight(80),
                child: AppBar(
                  backgroundColor: Colors.white,
                 
               
                    
                  
                  title: 
                    Padding(
                      padding: const EdgeInsets.only(top: 20, right: 100),
                      child: Container(
                        child: Text(
                          "Reports & Statistics",
                          style: TextStyle(
                              color: heavyBlue,
                              fontSize: 26,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  
             
                  elevation: 0,
                )),
            backgroundColor: bgColor,
            body: BlocBuilder<VendorstatisticsBloc, VendorstatisticsState>(
                builder: (context, state) {
              if (state is Loading) {
                return Center(child: CircularProgressIndicator());
              }
              if (state is Error) {
                return Center(
                  child: Text(
                    state.error,
                    style: TextStyle(color: orange, fontSize: 18),
                  ),
                );
              }

              if (state is GetStatisticsState) {
                vendorStatisics = state.vendorStatisics;
              }
              return Container(
                height: size.height,
                width: size.width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/login_bg.png'),
                        fit: BoxFit.fill)),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 1),
                      child: Column(
                        children: [
                          Container(decoration: BoxDecoration(border: Border.all(color: orange)),
                            child: ListTile(
                                title: Text(
                                  "From    ${dateTime1.year}-${dateTime1.month}-${dateTime1.day}",
                                  style: TextStyle(
                                      fontSize: 16, fontWeight: FontWeight.bold,color: heavyBlue),
                                ),
                                trailing: Icon(Icons.keyboard_arrow_down),
                                onTap: () {
                                  _pickeddate();
                                }),
                          ),
                          Container(decoration: BoxDecoration(border: Border.all(color: orange)),
                                                      child: ListTile(
                              title: Text(
                                "To         ${dateTime2.year}-${dateTime2.month}-${dateTime2.day}",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold,color: heavyBlue),
                              ),
                              trailing: Icon(Icons.keyboard_arrow_down),
                              onTap: () {
                                _pickeddate2();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Container(
                      color: Colors.white,
                      child: vendorStatisics!=null? Column(
                        children: [
                          SizedBox(height: size.height * 0.02),
                          statistics(
                              size.height,
                              size.width,
                              "best Product For Others",
                              vendorStatisics.bestProductForOtherYouDontHave),
                          Divider(
                            color: Colors.grey[300],
                            height: 10,
                          ),
                          statistics(
                              size.height,
                              size.width,
                              "high Price Product",
                              vendorStatisics.highPriceProduct),
                          Divider(
                            color: Colors.grey[300],
                            height: 10,
                          ),
                          statistics(
                              size.height,
                              size.width,
                              "most Product Sold For Others",
                              vendorStatisics.mostProductSoldForOthers),
                          Divider(
                            color: Colors.grey[300],
                            height: 10,
                          ),
                          statistics(
                              size.height,
                              size.width,
                              "mostProductSoldName",
                              vendorStatisics.mostProductSoldName),
                          Divider(
                            color: Colors.grey[300],
                            height: 10,
                          ),
                          statistics(
                            size.height,
                            size.width,
                            "average Customer Rates",
                            ("${vendorStatisics.averageCustomerRates}"),
                          ),
                          Divider(
                            color: Colors.grey[300],
                            height: 10,
                          ),
                          statistics(
                            size.height,
                            size.width,
                            "most Product Sold Incomes",
                            ("${vendorStatisics.mostProductSoldIncomes}"),
                          ),
                          Divider(
                            color: Colors.grey[300],
                            height: 10,
                          ),
                          statistics(
                            size.height,
                            size.width,
                            "products Count",
                            ("${vendorStatisics.productsCount}"),
                          ),
                          Divider(
                            color: Colors.grey[300],
                            height: 10,
                          ),
                          statistics(
                            size.height,
                            size.width,
                            "sales Count",
                            ("${vendorStatisics.salesCount}"),
                          ),
                          Divider(
                            color: Colors.grey[300],
                            height: 10,
                          ),
                          statistics(
                            size.height,
                            size.width,
                            "high Price Product",
                            ("${vendorStatisics.highPriceProduct}"),
                          ),
                          Divider(
                            color: Colors.grey[300],
                            height: 10,
                          ),
                          statistics(
                            size.height,
                            size.width,
                            "total Incomes",
                            ("${vendorStatisics.totalIncomes}"),
                          ),
                        ],
                      ):Container(height: 1,),
                      
                    ),
                    SizedBox(height: size.height *0.02,),
                    GestureDetector(
                      onTap: () {
                        print(
                            "${dateTime1.year}-${dateTime1.month}-${dateTime1.day}");
                        String date1 =
                            "${dateTime1.year}-${dateTime1.month}-${dateTime1.day}";
                        String date2 =
                            "${dateTime2.year}-${dateTime2.month}-${dateTime2.day}";
                            context.read<VendorstatisticsBloc>().add(GetVendorStatisticsEvent(date2,date1));
                      },
                      child: Container(
                        height: size.height * 0.06,
                        width: size.width * 0.35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: heavyBlue,
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Show Statisitcs",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              // SizedBox(width: size.width * 0.06),
                              Container(
                                height: size.height * 0.03,
                                width: size.width * 0.05,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.white),
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  color: heavyBlue,
                                  size: 15,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            })));
  }

  _pickeddate() async {
    DateTime date = await showDatePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
      initialDate: dateTime1,
    );
    if (date != null) {
      setState(() {
        dateTime1 = date;
      });
    }
  }

  _pickeddate2() async {
    DateTime date = await showDatePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
      initialDate: dateTime2,
    );
    if (date != null) {
      setState(() {
        dateTime2 = date;
      });
    }
  }

  Widget statistics(double high, double width, String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 40),
          child: Text(
            "$title",
            style: TextStyle(
                color: heavyBlue, fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
        Spacer(
          flex: 1,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 1),
          child: SizedBox(height: high*0.02,
          width: width*0.2,
            child: AutoSizeText(
              
                   
                "$value",style: TextStyle(color: orange,fontSize: 18),maxLines: 1,
         
     
            ),
          ),
        ),
        Divider(
          color: Colors.grey[300],
          height: 30,
          indent: 30,
        )
      ],
    );
  }
}
