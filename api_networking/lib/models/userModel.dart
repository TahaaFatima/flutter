import 'package:api_networking/models/adressModel.dart';

class UserModel {
  int id;
  String name, username, email;
  AddressModel address;

  UserModel({this.id, this.name, this.username, this.email, this.address});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json['id'],
        name: json['name'],
        username: json['username'],
        email: json['email'],
        address: AddressModel.fromJson(json["address"]));
  }
}
