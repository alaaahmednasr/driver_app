class SignUpModel {
  bool? success;
  bool? status;
  late String message;
  UserData? data;
  // SignupError? error ;

  SignUpModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
    message = json['message'];
    data = (json['data'] != null ? UserData.fromJson(json['data']) : null);
    // error = (json['error'] != null ? SignupError.fromJson(json['error']) : null);

  }
}

class UserData { 
  String? token;
  String? name;
  bool? hasMedia;
  List<UserMedia>? media = [];
  // List<String>? phone;
  // List<String>? driverFrontLicense;
  // List<String>? iDFront;
  // List<String>? iDBack;
  // List<String>? vehicleFrontLicense;

  UserData.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    name = json['name'];
    hasMedia = json['has_media'];
    if (json['media'] != null) {
      media = <UserMedia>[];
      json['media'].forEach((v) {
        media!.add(UserMedia.fromJson(v));
      });
    }

  }
}

class UserMedia {
  UserMedia.fromJson(Map<String, dynamic> json);
}




class SignupError {
  final bool status;
  final String message;
  final Map<String, List<String>> data;

  SignupError({
    required this.status,
    required this.message,
    required this.data,
  });

  factory SignupError.fromJson(Map<String, dynamic> json) {
    return SignupError(
      status: json['status'],
      message: json['message'],
      data: Map<String, List<String>>.from(json['data']),
    );
  }
}