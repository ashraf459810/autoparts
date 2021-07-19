


import 'package:autopart/data/http_helper/Ihttp_helper.dart';
import 'package:autopart/data/prefs_helper/iprefs_helper.dart';



import 'irepository.dart';


class Repository implements IRepository {
  // ignore: unused_field
  IHttpHelper _ihttpHelper;
  IPrefsHelper _iprefHelper;
  // ignore: unused_field


  Repository(this._ihttpHelper, this._iprefHelper, );

  @override
  Future<int> getAppLanguage() async {
    return await _iprefHelper.getAppLanguage();
  }

  @override
  Future<bool> getIsLogin() async {
    return await _iprefHelper.getIsLogin();
  }

 


}
