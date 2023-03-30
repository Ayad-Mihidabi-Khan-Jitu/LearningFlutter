import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:learning_flutter/FacebookCloneApp/widgets/profile_avatar.dart';
import 'package:learning_flutter/PersonalExpenseApp/widgets/adaptive_flat_button.dart';
import '../models/user_model.dart';

class CreatePostContainer extends StatelessWidget {
  final User currentUser;

  CreatePostContainer({required this.currentUser});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 0),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              ProfileAvatar(imageUrl: currentUser.imageUrl),
              const SizedBox(width: 8),
              Expanded(
                child: TextField(
                  decoration: InputDecoration.collapsed(
                      hintText: 'What\'s on your mind'),
                ),
              )
            ],
          ),
          const Divider(height: 10, thickness: 0.5),
          Container(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton.icon(
                  onPressed: () => {},
                  icon: Icon(Icons.videocam, color: Colors.red),
                  label: Text('Live',style: TextStyle(color: Colors.black)),
                ),
                const VerticalDivider(width: 8),
                TextButton.icon(
                  onPressed: () => {},
                  icon: Icon(Icons.photo_library, color: Colors.green),
                  label: Text('Photo',style: TextStyle(color: Colors.black)),
                ),
                const VerticalDivider(width: 8),
                TextButton.icon(
                  onPressed: () => {},
                  icon: Icon(Icons.video_call, color: Colors.purpleAccent),
                  label: Text('Room',style: TextStyle(color: Colors.black)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
