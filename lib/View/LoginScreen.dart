import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:realstate/HelperClass.dart';
import 'package:realstate/Model/Login.dart';
import 'package:realstate/Repository/LoginService.dart';
import 'package:realstate/Utility/realestate_preferences.dart';
import 'package:realstate/company_constant.dart';
import 'package:realstate/routing_constants.dart';

import 'AdminPanel.dart';

class LoginPage extends StatefulWidget {
  final http.Client httpClient;

  LoginPage({
    this.httpClient,
  });

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Login formData = Login();
  LoginService _loginService = new LoginService();
  final _loginKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        body: Form(
          key: _loginKey,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  padding: EdgeInsets.fromLTRB(100, 40, 100, 40),
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius:
                        const BorderRadius.all(const Radius.circular(8)),
                    border: Border.all(color: Colors.black),
                  ),
                  height: 400,
                  width: 600,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: 100,
                          width: 100,
                          child: Image.asset('images/logo.png'),
                        ),
                        // Text(CompanyName),
                        SizedBox(
                          height: 50,
                        ),
                        Expanded(
                            child: TextFormField(
                          decoration: InputDecoration(
                            filled: false,
                            labelText: 'Username',
                          ),
                          textAlign: TextAlign.center,
                          validator: (value){
                            if(value == null || value ==''){
                              return 'Enter username';
                            }
                          },
                          onChanged: (value) {
                            formData.email = value;
                          },
                        )),
                        Expanded(
                            child: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Password',
                          ),
                          obscureText: true,
                          textAlign: TextAlign.center,
                              validator: (value){
                                if(value == null || value ==''){
                                  return 'Enter password';
                                }
                              },
                          onChanged: (value) {
                            formData.password = value;
                          },
                        )),
                        FlatButton(
                          child: Text('Sign in'),
                          onPressed: () {
                            final form = _loginKey.currentState;
                            if(form.validate()){
                              validateData();

                            }
                          } ,
                        ),
                        Expanded(
                            child: TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, ForgetPasswordPage);
                          },
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(color: Colors.black),
                          ),
                        ))
                      ]))
            ],
          )
        ])));
  }

  void _showDialog(String message) {
    showDialog(
      context: context,
      child: AlertDialog(
        title: Text(message),
        actions: [
          FlatButton(
            child: Text('OK'),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }

  void validateData() async {
    Login response = await _loginService.validateLogin(formData);

    if(response!=null){
      if(response.errorCode == 1){

        if(response.role.toUpperCase() == "ADMIN"){
          Navigator.pushNamed(context, AdminHomePage,
              arguments: '${response.firstName}');
          RealEstatePreferences.setUser(response.email);
          RealEstatePreferences.setToken(response.token);
          RealEstatePreferences.setUserId(response.id);
          RealEstatePreferences.setUserName(response.firstName);

        }else if(response.role.toUpperCase() == "AGENT"){
          Navigator.pushNamed(context, AgentHomePage,
              arguments: '${formData.firstName}');
          RealEstatePreferences.setUser(response.email);
          RealEstatePreferences.setToken(response.token);
          RealEstatePreferences.setUserId(response.id);
          RealEstatePreferences.setUserName(response.firstName);

        }else{
          _showDialog('Invalid email or password');

        }


      }else if(response.errorCode ==2){
        _showDialog('Invalid email or password');
      }
    }

    print(' ${response.errorCode} and the msg is ${response.errorMessage}');

  }
}
