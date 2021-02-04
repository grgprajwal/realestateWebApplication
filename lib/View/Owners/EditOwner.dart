import 'dart:async';

import 'package:flutter/material.dart';
import 'package:realstate/Model/Owner.dart';
import 'package:realstate/Utility/realestate_preferences.dart';
import 'package:realstate/View/Widgets/Agent/AgentNavigationBar.dart';
import 'package:realstate/routing_constants.dart';

import '../../HelperClass.dart';
import '../../TestFile.dart';
import '../centered_view.dart';

class EditOwner extends StatefulWidget {
  int ownerId ;

  EditOwner({Key key, this.ownerId}): super(key: key);

  @override
  _EditOwnerState createState() => _EditOwnerState();
}

class _EditOwnerState extends State<EditOwner> {

  final _addAgentKey = GlobalKey<FormState>();

  String _username;

  _EditOwnerState(){
    _getUsername().then((val) => setState(() {
      _username = val;
    }));

  }

  Future<String> _getUsername() async {
    return await RealEstatePreferences.getUserName();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context);
    Owner _newOwner = TestFile.getOwners1()[widget.ownerId];

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
                  AgentNavigationBar(username:_username),
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
                                        initialValue: _newOwner.firstName,
                                        decoration: InputDecoration(labelText: 'First Name'),
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
                                        initialValue: _newOwner.middleName,
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
                                        initialValue: _newOwner.lastName,

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
                                  initialValue: _newOwner.email,

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
                                width: screenSize.size.width * (0.24),
                                child: TextFormField(
                                  initialValue: _newOwner.phone,

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
                                    border: Border.all(color: Colors.black)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Address 1'),
                                    SizedBox(
                                      width: screenSize.size.width,
                                      child: TextFormField(
                                        initialValue: _newOwner.address.streetName,

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
                                              initialValue: _newOwner.address.city,

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
                                              initialValue: _newOwner.address.state,

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
                                              initialValue: _newOwner.address.postCode,

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
        ),
      ),
    );
  }
}