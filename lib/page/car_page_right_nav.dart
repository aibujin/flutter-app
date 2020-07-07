import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import '../service/service_method.dart';
import '../model/catagort_type.dart';
import './cart_page_right_list_view.dart';
import '../Provide/child_catarogy_nav.dart';

class RightCategoryNav extends StatefulWidget {
  RightCategoryNav({Key key}) : super(key: key);

  @override
  _RightCategoryNavState createState() => _RightCategoryNavState();
}

class _RightCategoryNavState extends State<RightCategoryNav> {
 // List list = ['名酒','宝丰','北京二锅头','茅台','竹叶青','散酒','江小白'];
  @override
  Widget build(BuildContext context) {
    return Provide<ChildCategoryNav>(
      builder: (context,child,data){
        if(data.categoryListNavModel.length>0){
          return Column(
              children: <Widget>[
                  Container(
                      height: ScreenUtil().setHeight(90),
                      width: ScreenUtil().setWidth(600),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          bottom: BorderSide(width: 1,color: Colors.black12)
                        )
                      ),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: data.categoryListNavModel.length,
                        itemBuilder: (context,index){
                          return _rightInkWell(index,data.categoryListNavModel[index]);
                        }
                      )
                  ),
                CategoryGoodsList()
              ],
          );
        }else{
           return Column(
            children: <Widget>[
              Text('暂无数据')
            ],
           );
        }

      }
    );
  }

  Widget _rightInkWell(index,item){
    bool isCheck = false;
    isCheck =(index==Provide.value<ChildCategoryNav>(context).childIndex)?true:false;
    return InkWell(
      onTap: (){
        _loadList();
        Provide.value<ChildCategoryNav>(context).changeChildIndex(index);
      },
      child: Container(
        padding:EdgeInsets.fromLTRB(5.0,10.0,5.0,10.0),
        color: isCheck?Colors.lightBlueAccent:Colors.white,
        child: Text(
          item.name,
          style: TextStyle(fontSize:ScreenUtil().setSp(28),color: isCheck?Colors.white:Colors.black,),        
        ),
      ),
    );
  }


     void _loadList() async{
      await getRecommendProduct().then((val){
          var data = json.decode(val.toString());
          // setState((){
          //    Rightlist = (data['goodsList'] as List).cast();
          // });
          CategoryTypeListModel ctl = CategoryTypeListModel.fromJson(data['goodsList']);
          ctl.list.forEach((e)=>{print('${e.name}''${e.goodsId}')});
      });
   
  }


}