import 'package:flutter/material.dart';
import 'package:tik_tok_ui/widgets/topZone.dart';

import 'widgets/bottomNavigation.dart';
import 'widgets/toolBar.dart';
import 'widgets/videoDescriptions.dart';

/// Empty page widget fo developers that want to follow along with the tutorial
/// on breaking down and implementing the Tik Tok UI (BLOG_LINK)
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          topZone,
          Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  videoDescriptions,
                  toolBar,
                ],
          )),
          new BottomNavigation(),
        ],
      ),
    );
  }
}

// Widget topZone = Container(
//     height: 100.0,
//     padding: EdgeInsets.only(bottom: 15),
//     color: Colors.indigo
// );


