import 'package:flutter/material.dart';
import 'package:realstate/routing_constants.dart';
import 'View/LoginScreen.dart';
import 'router.dart' as router;


void main(){
  runApp(RealState());
}

class RealState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Agent Based Real State',
      onGenerateRoute: router.generateRoute,
      // initialRoute: LoginHomePage,
      // initialRoute: AdminHomePage,
      // initialRoute: PropertyListPage,

      // initialRoute: OwnerListPage,

      // initialRoute: ForgetPasswordPage,

      initialRoute: AgentHomePage,

    );
  }
}
