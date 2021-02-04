import 'package:flutter/material.dart';
import 'package:realstate/Utility/realestate_preferences.dart';
import 'package:realstate/View/Widgets/Admin/AdminNavigationBar.dart';
import 'package:realstate/View/Widgets/Admin/admin_dashboard_body.dart';
import 'package:realstate/View/centered_view.dart';

class AdminPanel extends StatefulWidget {
  final String username;

   AdminPanel({Key key, this.username}) : super(key:key);

  @override
  _AdminPanelState createState() => _AdminPanelState();
}

class _AdminPanelState extends State<AdminPanel> {

  String _username;

  _AdminPanelState(){
    _getUsername().then((val) => setState(() {
      _username = val;
    }));

  }

  Future<String> _getUsername() async {
    return await RealEstatePreferences.getUserName();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff2f2f2),
      body:
      Scrollbar(
        child: ListView(
          restorationId: 'bodyScroll',
          children: [CenteredView(
              child: Column(
                children: <Widget>[
                  AdminNavigationBar(username: _username),
                  // Scrollbar(child:  adminDashboard())
                  adminDashboard()


                ],
              )
          ),],
        ),
      ),
    );
  }
}
