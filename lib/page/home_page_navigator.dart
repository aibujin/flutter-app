import 'package:flutter/material.dart';

class HomePageNavigator extends StatelessWidget {
  final List navigatorList;
  const HomePageNavigator({Key key,this.navigatorList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(6.0, 6.0, 6.0, 0),
      height: 170.0,
      padding: EdgeInsets.all(6.0),
      child: GridView.count(
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 4,
        crossAxisSpacing: 3.0,
        padding: EdgeInsets.all(3.0),
        children: navigatorList.map((e){
          return _gridViewItemUI(context, e);
        }).toList()
      ),
    );
  }


   Widget _gridViewItemUI(BuildContext context,item){
      return InkWell(
        onTap: (){},
        child: Column(
           children: <Widget>[
             ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.network(item['Logo'],height: 50.0,),
             ),          
             Text(item['Alt'])
           ],
        ),
      );
   }
}