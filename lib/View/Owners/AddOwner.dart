import 'dart:async';

import 'package:flutter/material.dart';
import 'package:realstate/Model/Owner.dart';
import 'package:realstate/View/Widgets/Admin/AdminNavigationBar.dart';
import 'package:realstate/View/Widgets/Agent/AgentNavigationBar.dart';
import 'package:realstate/routing_constants.dart';

import '../../HelperClass.dart';
import '../../company_constant.dart';
import '../centered_view.dart';

class AddOwner extends StatefulWidget {
  @override
  _AddOwnerState createState() => _AddOwnerState();
}

class _AddOwnerState extends State<AddOwner> {
  final _addAgentKey = GlobalKey<FormState>();
  Owner _newOwner = Owner();


  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context);

    return Scaffold(
        body: SingleChildScrollView(
          child: CenteredView(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color : adminPanleColorLight),
                color: backgroundColor,
              ),
              width: screenSize.size.width * 0.8,

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AgentNavigationBar(username: 'prajwal'),
                  Padding(
                    padding: EdgeInsets.fromLTRB(50, 60, 50, 0),
                    child: SizedBox(
                      height: 80,
                      child: Text(
                        'Add Agent',
                        style: TextStyle(fontSize: 26),
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Container(
                      color: Colors.white,
                      child: Form(
                        key: _addAgentKey,
                        child: Container(
                          decoration: BoxDecoration(
                            // border: Border.all(color: adminPanleColorLight)
                          ),
                          padding: EdgeInsets.all(20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                      child: TextFormField(
                                        decoration:
                                        InputDecoration(labelText: 'First Name'),
                                        // ignore: missing_return
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return 'Please enter your first name';
                                          }
                                        },
                                        onSaved: (value){
                                          _newOwner.firstName = value;
                                        },
                                      )),
                                  SizedBox(
                                    width: 50,
                                  ),
                                  Expanded(
                                      child: TextFormField(
                                        decoration:
                                        InputDecoration(labelText: 'Middle Name'),
                                        onSaved: (value){
                                          _newOwner.middleName = value;
                                        },
                                      )),
                                  SizedBox(
                                    width: 50,
                                  ),
                                  Expanded(
                                      child: TextFormField(
                                        decoration:
                                        InputDecoration(labelText: 'Last Name'),
                                        onSaved: (value){
                                          _newOwner.lastName = value;
                                        },
                                      )),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                width: screenSize.size.width * (0.24),
                                child: TextFormField(
                                  decoration: InputDecoration(labelText: 'Email'),
                                  onSaved: (value){
                                    _newOwner.email = value;
                                  },
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please enter your email';
                                    }
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                width: screenSize.size.width * (0.24),
                                child: TextFormField(
                                  decoration:
                                  InputDecoration(labelText: 'Contact No'),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please enter your contact no';
                                    }
                                  },
                                  onSaved: (value){
                                    _newOwner.phone = value;
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 60,
                              ),
                              Container(
                                padding: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                    border: Border.all(color: adminPanleColorLight)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Address'),
                                    SizedBox(
                                      width: screenSize.size.width,
                                      child: TextFormField(
                                        decoration:
                                        InputDecoration(labelText: 'Address'),
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return 'Please enter your address';
                                          }
                                        },
                                        onSaved: (value){
                                          _newOwner.address.streetName = value;
                                        },
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                            child: TextFormField(
                                              decoration:
                                              InputDecoration(labelText: 'City'),
                                              validator: (value) {
                                                if (value.isEmpty) {
                                                  return 'Please enter city name';
                                                }
                                              },
                                              onSaved: (value){
                                                _newOwner.address.city = value;
                                              },
                                            )),
                                        SizedBox(
                                          width: 50,
                                        ),
                                        Expanded(
                                            child: TextFormField(
                                              decoration:
                                              InputDecoration(labelText: 'State'),
                                              validator: (value) {
                                                if (value.isEmpty) {
                                                  return 'Please enter state';
                                                }
                                              },
                                              onSaved: (value){
                                                _newOwner.address.state = value;
                                              },
                                            )),
                                        SizedBox(
                                          width: 50,
                                        ),
                                        Expanded(
                                            child: TextFormField(
                                              decoration: InputDecoration(
                                                  labelText: 'Post Code'),
                                              validator: (value) {
                                                if (value.isEmpty) {
                                                  return 'Please enter post codes';
                                                }
                                              },
                                              onSaved: (value){
                                                _newOwner.address.postCode = value;
                                              },
                                            )),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 60,
                              ),
                              SizedBox(
                                height: 60,
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                child: RaisedButton(
                                  child: Text('Submit'),
                                  onPressed: () {
                                    final form = _addAgentKey.currentState;
                                    if(form.validate()){
                                      form.save();
                                      //save to db if sucessful move next
                                      HelperClass.popUpDialog('Owner Sucessfully added!',context);
                                      Timer(Duration(seconds: 2), () {
                                        Navigator.pushNamed(context, OwnerListPage);
                                      });
                                    }
                                    print(_newOwner.firstName.toString());

                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
