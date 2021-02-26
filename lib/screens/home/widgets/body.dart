import 'package:facebook_app/config/palette.dart';
import 'package:facebook_app/data/data.dart';
import 'package:facebook_app/models/post_model.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'widgets.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          brightness: Brightness.light,
          //üsteki saat, şarj altei vs rengini değiştirir
          backgroundColor: Colors.white,
          title: Text(
            "facebook",
            style: TextStyle(
              color: Palette.facebookBlue,
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
              letterSpacing: -1.2, //harfleri birbirine yaklaştırdık
            ),
          ),
          centerTitle: false,
          floating: true,
          //yukarı kaydırıp ardından hemen aşağı çekersek appbar hemen süzülerek çıkar.
          actions: [
            CircleButton(
              icon: Icons.search,
              iconSize: 30.0,
              onPressed: () => debugPrint("Search"),
            ),
            CircleButton(
              icon: MdiIcons.facebookMessenger,
              iconSize: 30.0,
              onPressed: () => debugPrint("Messenger"),
            ),
          ],
        ),
        SliverToBoxAdapter(
          child: CreatePostContainer(
            currentUser: currentUser,
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
          sliver: SliverToBoxAdapter(
            //SliverPadding child yerine sliver alır.
            child: Rooms(onlineUser: onlineUsers),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
          sliver: SliverToBoxAdapter(
              //SliverPadding child yerine sliver alır.
              child: Stories(currentUser: currentUser, stories: stories)),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final Post post = posts[index];
              return PostContainer(post: post);
            },
            childCount: 5,
          ),
        ),
      ],
    );
  }
}
