import 'package:shared_preferences/shared_preferences.dart';

abstract class IPrefsHelper {
  Future<SharedPreferences> getPrefs();

  Future<bool> getIsLogin();

  Future<int> getAppLanguage();

  Future<void> setAppLanguage(int value);
  Future<bool> setislogin(bool s);
  Future<void> setvendorid(int vendorid);
  Future<int> getvendorid();
  Future<void> setcustomerid(int id);
  Future<int> getcustomerid();
  Future<bool> getislogin();
  Future<bool> setemailvendor(String string);
  Future<bool> setpasswordvendor(String string);
  Future<bool> setemailcustomer(String string);
  Future<bool> setpasswordcustomer(String string);
  Future<String> getemailvendor();
  Future<String> getpasswordvendor();
  Future<String> getemailcustomer();
  Future<String> getpasswordcustomer();
  Future<String> getUserNamecustomer();
  Future<String> getUserNameVendor();
  Future<bool> setUserNamecustomer(String string);
  Future<bool> setUserNameVendor(String string);
  Future<bool> settoken(String string);
  Future<String> gettoken();
  Future<bool> setisverify(bool s);
  Future<bool> getisverify();
  Future<void> setemail(String email);
  Future<void> setusername(String name);
  Future<String> getusername();
  Future<String> getemail();
  Future<void> setnotifications(int number);
  Future<int> getnotifications();
  Future<bool> setisfirsttime(bool first);
  Future<bool> getisfirsttime();
  Future<void> setcartid(int id);
  Future<int> getcartid();
  Future<String> getvendorbrands();
  Future<void> setvendorbrands(String brand);
}
