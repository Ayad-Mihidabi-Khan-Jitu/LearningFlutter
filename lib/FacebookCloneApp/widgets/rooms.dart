import 'package:flutter/material.dart';
import 'package:learning_flutter/FacebookCloneApp/config/palette.dart';
import '../models/models.dart';
import '../data/data.dart';
import 'profile_avatar.dart';

class Rooms extends StatelessWidget {
  final List<User> onlineUsers;

  //const Rooms({required this.onlineUsers});
  const Rooms({Key? key, required this.onlineUsers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: EdgeInsets.only(top: 10),
      height: 60,
      color: Colors.white,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 4),
        scrollDirection: Axis.horizontal,
        itemCount: 1+onlineUsers.length,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: _CreateRoomButton(),
            );
          }
          final User user = onlineUsers[index-1];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: ProfileAvatar(imageUrl: user.imageUrl,isActive: true,),
          );
        },
      ),
    );
  }
}

class _CreateRoomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () => {},
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        side: BorderSide(color: Colors.lightBlueAccent, width: 3),
      ),
      child: Row(children: [
        ShaderMask(
          shaderCallback: (rect) =>
              Palette.createLineGradient.createShader(rect),
          child: Icon(
            Icons.video_call,
            size: 35,
            color: Colors.white,
          ),
        ),
        const SizedBox(width: 4),
        Text(
          'Cerate\nRoom',
          style: TextStyle(color: Palette.facebookBlue),
        ),
      ]),
    );
  }
}
