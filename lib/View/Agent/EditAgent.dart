import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:realstate/HelperClass.dart';
import 'package:realstate/Model/User.dart';
import 'package:realstate/View/Widgets/Admin/AdminNavigationBar.dart';
import 'package:realstate/View/centered_view.dart';



import '../../TestFile.dart';
import '../../routing_constants.dart';

class EditAgent extends StatefulWidget {
  int agentId ;

  EditAgent({Key key, this.agentId}): super(key: key);

  @override
  _EditAgentState createState() => _EditAgentState();
}

class _EditAgentState extends State<EditAgent> {
  final _addAgentKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context);
    User _newUser = TestFile.getTestUsers()[widget.agentId];

    return Scaffold(

      body: SingleChildScrollView(
        child: CenteredView(
          child: Container(
        width: screenSize.size.width * 0.8,
        color: Colors.white,
            child: Container(
              width: screenSize.size.width * 0.8,
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AdminNavigationBar(username: 'admin'),
                  Padding(
                    padding: EdgeInsets.fromLTRB(50, 60, 50, 0),
                    child: SizedBox(
                      height: 80,
                      child: Text(
                        'Edit Agent',
                        style: TextStyle(fontSize: 26),
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Container(
                      child: Form(
                        key: _addAgentKey,
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black)),
                          padding: EdgeInsets.all(20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                      child: TextFormField(
                                        initialValue: _newUser.firstName,
                                        decoration: InputDecoration(labelText: 'First Name'),
                                        // ignore: missing_return
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return 'Please enter your first name';
                                          }
                                        },
                                        onSaved: (value){
                                          _newUser.firstName = value;
                                        },
                                      )),
                                  SizedBox(
                                    width: 50,
                                  ),
                                  Expanded(
                                      child: TextFormField(
                                        initialValue: _newUser.middleName,
                                        decoration:
                                        InputDecoration(labelText: 'Middle Name'),
                                        onSaved: (value){
                                          _newUser.middleName = value;
                                        },
                                      )),
                                  SizedBox(
                                    width: 50,
                                  ),
                                  Expanded(
                                      child: TextFormField(
                                        initialValue: _newUser.lastName,

                                        decoration:
                                        InputDecoration(labelText: 'Last Name'),
                                        onSaved: (value){
                                          _newUser.lastName = value;
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
                                  initialValue: _newUser.email,

                                  decoration: InputDecoration(labelText: 'Email'),
                                  onSaved: (value){
                                    _newUser.email = value;
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
                                width: screenSize.size.width * (0.24),
                                child: TextFormField(
                                  initialValue: _newUser.password,

                                  decoration:
                                  InputDecoration(labelText: 'Password'),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please enter password';
                                    }
                                  },
                                  onSaved: (value){
                                    _newUser.password = value;
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                width: screenSize.size.width * (0.24),
                                child: TextFormField(
                                  initialValue: _newUser.mobile,

                                  decoration:
                                  InputDecoration(labelText: 'Contact No'),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please enter your contact no';
                                    }
                                  },
                                  onSaved: (value){
                                    _newUser.mobile = value;
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 60,
                              ),
                              Container(
                                padding: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Address 1'),
                                    SizedBox(
                                      width: screenSize.size.width,
                                      child: TextFormField(
                                        initialValue: _newUser.address1.streetName,

                                        decoration:
                                        InputDecoration(labelText: 'Address'),
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return 'Please enter your address';
                                          }
                                        },
                                        onSaved: (value){
                                          _newUser.address1.streetName = value;
                                        },
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                            child: TextFormField(
                                              initialValue: _newUser.address1.city,

                                              decoration:
                                              InputDecoration(labelText: 'City'),
                                              validator: (value) {
                                                if (value.isEmpty) {
                                                  return 'Please enter city name';
                                                }
                                              },
                                              onSaved: (value){
                                                _newUser.address1.city = value;
                                              },
                                            )),
                                        SizedBox(
                                          width: 50,
                                        ),
                                        Expanded(
                                            child: TextFormField(
                                              initialValue: _newUser.address1.state,

                                              decoration:
                                              InputDecoration(labelText: 'State'),
                                              validator: (value) {
                                                if (value.isEmpty) {
                                                  return 'Please enter state';
                                                }
                                              },
                                              onSaved: (value){
                                                _newUser.address1.state = value;
                                              },
                                            )),
                                        SizedBox(
                                          width: 50,
                                        ),
                                        Expanded(
                                            child: TextFormField(
                                              initialValue: _newUser.address1.postCode,

                                              decoration: InputDecoration(
                                                  labelText: 'Post Code'),
                                              validator: (value) {
                                                if (value.isEmpty) {
                                                  return 'Please enter post codes';
                                                }
                                              },
                                              onSaved: (value){
                                                _newUser.address1.postCode = value;
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
                              Container(
                                padding: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Address 2'),
                                    SizedBox(
                                      width: screenSize.size.width * .5,
                                      child: TextFormField(
                                        initialValue: _newUser.address2.streetName,

                                        decoration:
                                        InputDecoration(labelText: 'Address'),
                                        onSaved: (value){
                                          _newUser.address2.streetName = value;
                                        },
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                            child: TextFormField(
                                              initialValue: _newUser.address2.city,
                                              decoration:
                                              InputDecoration(labelText: 'City'),
                                              onSaved: (value){
                                                _newUser.address2.city = value;
                                              },
                                            )),
                                        SizedBox(
                                          width: 50,
                                        ),
                                        Expanded(
                                            child: TextFormField(
                                              initialValue: _newUser.address2.state,

                                              decoration:
                                              InputDecoration(labelText: 'State'),
                                              onSaved: (value){
                                                _newUser.address2.state = value;
                                              },
                                            )),
                                        SizedBox(
                                          width: 50,
                                        ),
                                        Expanded(
                                            child: TextFormField(
                                              initialValue: _newUser.address2.postCode,

                                              decoration: InputDecoration(
                                                  labelText: 'Post Code'),
                                              onSaved: (value){
                                                _newUser.address2.postCode = value;
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
                              Container(
                                padding: EdgeInsets.all(10),
                                child: RaisedButton(
                                  child: Text('Submit'),
                                  onPressed: () {
                                    final form = _addAgentKey.currentState;
                                    if(form.validate()){
                                      form.save();
                                      HelperClass.popUpDialog('Sucessfully updated!',context);
                                      Timer(Duration(seconds: 2), () {
                                        Navigator.pushNamed(context, AgentListPage);
                                      });

                                    }
                                    print(_newUser.firstName.toString());

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
        ),
      ),
    );
  }
}
