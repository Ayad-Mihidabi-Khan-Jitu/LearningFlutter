import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../config/palette.dart';
import '../widgets/widgets.dart';
import '../models/models.dart';

class PostContainer extends StatelessWidget {
  final Post post;

  const PostContainer({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.symmetric(vertical: 8),
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _PostHeader(post: post),
                SizedBox(height: 4),
                Text(post.caption),
                post.imageUrl != null ? SizedBox.shrink() : SizedBox(height: 6),
              ],
            ),
          ),
          post.imageUrl != null
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: CachedNetworkImage(imageUrl: post.imageUrl!),
                )
              : SizedBox.shrink(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            child: _PostStats(post: post),
          )
        ],
      ),
    );
  }
}

class _PostStats extends StatelessWidget {
  final Post post;

  const _PostStats({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Palette.facebookBlue),
              child: Icon(Icons.thumb_up, color: Colors.white, size: 10),
            ),
            SizedBox(width: 4),
            Expanded(
                child: Text('${post.likes}',
                    style: TextStyle(color: Colors.grey[600]))),
            Text('${post.comments} Comments',
                style: TextStyle(color: Colors.grey[600])),
            SizedBox(width: 8),
            Text('${post.shares} Shares',
                style: TextStyle(color: Colors.grey[600])),
          ],
        ),
        Divider(),
        Row(
          children: [
            _PushButton(
              icon: Icon(
                MdiIcons.thumbUpOutline,
                color: Colors.grey[600],
                size: 20,
              ),
              label: 'like',
              onTap: () => print('pressed like'),
            ),
            _PushButton(
              icon: Icon(
                MdiIcons.commentOutline,
                color: Colors.grey[600],
                size: 20,
              ),
              label: 'comments',
              onTap: () => print('pressed like'),
            ),
            _PushButton(
              icon: Icon(
                MdiIcons.shareOutline,
                color: Colors.grey[600],
                size: 25,
              ),
              label: 'share',
              onTap: () => print('pressed like'),
            )
          ],
        )
      ],
    );
  }
}

class _PushButton extends StatelessWidget {
  final Icon icon;
  final String label;
  final Function onTap;

  const _PushButton(
      {super.key,
      required this.icon,
      required this.label,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Expanded(
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: () => onTap,
          child: Container(
            height: 25,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon,
                SizedBox(width: 4),
                Text(label),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _PostHeader extends StatelessWidget {
  final Post post;

  const _PostHeader({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      children: [
        ProfileAvatar(imageUrl: post.user.imageUrl),
        SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(post.user.name,
                  style: TextStyle(fontWeight: FontWeight.w600)),
              Row(
                children: [
                  Text(
                    '${post.timeAgo} * ',
                    style: TextStyle(color: Colors.grey[600], fontSize: 12),
                  ),
                  Icon(Icons.public, color: Colors.grey[600], size: 12),
                ],
              )
            ],
          ),
        ),
        IconButton(
          onPressed: () => print('Post details'),
          icon: Icon(Icons.more_horiz),
        )
      ],
    );
  }
}
