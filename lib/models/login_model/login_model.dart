class LoginModel {
  late bool success;
  late String message;
  UserData? data;

  LoginModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = (json['data'] != null ? UserData.fromJson(json['data']) : null);
  }
}

class UserData {
  String? token;
  String? name;
  bool? hasMedia;
  List<UserMedia>? media = [];

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