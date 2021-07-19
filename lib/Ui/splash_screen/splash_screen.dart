
import 'package:autopart/Ui/VendorUi/vendorMultiReqestNotificationHandler/VendorMultiRequestsNot.dart';
import 'package:autopart/Ui/home/home.dart';
import 'package:autopart/Ui/login_as_screen/login_as_screen.dart';
import 'package:autopart/Ui/VendorUi/Vendornavbar.dart';
import 'package:autopart/data/prefs_helper/prefs_helper.dart';
import 'package:autopart/Ui/customer_notification_offer/CustomerOfferDetails.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:autopart/Ui/RejectedOffer/RejectedOffer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:autopart/Ui/splash_screen/bloc/loginbloc_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class SplashScreen extends StatefulWidget {
  // bool isLogin;

  // SplashScreen(this.isLogin);
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  FlutterLocalNotificationsPlugin fltNotification =
      FlutterLocalNotificationsPlugin();
  String payload;
  String onmessageinfo;
  bool firstselect = true;
  final navKey = new GlobalKey<NavigatorState>();
  @override
  // ignore: missing_return
  Future<void> initState() {
    initMessaging();
    register();
    notitficationPermission();

    getToken();
    notificationshandlers();
    // getInitialMessage();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => LoginblocBloc()..add(Islogin()),
        child: MaterialApp(
          navigatorKey: navKey,
          home: Scaffold(
              backgroundColor: Colors.white,
              body: Center(
                  child: BlocListener<LoginblocBloc, LoginblocState>(
                      listener: (context, state) async {
                        PrefsHelper prefsHelper = PrefsHelper();
                        bool isverify = await prefsHelper.getisverify();
                        print(isverify);
                        if (state is Isloginstate) {
                          if (state.login == true && isverify == true) {
                            if (state.isvendor == true) {
                              print("nav TEsT 1");
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => VendorNavBar()));
                            }
                            if (state.login == true && isverify == true) {
                              if (state.isvendor == false) {
                                print("nav TEsT 2"); //
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Home()));
                              }
                            }
                          }

                          if (state.login == false || isverify == false) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginAsScreen()));
                          }
                        }
                      },
                      child: Container()))
              // Image.asset(''))),
              ),
        ));
  }

  void register() {
    messaging.getToken().then((token) async {
      String tokenn = (token);

      PrefsHelper prefsHelper = PrefsHelper();
      await prefsHelper.settoken(tokenn);
    });
  }

  void getToken() async {
    print(await messaging.getToken());
  }

  void showNotification(String title, String body) async {
    var androidDetails =
        AndroidNotificationDetails('1', 'channelName', 'channel Description');

    var iosDetails = IOSNotificationDetails();

    var generalNotificationDetails =
        NotificationDetails(android: androidDetails, iOS: iosDetails);

    await fltNotification.show(0, title, body, generalNotificationDetails,
        payload: payload);
  }

  void notitficationPermission() async {
    // ignore: unused_local_variable
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
  }

  Future<void> initMessaging() async {
    var androiInit = AndroidInitializationSettings('@mipmap/logo');

    var iosInit = IOSInitializationSettings();

    var initSetting = InitializationSettings(android: androiInit, iOS: iosInit);

    fltNotification = FlutterLocalNotificationsPlugin();
    FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    await fltNotification.initialize(initSetting,
        onSelectNotification: selectNotification);
  }

  void notificationshandlers() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("here from o messgae");
      print(message.data.values.toList());
      final list = message.data.values.toList();
      String id = list[0];
      String type = list[1];

      if (type == "VENDOR_GET_NEW_REQUEST_FOR_QUOTATION_OFFER") {
        navKey.currentState.context
            .read<LoginblocBloc>()
            .add(Addnotifications());
        payload = type + id;
        print("here the substring");
        print(payload.substring(42));
      }
      if (type == "VENDOR_REPLY_ON_REQUEST_FOR_QUOTATION_OFFER") {
        navKey.currentState.context
            .read<LoginblocBloc>()
            .add(Addnotifications());
        payload = type + id;
      }
      if (type == "VENDOR_NOT_AVAILABLE_REQUEST_FOR_QUOTATION_OFFER") {
        navKey.currentState.context
            .read<LoginblocBloc>()
            .add(AddnotificationsCustomer());
        payload = type + id;
        print(payload);
      }

      showNotification(message.notification.title, message.notification.body);
      print("here after the show function");
    });

    messaging.getInitialMessage().then((RemoteMessage message) async {
      if (message != null) {
        final list = message.data.values.toList();
        String id = list[0];
        String type = list[1];
        if (type == "VENDOR_GET_NEW_REQUEST_FOR_QUOTATION_OFFER") {
          navKey.currentState.context
              .read<LoginblocBloc>()
              .add(Addnotifications());
          PrefsHelper prefsHelper = PrefsHelper();
          int vendorid = await prefsHelper.getvendorid();
          navKey.currentState.push(MaterialPageRoute(
              builder: (context) => VendorMultiReqestsNot(
                    requestid: int.parse(id),
                    vendorid: vendorid,
                  )));
        }
        if (type == "VENDOR_REPLY_ON_REQUEST_FOR_QUOTATION_OFFER") {
          navKey.currentState.context
              .read<LoginblocBloc>()
              .add(Addnotifications());
          navKey.currentState.push(MaterialPageRoute(
              builder: (context) => CustomerOfferDetails(
                    int.parse(id),
                  )));
        }
        if (type == "VENDOR_NOT_AVAILABLE_REQUEST_FOR_QUOTATION_OFFER") {
          navKey.currentState.context
              .read<LoginblocBloc>()
              .add(AddnotificationsCustomer());
          navKey.currentState
              .push(MaterialPageRoute(builder: (context) => RejectedOffer()));
        }
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      print('A new onMessageOpenedApp event was published!');
      print("here from o messgae");
      print(message.data.values.toList());
      final list = message.data.values.toList();
      String id = list[0];
      String type = list[1];
      if (type == "VENDOR_GET_NEW_REQUEST_FOR_QUOTATION_OFFER") {
        PrefsHelper prefsHelper = PrefsHelper();
        int vendorid = await prefsHelper.getvendorid();
        navKey.currentState.push(MaterialPageRoute(
            builder: (context) => VendorMultiReqestsNot(
                  requestid: int.parse(id),vendorid: vendorid,
                 
                )));
      }
      if (type == "VENDOR_REPLY_ON_REQUEST_FOR_QUOTATION_OFFER") {
        navKey.currentState.push(MaterialPageRoute(
            builder: (context) => CustomerOfferDetails(
                  int.parse(id),
                )));
      }
      if (type == "VENDOR_NOT_AVAILABLE_REQUEST_FOR_QUOTATION_OFFER") {
        navKey.currentState
            .push(MaterialPageRoute(builder: (context) => RejectedOffer()));
      }
    });

    // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  Future selectNotification(String payload) async {
    print("here from select");
    print(payload);
    if (payload.contains("VENDOR_GET_NEW_REQUEST_FOR_QUOTATION_OFFER")) {
      print("notification for vendor");
      String id = payload.substring(42);

      PrefsHelper prefsHelper = PrefsHelper();
      int vendorid = await prefsHelper.getvendorid();

      navKey.currentState.push(MaterialPageRoute(
          builder: (context) => VendorMultiReqestsNot(
                requestid: int.parse(id),
                vendorid: vendorid,
              )));

      print("here after the nav");
    }
    if (payload.contains("VENDOR_REPLY_ON_REQUEST_FOR_QUOTATION_OFFER")) {
      print("notification for customer");
      String id = payload.substring(43);
      navKey.currentState.push(MaterialPageRoute(
          builder: (context) => CustomerOfferDetails(
                int.parse(id),
              )));
    }
    if (payload.contains("VENDOR_NOT_AVAILABLE_REQUEST_FOR_QUOTATION_OFFER")) {
      print("offer not Availavle for customer");
      navKey.currentState
          .push(MaterialPageRoute(builder: (context) => RejectedOffer()));
    }
  }
}

// Future _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   print("here from background function");
//   print(message.data);
// }
