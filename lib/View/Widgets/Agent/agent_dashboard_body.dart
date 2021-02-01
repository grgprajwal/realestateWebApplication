import 'package:flutter/material.dart';
import 'package:realstate/company_constant.dart';

class agentDashboard  extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(40),
      decoration: BoxDecoration(

        color: Colors.white,
        border: Border.all(
          color: agentPanelColor,
          width: 2
        )

      ),
      child:  Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _createCount('Property Count',15),
              _createCount('Owners',15),
              _createCount('Sold',10),
              _createCount('Rented',5),
            ],
          ),
          SizedBox(
            height: 40,
          )
          ,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _createCount('Liked Count',15),Text(''),Text(''),Text('')
            ],
          ),
        ],
      )


    );
  }
}


Widget _createCount(String title, double count){
  return Container(
    height: 150,
    width: 200,
    decoration: BoxDecoration(
      color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(5)),
      border: Border.all(
        color: agentPanelColor,
        width: 5
      ),
        boxShadow: [BoxShadow(
        color: Colors.grey.withOpacity(0.5),
    spreadRadius: 5,
    blurRadius: 7,
    offset: Offset(0, 3),

  )]

    ),
    child: Column(

      children: <Widget>[
        Align(alignment: Alignment.centerLeft, child :
        Padding(padding: EdgeInsets.all(10),child: Text(
          '$title',
          style: new TextStyle(
              fontSize: 20,
              color: agentPanelColor

          ),),),

        ),
        Align(alignment: Alignment.center, child :Text(
            '$count',
          style: new TextStyle(
            fontSize: 60,
              color: agentPanelColor

              // color: Color(0xffff0066)

          ),
        )
        ),
      ]
    ),
  );
}
