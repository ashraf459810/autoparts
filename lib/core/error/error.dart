
class NetworkException implements Exception{
  String error;
  NetworkException({this.error = "Something Went Wrong"});
}

class ErrorCode {
  static const int somethingWentWrong = 1;
  static const int thanksYou = 2;
  static const int theCompanyAlreadyExists = 3;
  static const int RateExists = 4;
}

