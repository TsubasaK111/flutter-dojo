import 'package:flutter/material.dart';

Widget get topZone => Container(
  height: 100.0,
  padding: EdgeInsets.only(bottom: 15.0),
  alignment: Alignment(0.0, 1.0),
  child: Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text('Following'),
        Container(
          width: 15.0,
        ),
        Text('For you',
          style: TextStyle(
            fontSize: 17.0,
            fontWeight: FontWeight.bold
          )
        )
      ]),
);
