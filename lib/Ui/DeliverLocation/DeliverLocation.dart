import 'package:autopart/Ui/DeliverLocation/GetLocationBloc/getlocation_bloc.dart';
import 'package:autopart/Ui/cart/placeOreder.dart';
import 'package:autopart/core/style/base_color.dart';
import 'package:autopart/model/GetCartModel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class DelieverLocation extends StatefulWidget {
  final List<CurrentCartItem> cart;
  DelieverLocation({Key key, this.cart}) : super(key: key);

  @override
  _DelieverLocationState createState() => _DelieverLocationState();
}

class _DelieverLocationState extends State<DelieverLocation> {
  TextEditingController controller = TextEditingController();
  String street;
  String country;
  String city;
  String street2;
  String country2;
  String city2;
  String dropdownvalue;

  Set<Marker> markers = {};

  LatLng currentPostion;
  LatLng markerlocation;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => GetlocationBloc()..add(LocationEvent()),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Opacity(
                  opacity: 0.6,
                  child: Container(
                    color: Colors.black,
                    height: size.height * 0.06,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.info_sharp,
                            color: Colors.white,
                          ),
                          Text(
                            "make a long press to mark your delivery location",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  child: BlocBuilder<GetlocationBloc, GetlocationState>(
                    builder: (context, state) {
                      if (state is SelectCityState) {
                        currentPostion = state.city;
                      }
                      if (state is Loading) {
                        return Container(
                            child: Center(child: CircularProgressIndicator()));
                      }
                      if (state is LocationState) {
                        currentPostion = LatLng(
                            state.position.latitude, state.position.longitude);

                        city = state.city;
                        country = state.country;
                        street = state.street;
                      }

                      return currentPostion != null
                          ? Stack(
                              children: [
                                Center(
                                  child: Container(
                                      height: size.height * 0.6,
                                      width: size.width,
                                      child: GoogleMap(
                                        myLocationButtonEnabled: false,

                                        myLocationEnabled: true,
                                        zoomControlsEnabled: false,
                                        //there is a lot more options you can add here

                                        onMapCreated: (controller) {
                                          Marker marker = Marker(
                                              position: currentPostion,
                                              markerId: MarkerId("IDs"));
                                          markers.add(marker);
                                          street2 = street;
                                          city2 = city;
                                          country2 = country;
                                          setState(() {});
                                        },
                                        gestureRecognizers: <
                                            Factory<
                                                OneSequenceGestureRecognizer>>[
                                          new Factory<
                                              OneSequenceGestureRecognizer>(
                                            () => new EagerGestureRecognizer(),
                                          ),
                                        ].toSet(),
                                        onLongPress: (argument) async {
                                          markers = {};
                                          markers.add(Marker(
                                              markerId: (MarkerId(
                                                "IDs",
                                              )),
                                              position: argument));
                                          print(markers.length);

                                          var info = await getLocationAddress(
                                              argument.latitude,
                                              argument.longitude);

                                          country2 = info[0].country;

                                          city2 = info[0].administrativeArea;

                                          street2 = info[0].street;
                                          print(street);
                                          setState(() {});
                                        },

                                        markers: markers,

                                        // onMapCreated: _onMapCreated,
                                        initialCameraPosition: CameraPosition(
                                          target: currentPostion,
                                          zoom: 17,
                                        ),
                                      )),
                                ),
                                markers.isNotEmpty
                                    ? Positioned(
                                        bottom: 1,
                                        // left: size.width * 0.15,
                                        child: Container(
                                            height: size.height * 0.08,
                                            width: size.width,
                                            child: Center(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    " Country : $country2",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                  Text(
                                                    " city:         $city2",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                  Text(
                                                    " street :    $street2",
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            decoration: BoxDecoration(
                                              color: orange,
                                              // borderRadius: BorderRadius.all(
                                              //   Radius.circular(30),
                                              // ),
                                            )))
                                    : Container(),
                              ],
                            )
                          : Container();
                    },
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Container(
                  color: Colors.white,
                  child: Builder(
                    builder: (context) => DropdownButton<String>(
                      hint: Center(child: Text("Select country")),

                      value: dropdownvalue,
                      isExpanded: true,
                      icon: const Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,

                      // style: const TextStyle(color: Colors.deepPurple),

                      underline: SizedBox(),
                      onChanged: (String newValue) {
                        dropdownvalue = newValue;
                        context
                            .read<GetlocationBloc>()
                            .add(SelectLocationEvent(newValue));
                      },

                      items: <String>['Saudi Arabia', 'UAE', 'Qatar', 'Oman']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(value),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  height: size.height * 0.04,
                  width: size.width * 0.7,
                  child: TextFormField(
                    controller: controller,
                    autofocus: false,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        isDense: true,
                        hintStyle: TextStyle(color: Colors.grey),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 3, vertical: 4),
                        // contentPadding: EdgeInsets.only(left: size.width *0.33),
                        hintText: "Write any deliver note here"),
                    onChanged: (value) {},
                    onSaved: (newValue) {},
                  ),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => PlaceOrder(
                        cart: widget.cart,
                        city: city2 != null ? city2 : city,
                        country: country2 != null ? country2 : country,
                        street: street2 != null ? street2 : street,
                        x: currentPostion.longitude,
                        y: currentPostion.latitude,
                      ),
                    ));
                  },
                  child: Container(
                    height: size.height * 0.06,
                    width: size.width * 0.35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: orange,
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Next",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<List<Placemark>> getLocationAddress(
      double latitude, double longitude) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(latitude, longitude);
    return placemarks;
  }
}
