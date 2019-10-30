import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class FlareDemo extends StatefulWidget {
  @override
  _FlareDemoState createState() => _FlareDemoState();
}

class _FlareDemoState extends State<FlareDemo> {
  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: GestureDetector(
        onTap: () {
          setState(() {
            isOpen = !isOpen;
          });
        },
        child: FlareActor(
          'assets/button-animation.flr',
          animation: isOpen ? 'activate' : 'deactivate'
        )
      )
    );
  }
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     backgroundColor: Color.fromARGB(255, 102, 18, 222),
  //     body: new SampleFlareWidget()
  //     // body: Center(child: Text('Flare Demooooo')),
  //   );
  // }
}


// class SampleFlareWidget extends StatefulWidget {
//   bool isOpen = false;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: (){
//         setState((){
//           isOpen = !isOpen;
//         });
//       },
//       child: FlareActor(
//         'assets/button-animation.flr',
//         animation: isOpen ? 'activate' : 'deactivate'
//       ),
//     );
//   }
// }
