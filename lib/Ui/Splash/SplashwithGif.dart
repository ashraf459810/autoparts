import 'dart:async';

import 'package:autopart/Ui/InfoScreen/InfoScreen.dart';
import 'package:autopart/Ui/splash_screen/splash_screen.dart';
import 'package:autopart/data/prefs_helper/prefs_helper.dart';

import 'package:flutter/material.dart';

class SplashWithGif extends StatefulWidget {
  SplashWithGif({Key key}) : super(key: key);

  @override
  _SplashWithGifState createState() => _SplashWithGifState();
}

class _SplashWithGifState extends State<SplashWithGif> {
  @override
  void initState() {
    startTimer();
    super.initState();
  }

  Timer timer;
  int start = 5;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
        height: size.height,
        width: size.width,
        child: Image.asset("assets/images/splash.gif",fit: BoxFit.cover));
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    timer = new Timer.periodic(oneSec, (Timer timer) async {
      PrefsHelper prefsHelper = PrefsHelper();
      bool firsttime = await prefsHelper.getisfirsttime();
      if (start == 0) {
        timer.cancel();
        if (firsttime == null) {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => InfoScreen(),
          ));
        }
        else {
           Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => SplashScreen(),
          ));

        }
      } else {
        start--;
      }
    });
  }
}
