import 'dart:convert';

import 'package:realstate/Model/MainData.dart';

import 'Address.dart';


Owner ownerFromJson(String str) => Owner.fromJson(json.decode(str));

String ownerToJson(Owner data) => json.encode(data.toJson());

class Owner extends MainData{
  Address address;
  String firstName;
  String middleName;
  String lastName;
  String email;
  String phone;


  Owner({Address address, this.firstName,this.middleName,this.lastName,this.email,this.phone, int Id}):super(id: Id){
    this.address = address == null ? new Address() : address;
  }

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
    Id: json["id"] == null ? null : json["id"],
    phone: json["mobile_no"] == null ? null : json["mobile_no"],
    firstName: json["first_name"] == null ? null : json["first_name"],
    lastName: json["last_name"] == null ? null : json["last_name"],
    middleName: json["middle_name"] == null ? null : json["middle_name"],
    email: json["email"] == null ? null : json["email"],

  );


  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "email": email == null ? null : email,
    "mobile_no": phone == null ? null : phone,
    "first_name": firstName == null ? null : firstName,
    "last_name": lastName == null ? null : lastName,
    "middle_name": middleName == null ? null : middleName,
  };

}