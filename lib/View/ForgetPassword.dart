import 'package:flutter/material.dart';
import 'package:realstate/View/centered_view.dart';
import 'package:realstate/routing_constants.dart';

class ForgetPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context);
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(100),
        width: screenSize.size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              child: ElevatedButton.icon(
                icon: const Icon(Icons.home, size: 40),
                label: Text('ARL'),
                onPressed: () {
                  Navigator.pushNamed(context, LoginHomePage);
                },
              ),
            ),
            Container(
              color: Colors.blueAccent,
              height: 100,
              width: screenSize.size.width,
              padding:
                  EdgeInsetsDirectional.only(start: 20, top: 40, bottom: 5),
              child: Text(
                'Forgot Password',
                style: TextStyle(fontSize: 40),
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Container(
              height: 250,
              width: screenSize.size.width,
              color: Colors.white10,
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Enter your email',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          // border: InputBorder.null,
                          hintText: 'email@address.com'),
                    ),
                  ),
                  SizedBox(
                      height: 50,
                      width: screenSize.size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            child: Text('Submit'),
                            onPressed: () {
                              Navigator.pushNamed(context, AuthCodeValidator);
                            },
                          ),
                          ElevatedButton(
                            child: Text('Back'),
                            onPressed: () {
                              Navigator.pushNamed(context, LoginHomePage);
                            },
                          ),
                        ],
                      ))
                ],
              ),
            )
          ],
        ),
      ),
      backgroundColor: Colors.white12,
    );
  }
}

class AuthCodeValidation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context);
    return Scaffold(
      body: Container(

        padding: EdgeInsets.all(100),
        child: Container(
          width: screenSize.size.width,
          // color: Colors.blueAccent,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [SizedBox(
              child: ElevatedButton.icon(
                icon: const Icon(Icons.home, size: 40),
                label: Text('ARL'),
                onPressed: () {
                  Navigator.pushNamed(context, LoginHomePage);
                },
              ),
            ),
              Container(
                color: Colors.blueAccent,
                height: 100,
                width: screenSize.size.width,
                padding:
                EdgeInsetsDirectional.only(start: 20, top: 40, bottom: 5),
                child: Text(
                  'Verification',
                  style: TextStyle(fontSize: 40),
                ),
              ),
              SizedBox(
                height: 60,
              ),
              SizedBox(
                width: screenSize.size.width * .5,
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: TextField( decoration: InputDecoration(
                        hintText: 'Verification Code'
                      ),),
                    )
                  ],
                ),
              ),
              SizedBox(
                height:  50,
              ),
              SizedBox(
                  height: 50,
                  width: screenSize.size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        child: Text('Verify'),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> NewPassword()));
                        },
                      ),
                      ElevatedButton(
                        child: Text('Back'),
                        onPressed: () {
                          Navigator.pushNamed(context, ForgetPasswordPage);
                        },
                      ),
                    ],
                  ))

            ],
          ),
        ),
      ),
    );
  }
}


class NewPassword extends StatefulWidget {
  @override
  _NewPasswordState createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {

  String password1 ='';
  String password2 ='';


  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context);

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(100),
        width: screenSize.size.width,
        child: CenteredView(child:  Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              child: ElevatedButton.icon(
                icon: const Icon(Icons.home, size: 40),
                label: Text('ARL'),
                onPressed: () {
                  Navigator.pushNamed(context, LoginHomePage);
                },
              ),
            ),
            Container(
              color: Colors.blueAccent,
              height: 100,
              width: screenSize.size.width,
              padding:
              EdgeInsetsDirectional.only(start: 20, top: 40, bottom: 5),
              child: Text(
                'New Password',
                style: TextStyle(fontSize: 40),
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Container(
              height: 250,
              width: screenSize.size.width,
              color: Colors.white10,
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: 'enter new password'),
                      onChanged: (value){
                        password1 = value;
                      },
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: 'reenter new password'),
                      onChanged: (value){
                        password2 = value;
                      },
                    ),
                  ),
                  SizedBox(
                      height: 50,
                      width: screenSize.size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            child: Text('Submit'),
                            onPressed: () {
                              if(password1 == password2 ){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => PasswordChangeMessage()));
                              }else{
                                showDialog(
                                  context: context,
                                  child: AlertDialog(
                                    title: Text('Password do not match. Please type again!'),
                                    actions: [
                                      FlatButton(
                                        child: Text('OK'),
                                        onPressed: () => Navigator.of(context).pop(),
                                      ),
                                    ],
                                  ),
                                );
                              }
                            },
                          ),
                          ElevatedButton(
                            child: Text('Back'),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ))
                ],
              ),
            )
          ],
        ),)
      ),
      backgroundColor: Colors.white12,
    );
  }
}


class PasswordChangeMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context);

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(100),
        width: screenSize.size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              child: ElevatedButton.icon(
                icon: const Icon(Icons.home, size: 40),
                label: Text('ARL'),
                onPressed: () {
                  Navigator.pushNamed(context, LoginHomePage);
                },
              ),
            ),
            Container(
              color: Colors.blueAccent,
              height: 300,
              width: screenSize.size.width,
              padding:
              EdgeInsetsDirectional.only(start: 20, top: 40, bottom: 5),
              child: Text(
                'Congratulation! \nPassword Changed Successfully',
                style: TextStyle(fontSize: 40),
              ),
            ),
          ],
        ),
      ),
    );
  }
}







