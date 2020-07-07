import 'package:flutter/material.dart';

class HomePageLeaderPhone extends StatelessWidget {
  final String leaderImage; //店长图片
  final String leaderPhone;
  const HomePageLeaderPhone({Key key,this.leaderImage,this.leaderPhone}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(6.0, 6.0, 6.0, 0),
      child: InkWell(
        onTap: (){},
        child: Image.asset(leaderImage),
      ),
    );
  }

  // void _launchURL() async {
  //   String url = 'tel:'+leaderPhone;
  //   if (await canLaunch(url)) {
  //     await launch(url);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }

}



