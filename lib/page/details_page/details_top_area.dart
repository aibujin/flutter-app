
import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import '../../Provide/details_info.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class DetailsTopArea extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Provide<DetailsInfoProvide>(
      builder: (context,child,data){
          var goodsInfo=Provide.value<DetailsInfoProvide>(context).detailsModel;
          if(goodsInfo != null){
             return Container(
                color: Colors.white,
                padding: EdgeInsets.all(2.0),
                child: Column(
                    children: <Widget>[
                        _goodsImage(goodsInfo.imageRects),   
                        _goodsName(goodsInfo.longName),   
                        _goodsAgeText(goodsInfo.postAgeText)          
                    ],
                  ),
             );
          }else{
            return Text('正在加载中......');
          }
      }
    );
  }

  Widget _goodsImage(List imageRects){
    return Container(
      margin: EdgeInsets.fromLTRB(6.0, 6.0, 6.0, 0),
      height: 218.0,
      width: ScreenUtil().setWidth(740), 
      child: Swiper(
        itemCount: imageRects.length,
        pagination: new SwiperPagination(
          builder: DotSwiperPaginationBuilder(
            color: Colors.blue,
            size: 8.0,
            activeSize: 10.0,
            activeColor: Colors.white
          )
        ),
        autoplay: true,
        itemBuilder: (BuildContext context,int index){
          return Image.network("${imageRects[index]}",fit:BoxFit.fill);
        },
      )
    );
  }

  Widget _goodsName(name){
      return Container(
        margin: EdgeInsets.only(top: 8.0),
        width: ScreenUtil().setWidth(730),
        padding: EdgeInsets.only(top: 8.0,left: 8.0),
        child: Text(
          name,
          maxLines: 1,
          style: TextStyle(
            fontSize: ScreenUtil().setSp(30),
            fontWeight: FontWeight.w600
          ),
        ),
      );
  }

  Widget _goodsAgeText(postAgeText){
    return  Container(
      width: ScreenUtil().setWidth(730),
      padding: EdgeInsets.only(left:8.0),
      margin: EdgeInsets.only(top:8.0,bottom: 8.0),
      child: Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Image.asset('images/freeshiping.png',width: 18.0,),  
          ),
          Text(
            postAgeText,
            style: TextStyle(
              color: Colors.orange
            ),
          ),
        ], 
      ),
    );
  }

}