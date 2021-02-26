import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final IconData icon;
  final double iconSize;
  final Function onPressed;

  //@required ilgili değişkenleri girmeyi bize hatırlatır -- CircleButton(icon: null, iconSize: null, onPressed: null),  şeklinde
  const CircleButton({Key key, @required this.icon, @required this.iconSize, @required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //container icon'in yuvarlak giri çember içine almak için eklendi.
      margin: EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Icon(icon),
        iconSize: iconSize,
        color: Colors.black,
        onPressed: onPressed,
      ),
    );
  }
}
