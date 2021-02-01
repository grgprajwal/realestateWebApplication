import 'package:flutter/material.dart';

class adminDashboard  extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(40),
      decoration: BoxDecoration(

        color: Colors.white,
        border: Border.all(
          color: Color(0xfff5ccff),
          width: 2
        )

      ),
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _createCount('Agents',15),
          _createCount('Customers',50),
          _createCount('Properties',20),
          _createCount('Flagged',5),
        ],
      ),


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
        color: Color(0xffb800e6),
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
              color: Color(0xffb800e6)

          ),),),

        ),
        Align(alignment: Alignment.center, child :Text(
            '$count',
          style: new TextStyle(
            fontSize: 60,
              color: Color(0xffb800e6)

              // color: Color(0xffff0066)

          ),
        )
        ),
      ]
    ),
  );
}
