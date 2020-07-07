import 'package:flutter/material.dart';

class HomePageRecommend extends StatelessWidget {
  final List recommendList;
  const HomePageRecommend({Key key,this.recommendList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(6.0, 6.0, 6.0, 0),
      child: Column(
        children: <Widget>[
          _titleWidget(),
          _recommedList()
        ],
      ),
    );
  }

  Widget _titleWidget(){
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.fromLTRB(10.0, 2.0, 0,5.0),
      decoration: BoxDecoration(
         color:Colors.white,
         border: Border(
           bottom: BorderSide(width:0.5,color:Colors.black12)
         )
       ),
       child:Text(
         '商品推荐',
         style:TextStyle(color:Colors.lightBlueAccent)
       )
    );
  }

  Widget _recommedList(){
      return Container(
          height: 260.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: recommendList.length,
            itemBuilder: (context,index){
              return _item(index);
            },
          ),
      );
  }

  Widget _item(index){
    return InkWell(
      onTap: (){},
      child: Container(
          height: 168.0,
          width: 220.0,
          padding: EdgeInsets.all(8.0),
          decoration:BoxDecoration(
            color:Colors.white,
            border:Border.all(
              width:1,color:Colors.black12
            )
          ),
          child: Column(
            children: <Widget>[
              Image.network(recommendList[index]['imageSrc']),
              Text('${recommendList[index]['goodsId']}',style: TextStyle(),),
              Text(
                '￥${recommendList[index]['minSalePrice']}',
                style: TextStyle(
                  decoration: TextDecoration.lineThrough,
                  color:Colors.grey
                ),
              )
            ],
          ),
      ),
    );
  }

}