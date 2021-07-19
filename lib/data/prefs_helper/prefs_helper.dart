import 'package:shared_preferences/shared_preferences.dart';
import 'package:autopart/core/app_language.dart';
import 'package:autopart/core/constent.dart';
import 'iprefs_helper.dart';

class PrefsHelper implements IPrefsHelper {
  @override
  Future<SharedPreferences> getPrefs() async {
    return await SharedPreferences.getInstance();
  }

  @override
  Future<bool> getIsLogin() async {
    return (await getPrefs()).getBool(IS_LOGIN) ?? false;
  }

  @override
  Future<int> getAppLanguage() async {
    return (await getPrefs()).getInt(APP_LANGUAGE) ?? AppLanguageKeys.EN;
  }

  @override
  Future<void> setAppLanguage(int value) async {
    (await getPrefs()).setInt(APP_LANGUAGE, value);
  }

  @override
  Future<bool> setislogin(bool s) async {
    print("test pref$s");
    return (await getPrefs()).setBool(IS_LOGIN, s);
  }

  @override
  Future<int> getvendorid() async {
    return (await getPrefs()).getInt(ID);
  }

  @override
  Future<void> setvendorid(int vendorid) async {
    return (await getPrefs()).setInt(ID, vendorid);
  }

  @override
  Future<int> getcustomerid() async {
    return (await getPrefs()).getInt(Customer_ID);
  }

  @override
  Future<void> setcustomerid(int id) async {
    return (await getPrefs()).setInt(Customer_ID, id);
  }

  @override
  Future<bool> getislogin() async {
    return (await getPrefs()).getBool(IS_LOGIN);
  }

  @override
  Future<String> getemailcustomer() async {
    return (await getPrefs()).getString(CustomerEmail);
  }

  @override
  Future<String> getemailvendor() async {
    return (await getPrefs()).getString(VendorEmail);
  }

  @override
  Future<String> getpasswordcustomer() async {
    return (await getPrefs()).getString(CustomerPassword);
  }

  @override
  Future<String> getpasswordvendor() async {
    return (await getPrefs()).getString(VendorPassword);
  }

  @override
  Future<String> getUserNameVendor() async {
    return (await getPrefs()).getString(VendorUserName);
  }

  @override
  Future<String> getUserNamecustomer() async {
    return (await getPrefs()).getString(CustomerUserName);
  }

  @override
  Future<bool> setUserNameVendor(String string) async {
    return (await getPrefs()).setString(VendorUserName, string);
  }

  @override
  Future<bool> setUserNamecustomer(String string) async {
    return (await getPrefs()).setString(CustomerUserName, string);
  }

  @override
  Future<bool> setemailcustomer(String string) async {
    return (await getPrefs()).setString(CustomerUserName, string);
  }

  @override
  Future<bool> setemailvendor(String string) async {
    return (await getPrefs()).setString(VendorEmail, string);
  }

  @override
  Future<bool> setpasswordcustomer(String string) async {
    return (await getPrefs()).setString(CustomerPassword, string);
  }

  @override
  Future<bool> setpasswordvendor(String string) async {
    return (await getPrefs()).setString(VendorPassword, string);
  }

  @override
  Future<String> gettoken() async {
    return (await getPrefs()).getString(Token);
  }

  @override
  Future<bool> settoken(String string) async {
    return (await getPrefs()).setString(Token, string);
  }

  @override
  Future<bool> getisverify() async {
    return (await getPrefs()).getBool(Isverify);
  }

  @override
  Future<bool> setisverify(bool s) async {
    return (await getPrefs()).setBool(Isverify, s);
  }

  @override
  Future<void> setemail(String email) async {
    return (await getPrefs()).setString(EMAIL, email);
  }

  @override
  Future<void> setusername(String name) async {
    return (await getPrefs()).setString(UserName, name);
  }

  @override
  Future<String> getemail() async {
    return (await getPrefs()).getString(Email);
  }

  @override
  Future<String> getusername() async {
    return (await getPrefs()).getString(UserName);
  }

  @override
  Future<int> getnotifications() async {
    return (await getPrefs()).getInt(Notifications);
  }

  @override
  Future<void> setnotifications(int number) async{
    return (await getPrefs()).setInt(Notifications,number);
  }

  @override
  Future<bool> getisfirsttime() async {

  return (await getPrefs()).getBool(Isfirsttime);
   
   
  }

  @override
  Future<bool> setisfirsttime(bool first) async {
     return (await getPrefs()).setBool(Isfirsttime,first);
    
  }

  @override
  Future<int> getcartid() async{
    
  return (await getPrefs()).getInt(CartID);
   
  }

  @override
  Future<void> setcartid(int id) async{
      return (await getPrefs()).setInt(CartID,id);
  
  }

  @override
  Future<String> getvendorbrands() async{
      return (await getPrefs()).getString(VendorBrands);
    
  }

  @override
  Future<void> setvendorbrands(String brand) async {
         return (await getPrefs()).setString(VendorBrands,brand);
    
  }
}
