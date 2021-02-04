import 'dart:convert';

import 'package:realstate/Model/Address.dart';
import 'package:realstate/Model/MainData.dart';


List<User> userListFromJson(String str) => List<User>.from(json.decode(str).map((x) => User.fromJson(x)));
User userFromJson(String str) => User.fromJson(json.decode(str));
String userToJson(User data) => json.encode(data.toJson());




class User extends MainData{

  String email;
  String mobile;
  String password;
  String firstName;
  String middleName;
  String lastName;
  DateTime createdDate;
  String status;
  bool isVerified;
  String role;
  DateTime deletedAt;
  bool isSubscribed;
  Address address1;
  Address address2;





  User({int Id, String email, String mobile, String password, String firstName, String middleName, String lastName,
    DateTime createdDate, String status, bool isVerified, String role, Address address1, Address address2}) : super(id: Id){


    this.email = email;
    this.mobile = mobile;
    this.password = password;
    this.firstName = firstName;
    this.middleName = middleName;
    this.lastName = lastName;
    this.createdDate = createdDate;
    this.status = status;
    this.isVerified = isVerified;
    this.role = role;
    this.address1 = address1 == null ? new Address(): address1 ;
    this.address2 = address2 == null ? new Address(): address2;

  }

  factory User.fromJson(Map<String, dynamic> json) => User(
    Id: json["id"] == null ? null : json["id"],
    email: json["email"] == null ? null : json["email"],
    mobile: json["mobile_no"] == null ? null : json["mobile_no"],
    firstName: json["first_name"] == null ? null : json["first_name"],
    lastName: json["last_name"] == null ? null : json["last_name"],
    middleName: json["middle_name"] == null ? null : json["middle_name"],
    password: json["hashpassword"] == null ? null : json["hashpassword"],
    status: json["status"] == null ? null : json["status"],
    isVerified: json["is_login_verified"] == null ? null : json["is_login_verified"],
    role: json["role"] == null ? null : json["role"],
  );


  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "email": email == null ? null : email,
    "mobile_no": mobile == null ? null : mobile,
    "first_name": firstName == null ? null : firstName,
    "last_name": lastName == null ? null : lastName,
    "middle_name": middleName == null ? null : middleName,
    "hashpassword": password == null ? null : password,
    "status": status == null ? null : status,
    "is_login_verified": isVerified == null ? null : isVerified,
    "role": role == null ? null : role,
  };



}