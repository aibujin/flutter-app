import 'package:flutter/material.dart';

class HomePageFloorCotnext extends StatelessWidget {
  final List floorGoodsList;
  const HomePageFloorCotnext({Key key,this.floorGoodsList}) : super(key: key);

   @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(6.0),
      child: Column(
        children: <Widget>[
          _firstRow(context),
          _otherGoods(context)
        ],
      ),
    );
  }

  Widget _firstRow(context){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(child: _goodsItem(context,floorGoodsList[0]),),
        Expanded(
          child: Column(
              children: <Widget>[
                _goodsItem(context,floorGoodsList[1][0]),
                _goodsItem(context,floorGoodsList[1][1]),
              ],
          )
        )
        
      ],
    );
  }

  Widget _otherGoods(context){
    return Container(
       margin: EdgeInsets.only(top:8.0),
       child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(child: _goodsItem(context,floorGoodsList[2][0]),),
            Expanded(child: _goodsItem(context,floorGoodsList[2][1]),)
          ],
       ),
    );
  }

  Widget _goodsItem(context,Map goods){
    return Container(
    //  width: MediaQuery.of(context).size.width/2-6,
      child: InkWell(
         onTap:(){print('点击了楼层商品');},
         child: Image.network(goods['image']),
      ),
    );
  }
}