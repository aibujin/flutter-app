import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutterapp/page/momber_page.dart';
import '../service/service_method.dart';
import '../model/category.dart';
import 'dart:convert';
import 'package:provide/provide.dart';
import '../Provide/child_category.dart';
import '../model/catagory_list.dart';
import '../model/catagory_list_nav.dart';
import '../Provide/child_catarogy_nav.dart';


class LeftCategoryNav extends StatefulWidget {

  @override
  _LeftCategoryNavState createState() => _LeftCategoryNavState();
}

class _LeftCategoryNavState extends State<LeftCategoryNav> {

  List list = [];
  int listIndex = 0; //索引


  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  Widget build(BuildContext context) {
     return Container(
        width: ScreenUtil().setWidth(150),
        decoration: BoxDecoration(
          border: Border(
            right: BorderSide(width: 1,color:Colors.black12)
          )
        ),
        child: ListView.builder(
          itemCount:list.length,
          itemBuilder: (context,index){
            return _leftInkWel(index);
          },
        ),
    );
  }

  
  Widget _leftInkWel(int index){
    bool isClick=false;
    isClick=(index==listIndex)?true:false;
    return InkWell(
      onTap: (){
        setState(() {
           listIndex=index;
         });
         if(!list[index].url.toString().contains('c1')){
           Provide.value<ChildCategory>(context).getChildCategory([]);
           Provide.value<ChildCategoryNav>(context).getChildCategory([]);
         }else{
           int inde = int.parse(list[index].url.toString().split('=')[1]);
           _loadList(inde); 
         }     
      },
      child: Container(
        height: ScreenUtil().setHeight(100),
        padding:EdgeInsets.only(left:20,top:16),
        decoration: BoxDecoration(
          color: isClick?Colors.blueAccent:Colors.white,
          border:Border(
            bottom:BorderSide(width: 1,color:Colors.black12)
          )
        ),
        child: Text(list[index].iconTitle,style: TextStyle(fontSize:ScreenUtil().setSp(28)),),
      ),
    );
  }

  void _load() async{
    await getCardPage().then((val){
      var data = json.decode(val.toString());
      CategoryBigListModel category = CategoryBigListModel.formJson(data['navigatorIcon']);
     // category.data.forEach((e)=>{print(e.iconTitle)});
      setState(() {
          list = category.data;
      });
      int idex = 42;
      _loadList(idex);
    });
  }


  void _loadList(int index) async{
      await getCardRightPage(index).then((val){
        var data = json.decode(val.toString());
        if(data['content']['goods'].length>0){
          CategoryListsModel category = CategoryListsModel.formJson(data['content']['goods']['goodsList']);
          if(category.data==null){
            Provide.value<ChildCategory>(context).getChildCategory([]);
          }else{
               Provide.value<ChildCategory>(context).getChildCategory(category.data);
          }     

          CategoryListNavListModel categoryListNavListModel = CategoryListNavListModel.formJson(data['content']['category']['categoryList']);
          if(categoryListNavListModel.data == null ){
            Provide.value<ChildCategoryNav>(context).getChildCategory([]);
          }else{
            Provide.value<ChildCategoryNav>(context).getChildCategory(categoryListNavListModel.data);
          }  
        }else{
          Provide.value<ChildCategory>(context).getChildCategory([]);
           Provide.value<ChildCategoryNav>(context).getChildCategory([]);
        }
   
      });      
  }

}

