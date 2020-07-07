import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:provide/provide.dart';
import '../Provide/child_category.dart';
import '../routers/Application.dart';

class CategoryGoodsList extends StatefulWidget {
  CategoryGoodsList({Key key}) : super(key: key);

  @override
  _CategoryGoodsListState createState() => _CategoryGoodsListState();
}

class _CategoryGoodsListState extends State<CategoryGoodsList> {

  var scrollController=new ScrollController();

  @override
  Widget build(BuildContext context) {
    return Provide<ChildCategory>(
        builder: (context,child,data){
            try{
              if(Provide.value<ChildCategory>(context).page==1){
                scrollController.jumpTo(0.0);
              }
            }catch(e){
              print('进入页面第一次初始化：${e}');
            }

            if(data.childCategoryList.length>0){
                return Container(
                    width: ScreenUtil().setWidth(570) ,
                    height:ScreenUtil().setHeight(950) ,
                    child: ListView.builder(
                      controller: scrollController,
                      itemCount: data.childCategoryList.length,
                      itemBuilder: (context,index){
                        return _ListWidget(data.childCategoryList,index);
                      },
                    )
                );
            }else{
                return  Text('暂时没有数据');
            }
        }
    );
    
  }

   Widget _ListWidget(List newList,int index){
      return InkWell(
        onTap: (){
            Application.router.navigateTo(context,"/detail?id=${newList[index].goodsId}");
        },
        child: Container(
          padding: EdgeInsets.only(top: 5.0,bottom: 5.0),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              bottom: BorderSide(width: 1.0,color: Colors.black12)
            )
          ),
          child: Row(
            children: <Widget>[
              _goodsImage(newList,index),
              Column(
                children: <Widget>[
                  _goodsName(newList,index),
                  _goodsPrice(newList,index)
                ],
              )
            ],
          ),
        )
      );
  }

  Widget _goodsImage(List newList,int index){
    return  Container(
      width: ScreenUtil().setWidth(200),
      child: Image.network(newList[index].imageSrc),
    );
  }

  Widget _goodsName(List newList,int index){
    return Container( 
      padding: EdgeInsets.all(5.0),
      width: ScreenUtil().setWidth(370),
      child: Text(
        newList[index].name,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: ScreenUtil().setSp(28)),
        ),
      );
  }

  Widget _goodsPrice(List newList,int index){
    return  Container( 
      margin: EdgeInsets.only(top:20.0),
      width: ScreenUtil().setWidth(370),
      child:Row(
        children: <Widget>[
            Text(         
              '￥${newList[index].goodsId.toString()}',
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.black26,
                decoration: TextDecoration.lineThrough
              ),
            )
        ]
      )
    );
  }

}