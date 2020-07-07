import 'package:flutter/material.dart';
import '../routers/Application.dart';

class HomePageADbnner extends StatelessWidget {
  final String bannerpic;
  const HomePageADbnner({Key key,this.bannerpic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
       onTap: (){
         Application.router.navigateTo(context,"/detail?id=107042");
       },
       child: Container(
          margin: EdgeInsets.fromLTRB(6.0, 6.0, 6.0, 0),
          child: Image.asset(this.bannerpic,)
       ),
    );
    
  }
}