import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:realstate/Model/Login.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:   backgroundColor,

        body:
        Form(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(100),
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
                      Text(CompanyName),
                      SizedBox(height: 50,),
                      Expanded(child:TextFormField(

                        decoration: InputDecoration(
                          filled: false,
                          labelText: 'Username',

                        ),
                        textAlign: TextAlign.center,
                        onChanged: (value) {
                          formData.email = value;
                        },
                      ))  ,
                        Expanded (child:TextFormField(
                          decoration: InputDecoration(

                            labelText: 'Password',

                          ),
                          obscureText: true,
                          textAlign: TextAlign.center,
                          onChanged: (value) {
                            formData.password = value;
                          },
                        ) ),
                        FlatButton(
                          child: Text('Sign in'),
                          onPressed: ()=> validateData(),
                        ),
                      Expanded(child : TextButton(onPressed: (){
                        Navigator.pushNamed(context, ForgetPasswordPage );
                      },
                        child: Text('Forgot Password?', style: TextStyle(color: Colors.black),
                        ),
                      ))
                    ])
              )
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

  void validateData(){

    if(formData.email == 'admin' && formData.password == 'admin'){
      // _showDialog('login successful');
      Navigator.pushNamed(context, AdminHomePage, arguments: '${formData.email}' );
    }else if(formData.email== 'prajwal' && formData.password =='admin'){
      Navigator.pushNamed(context, AgentHomePage, arguments: '${formData.email}' );

    }
    else{
      _showDialog('Incorrect email or password');
    }
  }
}
