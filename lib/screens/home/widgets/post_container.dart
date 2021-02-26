import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_app/config/palette.dart';
import 'package:facebook_app/models/post_model.dart';
import 'package:facebook_app/screens/home/widgets/profile_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PostContainer extends StatelessWidget {
  final Post post;

  const PostContainer({
    Key key,
    @required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.symmetric(
        vertical: 8.0,
      ),
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _PostHeader(
                  post: post,
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  post.caption,
                ),
                post.imageUrl != null
                    ? SizedBox.shrink()
                    : SizedBox(
                        height: 6.0,
                      ),
              ],
            ),
          ),
          post.imageUrl != null
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: CachedNetworkImage(imageUrl: post.imageUrl),
                )
              : SizedBox.shrink(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: _PostStats(post: post),
          ),
        ],
      ),
    );
  }
}

class _PostHeader extends StatelessWidget {
  final Post post;

  const _PostHeader({Key key, @required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileAvatar(imageUrl: post.user.imageUrl),
        SizedBox(width: 8),
        Expanded(
          //Expanded sayesinde more IconButton 'u en sağa gitti
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.user.name,
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              Row(
                children: [
                  Text(
                    "${post.timeAgo} .",
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12.0,
                    ),
                  ),
                  Icon(
                    Icons.public,
                    color: Colors.grey[600],
                    size: 12,
                  )
                ],
              ),
            ],
          ),
        ),
        IconButton(icon: Icon(Icons.more_horiz), onPressed: () => print("more"))
      ],
    );
  }
}

class _PostStats extends StatelessWidget {
  final Post post;

  const _PostStats({Key key, @required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Palette.facebookBlue,
              ),
              child: Icon(
                Icons.thumb_up,
                size: 10,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 4.0,
            ),
            Expanded(
              child: Text(
                "${post.likes}",
                style: TextStyle(color: Colors.grey[600]),
              ),
            ),
            Text(
              "${post.comments} Comments",
              style: TextStyle(color: Colors.grey[600]),
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              "${post.likes} Shares",
              style: TextStyle(color: Colors.grey[600]),
            ),
          ],
        ),
        Divider(),
        Row(
          children: [
            _postButton(
                icon: Icon(MdiIcons.thumbUpOutline,
                    color: Colors.grey[600], size: 20.0),
                label: 'Like',
                onTap: () => print('Like')),
            _postButton(
                icon: Icon(MdiIcons.commentOutline,
                    color: Colors.grey[600], size: 20.0),
                label: 'Comment',
                onTap: () => print('Comment')),
            _postButton(
                icon: Icon(MdiIcons.shareOutline,
                    color: Colors.grey[600], size: 25.0),
                label: 'Share',
                onTap: () => print('Share')),
          ],
        ),
      ],
    );
  }
}

class _postButton extends StatelessWidget {
  final Icon icon;
  final String label;
  final Function onTap;

  const _postButton(
      {Key key,
      @required this.icon,
      @required this.label,
      @required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
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
