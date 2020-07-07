import 'package:flutter/material.dart';

class HomePageFloorTitle extends StatelessWidget {
  final String floorPic;
  const HomePageFloorTitle({Key key,this.floorPic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Image.network(this.floorPic),
    );
  }
}