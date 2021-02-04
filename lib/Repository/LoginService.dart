import 'package:dio/dio.dart';
import 'package:http/http.dart';
import 'package:realstate/HelperClass.dart';
import 'package:realstate/Model/Login.dart';

import 'data_provider.dart';

class LoginService {
  var dio = Dio();

  Future<Login> validateLogin(Login login) async {
    Map<String, dynamic> data = {
      'email': login.email,
      'password': HelperClass.generateSHA256(login.password)
    };

    try {
      var response = await dio.get<Map<String, dynamic>>(
          ServicesConstant.baseUrl + '/users',
          queryParameters: data);

      if (response.statusCode == 200) {
        // return Login.fromJson(response.data);

        Login resp = Login.fromJson(response.data);
        resp.errorCode = 1;
        return resp;
      }
    } catch (e) {
      print(e);
      Login l =
          new Login(errorCode: 2, errorMessage: 'Invalid Username or Password');
      return l;
    }
  }
}
