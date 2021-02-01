import 'package:flutter/material.dart';
import 'package:realstate/View/Widgets/Admin/AdminNavigationBar.dart';
import 'package:realstate/View/Widgets/Admin/admin_dashboard_body.dart';
import 'package:realstate/View/Widgets/Agent/AgentNavigationBar.dart';
import 'package:realstate/View/Widgets/Agent/agent_dashboard_body.dart';
import 'package:realstate/View/centered_view.dart';

class AgentPanel extends StatefulWidget {
  final String username;

  AgentPanel({Key key, this.username}) : super(key:key);

  @override
  _AdminPanelState createState() => _AdminPanelState();
}

class _AdminPanelState extends State<AgentPanel> {

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
                  AgentNavigationBar(username: widget.username),
                  // Scrollbar(child:  adminDashboard())
                  agentDashboard()


                ],
              )
          ),],
        ),
      ),
    );
  }
}
