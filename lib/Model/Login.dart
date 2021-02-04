
import 'package:json_annotation/json_annotation.dart';
import 'package:http/http.dart' as http;
import 'package:realstate/Model/MainData.dart';


@JsonSerializable()
class Login extends MainData{
  String email;
  String password;
  String role;
  String token;
  bool isVerifited;
  String firstName;

  Login({this.email, this.password , this.role, this.token, this.isVerifited, int  id, int errorCode, String errorMessage,this.firstName}): super(id: id, errorCode: errorCode, errorMessage:  errorMessage);

  factory Login.fromJson(Map<String, dynamic> json) =>
      _$LoginFromJson(json);

  Map<String, dynamic> toJson() => _$LoginToJson(this);
}

Login _$LoginFromJson(Map<String, dynamic> json) {
  return Login(
    id: json["id"] == null ? null : json["id"],
    email: json["email"] == null ? null : json["email"],
    role: json["role"] == null ? null : json["role"],
    token: json["token"] == null ? null : json["token"],
    isVerifited: json["is_login_verified"] == null ? null : json["is_login_verified"],
    firstName: json["first_name"] == null?null: json["first_name"],
  );
}

Map<String, dynamic> _$LoginToJson(Login instance) => <String, dynamic>{
  'email': instance.email,
  'password': instance.password,
};