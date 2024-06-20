class ProfileModel {
  Data? data;
  int? error;
  String? massage;

  ProfileModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ?  Data.fromJson(json['data']) : null;
    error = json['error'];
    massage = json['massage'];
  }


}

class Data {
  User? user;


  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ?  User.fromJson(json['user']) : null;
  }


}

class User {
  int? id;
  String? name;
  String? email;
  Null? avatar;


  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    avatar = json['avatar'];
  }


}