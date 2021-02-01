import 'dart:async';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:realstate/Model/Property.dart';
import 'package:realstate/View/Widgets/Agent/AgentNavigationBar.dart';
import 'package:realstate/routing_constants.dart';

import '../../HelperClass.dart';
import '../../company_constant.dart';
import '../centered_view.dart';

class AddProperty extends StatefulWidget {
  @override
  _AddPropertyState createState() => _AddPropertyState();
}

class _AddPropertyState extends State<AddProperty> {
  final _addAgentKey = GlobalKey<FormState>();
  Property _newProperty = Property();
  String dropdownValue = '- Select an option -';
  String statusValue = '- Select an option -';
  File f;



  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context);

    return Scaffold(
        body: SingleChildScrollView(
      child: CenteredView(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: adminPanleColorLight),
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
                    'Add Property',
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
                          SizedBox(
                            width: screenSize.size.width * (0.24),
                            child: TextFormField(
                              inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                              decoration:
                                  InputDecoration(labelText: 'Owner Id'),
                              onSaved: (value) {
                                _newProperty.ownerId = int.parse(value);
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
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text('Status '),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(child: DropdownButtonFormField(
                                      value: statusValue,
                                      items: <String>[
                                        '- Select an option -',
                                        'Active',
                                        'Inactive',
                                        'Leashed'
                                      ].map<DropdownMenuItem<String>>(
                                              (String value) {
                                            return DropdownMenuItem<String>(
                                                value: value, child: Text(value));
                                          }).toList(),
                                      onChanged: (String newValue) {
                                        setState(() {
                                          statusValue = newValue;
                                        });
                                      },
                                      validator: (String value) {
                                        if (value == null ||
                                            value ==
                                                '----- Select an option ------') {
                                          return 'Select a status of the property';
                                        }
                                      },
                                      onSaved: (val) => setState(
                                              () => _newProperty.status = val)))
                                  ,
                                ],
                              )),
                          SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                              width: screenSize.size.width * (0.24),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text('Type '),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(child: DropdownButtonFormField(
                                      value: dropdownValue,
                                      onChanged: (String newValue) {
                                        setState(() {
                                          dropdownValue = newValue;
                                        });
                                        _newProperty.type = newValue;
                                      },
                                      items: <String>[
                                        '- Select an option -',
                                        'Apartment',
                                        'Unit',
                                        'House'
                                      ].map<DropdownMenuItem<String>>(
                                              (String asdf) {
                                            return DropdownMenuItem<String>(
                                                value: asdf, child: Text(asdf));
                                          }).toList(),
                                      validator: (String value) {
                                        if (value == null ||
                                            value ==
                                                '----- Select an option ------') {
                                          return 'Select a type of the property';
                                        }
                                      },
                                      onSaved: (val) => setState(
                                              () => _newProperty.type = val)))
                                  ,
                                ],
                              )),
                          SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: screenSize.size.width * (0.24),
                            child: TextFormField(
                              decoration: InputDecoration(labelText: 'Price'),
                              inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],

                              onSaved: (value) {
                                _newProperty.price = double.parse(value);
                              },
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter the price';
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
                          Container(
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: adminPanleColorLight)),
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
                                    onSaved: (value) {
                                      _newProperty.address.streetName = value;
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
                                      onSaved: (value) {
                                        _newProperty.address.city = value;
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
                                      onSaved: (value) {
                                        _newProperty.address.state = value;
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
                                      onSaved: (value) {
                                        _newProperty.address.postCode = value;
                                      },
                                    )),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: TextFormField(
                                decoration:
                                    InputDecoration(labelText: 'No of bedroom'),
                                // ignore: missing_return
                                    inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],

                                    validator: (value) {
                                  if (value.isEmpty) {
                                    return 'If not any enter 0.';
                                  }
                                },
                                onSaved: (value) {
                                  _newProperty.bedroom = int.parse(value);
                                },
                              )),
                              SizedBox(
                                width: 50,
                              ),
                              Expanded(
                                  child: TextFormField(
                                decoration: InputDecoration(
                                    labelText: 'No of bathroom'),
                                    inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],

                                    // ignore: missing_return
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'If not any enter 0.';
                                  }
                                },
                                onSaved: (value) {
                                  _newProperty.bathroom = int.parse(value);
                                },
                              )),
                              SizedBox(
                                width: 50,
                              ),
                              Expanded(
                                  child: TextFormField(
                                decoration:
                                    InputDecoration(labelText: 'No of garage'),
                                    inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],

                                    // ignore: missing_return
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'If not any enter 0.';
                                  }
                                },
                                onSaved: (value) {
                                  _newProperty.garage = int.parse(value);
                                },
                              )),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: screenSize.size.width,
                            child: TextFormField(
                              keyboardType: TextInputType.multiline,
                              minLines: 15,
                              maxLines: null,
                              decoration: InputDecoration(
                                  labelText: 'Description',
                                  border: OutlineInputBorder()),
                              onSaved: (value) {
                                _newProperty.description = value;
                              },
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter description';
                                }
                              },
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: screenSize.size.width * (0.24),
                            child: RaisedButton(
                              child: Text("Pick images"),
                              onPressed: () async {
                                uploadImage();
                              },
                            )
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
                                if (form.validate()) {
                                  form.save();
                                  //save to db if sucessful move next
                                  HelperClass.popUpDialog(
                                      'Owner Sucessfully added!', context);
                                  Timer(Duration(seconds: 2), () {
                                    Navigator.pushNamed(context, PropertyListPage);
                                  });
                                }
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


  void uploadImage(){
    InputElement uploadInput = FileUploadInputElement()..accept = 'image/*';
    uploadInput.click();
    uploadInput.onChange.listen((event) {
      final file = uploadInput.files.first;
      final reader = FileReader();
      reader.readAsDataUrl(file);
      reader.onLoadEnd.listen((event) {
        f = file;
        print('done');
        print(f.toString());

      });
    });

  }

}
