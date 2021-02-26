import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_app/models/models.dart';
import 'package:facebook_app/screens/home/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';

class CreatePostContainer extends StatelessWidget {
  final User currentUser;

  const CreatePostContainer({Key key, @required this.currentUser})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 0.0),
      //padding'i child(Column)'i baz alarak uygular.
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              ProfileAvatar(imageUrl: currentUser.imageUrl,),
              SizedBox(width: 8.0),
              Expanded(
                //TextField'a size vermediğimiz için gözükmez, gözükmesi için Expanded içerisine alarak genişletilmiş widget haline getirdik.
                child: TextField(
                  decoration: InputDecoration.collapsed(
                      //collapsed sayesinde text kutusunun altındaki widgetdan kurtulduk.
                      hintText: "What\'s on your mind?"),
                ),
              ),
            ],
          ),
          Divider(
            height: 10,
            thickness: 0.5,
          ),
          Container(
            height: 40.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FlatButton.icon(
                  onPressed: () => print("Live"),
                  icon: Icon(
                    Icons.videocam,
                    color: Colors.red,
                  ),
                  label: Text("Live"),
                ),
                VerticalDivider(
                  width: 8.0,
                ),
                FlatButton.icon(
                  onPressed: () => print("Photo"),
                  icon: Icon(
                    Icons.photo_library,
                    color: Colors.green,
                  ),
                  label: Text("Photo"),
                ),
                VerticalDivider(
                  width: 8.0,
                ),
                FlatButton.icon(
                  onPressed: () => print("Room"),
                  icon: Icon(
                    Icons.video_call,
                    color: Colors.purpleAccent,
                  ),
                  label: Text("Room"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
