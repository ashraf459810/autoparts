import 'package:autopart/Ui/splash_screen/splash_screen.dart';
import 'package:autopart/data/prefs_helper/prefs_helper.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class InfoScreen extends StatefulWidget {
  InfoScreen({Key key}) : super(key: key);

  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  int index = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IntroductionScreen(
      pages: [
        PageViewModel(
          bodyWidget: Image.asset("assets/images/w1.png"),
          titleWidget: Container(
            height: 0,
          ),
          decoration: getPageDecoration(),
        ),
        PageViewModel(
          titleWidget: Container(
            height: 0,
          ),
          bodyWidget: Image.asset("assets/images/w2.png"),
          decoration: getPageDecoration(),
        ),
        PageViewModel(
          bodyWidget: Image.asset("assets/images/w3.png"),
          titleWidget: Container(
            height: 0,
          ),
          decoration: getPageDecoration(),
        ),
      ],
      done: Text('Next', style: TextStyle(fontWeight: FontWeight.w600)),
      onDone: () => goToHome(context),
      showSkipButton: true,
      skip: Text('Skip'),
      onSkip: () => goToHome(context),
      next: Icon(Icons.arrow_forward),
      dotsDecorator: getDotDecoration(),
      onChange: (index) => print('Page $index selected'),
      globalBackgroundColor: Theme.of(context).primaryColor,
      skipFlex: 0,
      nextFlex: 0,
      // isProgressTap: false,
      // isProgress: false,
      // showNextButton: false,
      // freeze: true,
      // animationDuration: 1000,
    ));
  }

  Future<void> goToHome(context) async {
    PrefsHelper prefsHelper = PrefsHelper();
    bool s = false;
    await prefsHelper.setisfirsttime(s);
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => SplashScreen()),
    );
  }

  Widget buildImage(String path) =>
      Center(child: Image.asset(path, width: 350));
  DotsDecorator getDotDecoration() => DotsDecorator(
        color: Color(0xFFBDBDBD),
        //activeColor: Colors.orange,
        size: Size(10, 10),
        activeSize: Size(10, 10),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      );
  PageDecoration getPageDecoration() => PageDecoration(
        titleTextStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        bodyTextStyle: TextStyle(fontSize: 20),
        descriptionPadding: EdgeInsets.all(16).copyWith(bottom: 0),
        imagePadding: EdgeInsets.all(24),
        pageColor: Colors.white,
      );
}

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const ButtonWidget({
    Key key,
    @required this.text,
    @required this.onClicked,
  }) : super(key: key);

  @override
  // ignore: deprecated_member_use
  Widget build(BuildContext context) => RaisedButton(
        onPressed: onClicked,
        color: Theme.of(context).primaryColor,
        shape: StadiumBorder(),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      );
}
