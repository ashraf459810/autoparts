
import 'package:autopart/Ui/signup_tab/creat_vendor_bloc.dart';
import 'package:autopart/Ui/vendorblocs/profilebloc/profilebloc_bloc.dart';
import 'package:autopart/core/style/base_color.dart';
import 'package:autopart/data/prefs_helper/prefs_helper.dart';
import 'package:autopart/model/BrandsEditBody.dart';
import 'package:autopart/model/VendorInfoAfterVerify/VendorBrands.dart';
import 'package:autopart/model/brand_model/brand_model.dart';
import 'package:autopart/model/vendor%20sign%20up%20model/vendor_sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditBrands extends StatefulWidget {
  final Function reset;
  EditBrands({Key key, this.reset}) : super(key: key);

  @override
  _EditBrandsState createState() => _EditBrandsState();
}

class _EditBrandsState extends State<EditBrands> {
  BrandsEditBody brandsEditBody = BrandsEditBody();

  ProfileblocBloc p = ProfileblocBloc();
  List<Brands> brands = [];
  List<Brand> brandsids = [];
  List<BrandModel> list = [];
  List<String> brAnd = [];
  bool dropselected = false;
  List<VendorBrands> vendorbrands = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return WillPopScope(
        onWillPop: () => onWillPop(),
        child: BlocProvider(
          create: (context) => CreatVendorBloc()..add(Listbrands()),
          child: Scaffold(
            body: Container(
              height: size.height,
              width: size.width,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: size.width * 0.02),
                    Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: size.width * 0.55,
                                  child: Text(
                                    'Brand Type',
                                    style: TextStyle(
                                        fontSize: 12, color: heavyBlue),
                                  ),
                                ),
                              ],
                            ),
                            BlocBuilder<CreatVendorBloc, CreatVendorState>(
                              builder: (context, state) {
                                if (state is BrandState) {
                                  list = [];
                                  // ignore: unused_local_variable
                                  String s;
                                  for (var i = 0;
                                      i < state.brands.length;
                                      i++) {
                                    s = state.brands[i].name;
                                    list = state.brands;
                                  }
                                }
                                return Container(
                                  width: size.width * 0.55,
                                  height: 35,
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 1),
                                    child: DropdownButton<BrandModel>(
                                      hint: Text(
                                        "Add your brands",
                                        style:
                                            TextStyle(color: Colors.grey[400]),
                                      ),
                                      items: list.map((BrandModel value) {
                                        return DropdownMenuItem<BrandModel>(
                                          value: value,
                                          child: Text(value.name),
                                        );
                                      }).toList(),
                                      onChanged: (value) {
                                        String ss = value.name;
                                        int s = value.id;

                                        brands.add(Brands(id: s));

                                        if (brAnd.contains(ss)) {
                                        } else {
                                          brAnd.add(ss);
                                        }
                                        dropselected = true;
                                        setState(() {});
                                      },
                                    ),
                                  ),
                                );
                              },
                            ),
                            SizedBox(
                              height: size.height * 0.05,
                            ),
                            dropselected
                                ? Row(children: [
                                    Container(
                                      height: size.height * 0.035,
                                      width: size.width * 0.9,
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        shrinkWrap: true,
                                        itemCount: brAnd.length,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 7),
                                            child: Stack(
                                              children: [
                                                Container(
                                                  width: size.width * 0.2,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                35)),
                                                    color: heavyBlue,
                                                  ),
                                                ),
                                                Positioned(
                                                  right: 0,
                                                  child: InkWell(
                                                    onTap: () {
                                                      brAnd.removeAt(index);
                                                      setState(() {});
                                                    },
                                                    child: Container(
                                                      height:
                                                          size.height * 0.015,
                                                      width: size.width * 0.03,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          30)),
                                                          color: lightGray),
                                                      child: Center(
                                                        child: Icon(
                                                          Icons.close,
                                                          size: 8,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  left: 15,
                                                  bottom: 7,
                                                  child: Text(
                                                    brAnd[index],
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ])
                                : Container(),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  onWillPop() async {
    for (var i = 0; i < list.length; i++) {
      if (brAnd.contains(list[i].name)) {
        vendorbrands.add(VendorBrands(
            id: list[i].id,
            img: list[i].attachments[0].publicUrl,
            name: list[i].name));

        brandsids.add(Brand(id: list[i].id));
      }
    }
    PrefsHelper prefsHelper = PrefsHelper();
    int id = await prefsHelper.getvendorid();
    brandsEditBody.brands = brandsids;
    brandsEditBody.id = id;

    p.add(EditBrandsEvent(brandsEditBody));

    final String encodedData = VendorBrands.encode(vendorbrands);

    await prefsHelper.setvendorbrands(encodedData);
    widget.reset();

    Navigator.of(context).pop();
  }
}
