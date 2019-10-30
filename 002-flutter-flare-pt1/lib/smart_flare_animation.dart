import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_controls.dart';
import 'package:flutter/cupertino.dart';

enum AnimationToPlay {
  Activate,
  Deactivate,
  Camera,
  Stats,
  Photo
}

String _getAnimationName(AnimationToPlay animationToPlay){
  switch(animationToPlay){
    case AnimationToPlay.Activate:
      return 'activate';
    case AnimationToPlay.Deactivate:
      return 'deactivate';
    case AnimationToPlay.Camera:
      return 'camera_tapped';
    case AnimationToPlay.Stats:
      return 'pulse_tapped';
    case AnimationToPlay.Photo:
      return 'image_tapped';
    default:
      return 'deactivate';
  }
}

class SmartFlareAnimation extends StatefulWidget {
  _SmartFlareAnimationState createState() => _SmartFlareAnimationState();
}

class _SmartFlareAnimationState extends State<SmartFlareAnimation> {
  static const double AnimationWidth = 295;
  static const double AnimationHeight = 251;
  // create flare controls
  final FlareControls animationControls = FlareControls();
  bool isOpen = false;
  AnimationToPlay _lastPlayedAnimation;

  void _setAnimationToPlay(AnimationToPlay animation) {
    animationControls.play(_getAnimationName(animation));

    _lastPlayedAnimation = animation;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AnimationWidth,
      height: AnimationHeight,
      child: GestureDetector(
        onTapUp: (tapUpDetails){
          var localTouchPosition = 
              (context.findRenderObject() as RenderBox)
              .globalToLocal(tapUpDetails.globalPosition);
          
          var topHalfTouched = localTouchPosition.dy < AnimationHeight / 2;
          var leftThirdTouched = localTouchPosition.dx < AnimationWidth / 3;
          var rightThirdTouched = localTouchPosition.dx > (AnimationWidth / 3) * 2;
          var middleThirdTouched = !leftThirdTouched && !rightThirdTouched;

          print(localTouchPosition);
          
          if(isOpen && leftThirdTouched && topHalfTouched){
            _setAnimationToPlay(AnimationToPlay.Camera);
            print('cameraZone touched');
          } else if (isOpen && middleThirdTouched && topHalfTouched){
            _setAnimationToPlay(AnimationToPlay.Stats);
            print ('statsZone touched');
          } else if(isOpen && rightThirdTouched && topHalfTouched){
            _setAnimationToPlay(AnimationToPlay.Photo);
            print ('photoZone touched');
          } else if (isOpen && middleThirdTouched && !topHalfTouched){
            _setAnimationToPlay(AnimationToPlay.Deactivate);
            print ('deactivator touched');
            setState(() { isOpen =!isOpen; });
          } else if (!isOpen && middleThirdTouched && !topHalfTouched){
            _setAnimationToPlay(AnimationToPlay.Activate);
            print ('activator touched');
            setState(() { isOpen =!isOpen; });
          }
        },
        child: FlareActor(
          'assets/button-animation.flr',
          controller: animationControls,
          animation: 'deactivate',
        )
      )
    );
  }
}
