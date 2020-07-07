import 'package:flutter/material.dart';

class HomePageGood extends StatefulWidget {
  final List hotGoods;
  HomePageGood({Key key,this.hotGoods}) : super(key: key);

  @override
  _HomePageGoodState createState() => _HomePageGoodState();
}

class _HomePageGoodState extends State<HomePageGood> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Column(
          children: <Widget>[
            hotTitle,
            _wrapList()
          ],
       ),
    );
  }


  Widget hotTitle = Container(
      margin: EdgeInsets.all(6.0),
      padding: EdgeInsets.all(8.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.white,
          border:Border(
            bottom: BorderSide(width:1 ,color:Colors.black12)
          )
      ),
      child: Text('火爆专区'),
  );

  Widget _wrapList(){
     if(widget.hotGoods.length!=0){
       List<Widget> listWidget = widget.hotGoods.map((e){
          return InkWell(
            onTap: (){},
            child: Container(
              color:Colors.white,
              padding: EdgeInsets.all(5.0),
              width: MediaQuery.of(context).size.width/2-10,
              margin:EdgeInsets.only(bottom:3.0),
              child: Column(
                children: <Widget>[
                   Image.network(e['Logo']),
                   Text(
                      e['Alt'],
                      maxLines: 1,
                      overflow:TextOverflow.ellipsis,
                      style: TextStyle(color:Colors.blueAccent,fontSize: 14.0),
                   ),
                   Row(
                     children: <Widget>[
                       Expanded(
                         child: Text(
                            '${e['Summary']}',
                            maxLines: 1,
                            overflow:TextOverflow.ellipsis ,
                            style: TextStyle(color:Colors.black26,decoration: TextDecoration.lineThrough),
                         )
                       )
                     ],
                   )
                ],
              ),
            ),
          );
       }).toList();

       return Wrap(
          spacing: 2,
          children: listWidget,
       );
     }else{
       return Text('数据加载中！！！！');
     }
  }


}