import 'package:flutter/material.dart';
import 'package:realstate/Controller/hover_extension.dart';
import 'package:realstate/Utility/realestate_preferences.dart';

import '../../../company_constant.dart';
import '../../../routing_constants.dart';

class AgentNavigationBar extends StatelessWidget {
  final String username;



  AgentNavigationBar({Key key, this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double textSize = 25;

    return Container(


      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        color: agentPanelColor,

      ),
      child: Column(
        children: <Widget>[
          Container(
            height: 140,
            padding: EdgeInsets.all(20),
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
                color: agentPanelColor,
                borderRadius: BorderRadius.all(Radius.circular(5))

            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center              ,
              children: <Widget>[
                Text(CompanyName,
                  textAlign: TextAlign.left,
                  textScaleFactor: 2,),

                TextButton.icon(
                  icon: const Icon(Icons.supervised_user_circle, size: 35, color: Colors.black,),
                  label: Text('$username', style: TextStyle(color: Colors.black),),
                  onPressed: (){},

                ),
                TextButton(onPressed: (){
                  RealEstatePreferences.clearAllPreferences();

                  Navigator.pushNamed(context, LoginHomePage );
                },
                  child: Text('Logout', style: TextStyle(color: Colors.black),
                  ),
                ),

              ],
            ),
          ),
          Container(
            height: 20,
            color: Color(0xffff9999),
          ),
          Container(
            // color: Colors.red,
            height: 60,
            padding: EdgeInsets.all(10),
            color: agentPanelColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton(
                  child: Text('HOME' , style: TextStyle(fontSize: textSize,color: Colors.black)),
                  onPressed: (){
                    Navigator.pushNamed(context, AgentHomePage, arguments: 'prajwal');
                  },
                ),
                TextButton(
                  child: Text('PROFILE' , style: TextStyle(fontSize: textSize, color: Colors.black)),
                  onPressed: (){},
                ),
                PopupMenuButton(
                  padding: EdgeInsets.zero,
                  initialValue: 0,
                  child: Text('PROPERTY', style: TextStyle(fontSize: textSize, color: Colors.black)),
                  itemBuilder: (context) =><PopupMenuItem>[
                    PopupMenuItem(child: TextButton(
                      child: Text('Property List' , style: TextStyle(fontSize: textSize, color: Colors.black)),
                      onPressed: (){
                        Navigator.pushNamed(context, PropertyListPage);
                      },
                    )),
                    PopupMenuItem(child: TextButton(
                      child: Text('Property Owners' , style: TextStyle(fontSize: textSize, color: Colors.black)),
                      onPressed: (){
                        Navigator.pushNamed(context, OwnerListPage);

                      },
                    )),
                    PopupMenuItem(child: TextButton(
                      child: Text('Status Update' , style: TextStyle(fontSize: textSize, color: Colors.black)),
                      onPressed: (){
                        Navigator.pushNamed(context, PropertyListPage);
                      },
                    )),
                    PopupMenuItem(child: TextButton(
                      child: Text('Liked Property' , style: TextStyle(fontSize: textSize, color: Colors.black)),
                      onPressed: (){},
                    )),


                  ],
                )
                ,

                TextButton(
                  child: Text('REPORT' , style: TextStyle(fontSize: textSize,color: Colors.black)),
                  onPressed: (){},
                ),
              ],
            ),
          ),
          // Container(
          //   height: 20,
          //   color: Color(0xfff5ccff),
          // ),

        ],
      ),
    );
  }
}



class _NavBarItem extends StatelessWidget {
  final String title;

  const _NavBarItem(this.title);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
