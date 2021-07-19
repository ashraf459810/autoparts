import 'package:autopart/Ui/splash_screen/bloc/loginbloc_bloc.dart';

import 'package:get_it/get_it.dart';

import 'app/bloc/app_bloc.dart';

import 'data/http_helper/Ihttp_helper.dart';
import 'data/http_helper/http_helper.dart';
import 'data/prefs_helper/iprefs_helper.dart';
import 'data/prefs_helper/prefs_helper.dart';
import 'data/repository/irepository.dart';
import 'data/repository/repository.dart';


final sl = GetIt.instance;

Future iniGetIt() async {
 

  //data

  sl.registerLazySingleton<IPrefsHelper>(() => PrefsHelper());
  sl.registerLazySingleton<IHttpHelper>(() => HttpHelper());
  sl.registerLazySingleton<IRepository>(() => Repository(sl(), sl(), ));

  /// AppBloc

  sl.registerFactory(() => AppBloc(sl()));
sl.registerFactory(() => LoginblocBloc());
}
