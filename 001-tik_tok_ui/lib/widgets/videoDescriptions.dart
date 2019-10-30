import 'package:flutter/material.dart';

Widget get videoDescriptions => Expanded(
  child: Container(
    height: 70,
    padding: EdgeInsets.only(left: 20),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('@tsubasaK111', style: TextStyle(fontWeight: FontWeight.bold)),
        Text("wait wat that's way cool"),
        Row(children: <Widget>[
          Icon(Icons.comment, size: 10),
          Text("Parking at LeJays' Dining",
            style: TextStyle(
              fontSize: 12,
              fontStyle: FontStyle.italic
            )
          )
        ])
      ],
      // children: List<Widget>.generate(10, (i) => videoDescriptionLine),
    )
  )
);

Widget get videoDescriptionLine => Container(
  height: 10,
  color: Colors.grey,
  margin: EdgeInsets.only(top: 5),
);
