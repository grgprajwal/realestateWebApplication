import 'package:flutter/material.dart';
import 'package:realstate/View/AdminPanel.dart';
import 'package:realstate/View/Owners/OwnerModule.dart';
import 'package:realstate/routing_constants.dart';

import 'View/Agent/AddAgent.dart';
import 'View/Agent/AgentModule.dart';
import 'View/Agent/EditAgent.dart';
import 'View/AgentPanel.dart';
import 'View/LoginScreen.dart';
import 'View/ForgetPassword.dart';
import 'View/Owners/AddOwner.dart';
import 'View/Owners/EditOwner.dart';
import 'View/Property/AddProperty.dart';
import 'View/Property/PropertyModule.dart';

Route<dynamic> generateRoute(RouteSettings settings){
 switch(settings.name){
   case LoginHomePage:
     return MaterialPageRoute(builder: (context)=> LoginPage());
   case AdminHomePage:
     {
       var username = settings.arguments;
       return MaterialPageRoute(
           builder: (context) => AdminPanel(username: username));
     }
   case AgentHomePage:
     {
       var username = settings.arguments;
       return MaterialPageRoute(builder: (context) => AgentPanel(username: username));
     }
   case ForgetPasswordPage:{
     return MaterialPageRoute(builder: (context) => ForgetPassword());
   }
   case AuthCodeValidator: {
     return MaterialPageRoute(builder: (context) => AuthCodeValidation());

   }
   case AgentListPage: {
     return MaterialPageRoute(builder: (context) => AgentList());
   }
   case AddAgentPage:{
     return MaterialPageRoute(builder: (context) => AddAgent());
   }
   case EditAgentPage:{
     var agentid = settings.arguments;
     return MaterialPageRoute(builder: (context) => EditAgent(agentId : agentid));
   }
   case PropertyListPage:{
     return MaterialPageRoute(builder: (context) => PropertyList());
   }
   case AddPropertyPage:{
     return MaterialPageRoute(builder: (context) => AddProperty());
   }
   case OwnerListPage:{
     return MaterialPageRoute(builder: (context) => OwnerList());
   }
   case AddOwnerPage:{
     return MaterialPageRoute(builder: (context) => AddOwner());
   }
   case EditOwnerPage:{
     var ownerid = settings.arguments;

     return MaterialPageRoute(builder: (context) => EditOwner(ownerId : ownerid));
   }
   default:
     return MaterialPageRoute(builder: (context)=> LoginPage());

 }
}

