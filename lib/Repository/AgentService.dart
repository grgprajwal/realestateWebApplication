import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:realstate/Model/User.dart';

import 'data_provider.dart';

class AgentService {
  var dio = Dio();

  Future<List<User>> getAllAgents() async{

    List<User> resp;


    Map<String, dynamic> data = {
      'role': 'agent',
    };

    try{

      var response = await dio.get<String>(
          ServicesConstant.baseUrl + '/users',
          queryParameters: data);



      print('im in here service');
      if (response.statusCode == 200) {
        // return Login.fromJson(response.data);

        resp = userListFromJson(response.data.toString());

        return resp;

      }


    }catch(e){
      print(e);
      return resp;

    }



  }



}