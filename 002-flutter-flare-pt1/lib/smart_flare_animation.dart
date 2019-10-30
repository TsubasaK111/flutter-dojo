import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';

class SmartFlareAnimation extends StatefulWidget {
  _SmartFlareAnimationState createState() => _SmartFlareAnimationState();
}

class _SmartFlareAnimationState extends State<SmartFlareAnimation> {
  static const double AnimationWidth = 295;
  static const double AnimationHeight = 251;
  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AnimationWidth,
      height: AnimationHeight,
      child: GestureDetector(
        onTap: (){
          setState(() {
            isOpen =!isOpen;
          });
        },
        child: FlareActor(
          'assets/button-animation.flr',
          animation: isOpen ? 'activate' : 'deactivate',
        )
      )
    );
  }
}
