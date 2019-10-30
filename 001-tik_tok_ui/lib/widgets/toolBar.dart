
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tik_tok_ui/tik_tok_icons_icons.dart';
// import 'package:cached_network_image/cached_network_image.dart';

// Full dimensions of an action
const double ActionWidgetSize = 60.0;
// The size of the icon showen for Social Actions
const double ActionIconSize = 35.0;
// The size of the share social icon
const double ShareActionIconSize = 25.0;
// The size of the profile image in the follow Action
const double ProfileImageSize = 50.0;
// The size of the plus icon under the profile image in follow action
const double PlusIconSize = 20.0;

Widget toolBar = Container(
  width: 70,
  // color: Colors.red[200],
  margin: EdgeInsets.only(right: 10, bottom: 15),
  child: Column(
    // verticalDirection: VerticalDirection.up,
    mainAxisSize: MainAxisSize.min,
    children: [
      _getFollowAction(),
      _getSocialActiion(icon: TikTokIcons.heart, title: '3.2m'),
      _getSocialActiion(icon: TikTokIcons.chat_bubble, title: 'd'),
      _getSocialActiion(icon: TikTokIcons.reply, title: 'Share', isShare: true),
    ],
  )
);

Widget _getSocialActiion({
  String title,
  IconData icon,
  bool isShare=false,
}) {
  return Container(
    margin: EdgeInsets.only(top: 10),
    width: ActionWidgetSize, height: ActionWidgetSize,
    child: Column(
      children: [
        Icon(
          icon,
          size: isShare? ShareActionIconSize : ActionIconSize,
          color: Colors.grey
        ),
        Padding(
          padding: EdgeInsets.only(top: isShare? 5 : 2),
          child: Text(title, style: TextStyle(fontSize: isShare? 10 : 12 ))
        )
      ]
    )

  );
}

Widget _getFollowAction({
  String pictureUrl}) {
  return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      width: ActionWidgetSize, height: ActionWidgetSize,
      child: Stack( children: [
        _getProfilePicture(),
        _getPlusIcon()
        ])
    );
}

Widget _getPlusIcon() {
   return Positioned(
        bottom: 0,
        left: ((ActionWidgetSize / 2) - (PlusIconSize / 2)),
        child: Container(
          width: PlusIconSize,  // PlusIconSize = 20.0;
          height: PlusIconSize, // PlusIconSize = 20.0;
          decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 43, 84),
          borderRadius: BorderRadius.circular(15.0)
          ),
          child: Icon(Icons.add, color: Colors.white, size: 20.0, )),);
 }


 Widget _getProfilePicture() {
   return Positioned(
     left: (ActionWidgetSize / 2) - (ProfileImageSize / 2),
     child: Container(
        padding: EdgeInsets.all(1.0), // Add 1.0 point padding to create border
        height: ProfileImageSize, // ProfileImageSize = 50.0;
        width: ProfileImageSize, // ProfileImageSize = 50.0;
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(ProfileImageSize / 2)
        ),
        child: CachedNetworkImage(
          imageUrl: "https://secure.gravatar.com/avatar/ef4a9338dca42372f15427cdb4595ef7",
          placeholder: (context, url) => new CircularProgressIndicator(),
          errorWidget: (context, url, error) => new Icon(Icons.error),
      ),
      ));
 }
