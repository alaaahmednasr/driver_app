import '../network/local/cache_helper.dart';

String? phoneNumber;
String? otp;
String? userName;
String? password;
String? nationalIdFront;
String? nationalIdBack;
String? driverLisenceFront;
String? driverLisenceBack;
String? vehcileLisenceFront;
String? vehcileLisenceBack;

// String lang = 'en';

var header = {
  'lang': CacheHelper.getCacheLanguageCode(),
  'Content-Type': 'application/json',
};

var headerWithToken = {
  'lang': CacheHelper.getCacheLanguageCode(),
  'Content-Type': 'application/json',
  'Authorization': CacheHelper.getData(key: 'token'),
};
