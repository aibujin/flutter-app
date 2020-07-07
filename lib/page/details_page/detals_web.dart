
import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:flutter_html/flutter_html.dart';
import '../../Provide/details_info.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsWeb  extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var goodsDetail=Provide.value<DetailsInfoProvide>(context).detailsModel;
   // List goodsDetailText=Provide.value<DetailsInfoProvide>(context).detailsTextModel.contentList;
   // print('图片列表${goodsDetailText}');
    return Provide<DetailsInfoProvide>(
      builder: (context,child,data){
        var isLeft = Provide.value<DetailsInfoProvide>(context).isLeft;
        if(isLeft){
          return Container(
              // child: ListView.builder(
              //   itemCount: goodsDetailText.length,
              //   itemBuilder: (context,index){
              //       return Image.network(goodsDetailText[index]);
              //   },
              // ),
              child: Text('aaaaa'),
            );
        }else{
          return Container(
            color: Colors.white,
            child: Html(
              data:goodsDetail.note
            ),
          );
        }
      },
    );
  }
}