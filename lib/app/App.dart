
import 'package:autopart/Ui/Splash/SplashwithGif.dart';


import 'package:autopart/app/bloc/app_bloc.dart';
import 'package:autopart/core/app_language.dart';
import 'package:autopart/core/app_localizations.dart';
import 'package:flutter/material.dart';


import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import '../injectoin.dart';
import 'bloc/app_event.dart';
import 'bloc/app_state.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {


  // ignore: non_constant_identifier_names
  final _AppBloc = sl<AppBloc>();
  @override
  initState() {
  

    _AppBloc.add(IniEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: _AppBloc,
        builder: (BuildContext context, AppState state) {
          print('LoginState : ${state.loginState}');
          print('Language App : ${state.appLanguage}');
          return StreamBuilder(
              stream: localeSubjectAppLanguage.stream.distinct(),
              initialData: state.appLanguage == AppLanguageKeys.AR
                  ? Locale('ar', '')
                  : Locale('en', ''),
              builder: (context, snapshotLanguage) {
                return MaterialApp(
                    title: "App",
                    color: Color.fromRGBO(16, 150, 141, 1),
                    theme: ThemeData(
                        primarySwatch: createMaterialColor(Color(0xFF10968D)),
                        fontFamily: 'FontsFree-Net-SFProDisplay'),
                    home: SplashWithGif(),
                    // SplashScreen(state.loginState),
                    locale: snapshotLanguage.data == AppLanguageKeys.AR
                        ? Locale('ar', '')
                        : Locale('en', ''),
                    localizationsDelegates: [
                      AppLocalizations.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                    ],
                    supportedLocales: [
                      const Locale('en', ''), // English
                      const Locale('ar', ''), // Arabic
                    ]);
              });
        });
  }

  MaterialColor createMaterialColor(Color color) {
    List strengths = <double>[.05];
    Map swatch = <int, Color>{};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    strengths.forEach((strength) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    });
    return MaterialColor(color.value, swatch);
  }

 

 

  
}
