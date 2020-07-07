
import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import '../Provide/details_info.dart';
import './details_page/details_top_area.dart';
import './details_page/details_explain.dart';
import './details_page/details_tabBar.dart';
import './details_page/detals_web.dart';
import './details_page/details_bottom.dart';

class DetailsPage extends StatelessWidget {

  final String id;
  DetailsPage(this.id);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('详情页'),
        ),
        body:FutureBuilder(
          future: _getBackInfo(context) ,
          builder: (context,snapshot){
            if(snapshot.hasData){
                return Stack(
                    children: <Widget>[
                      ListView(
                              children: <Widget>[
                                  //关键代码------start
                                  DetailsTopArea(),
                                  DetailsExplain(),
                                  DetailsTabBar(),
                                  DetailsWeb()
                                  //关键代码------end
                              ],
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        child: DetailsBottom()
                      )
                    ],
                ); 
            }else{
                return Text('加载中........');
            }
          }
        )
    );
  }


  Future _getBackInfo(BuildContext context)async{
  
  //  await Future.wait<dynamic>([Provide.value<DetailsInfoProvide>(context).getGoodsInfo(this.id),Provide.value<DetailsInfoProvide>(context).getGoodsTextInfo(this.id)]);

   await Provide.value<DetailsInfoProvide>(context).getGoodsInfo(this.id);
  //  await Provide.value<DetailsInfoProvide>(context).getGoodsTextInfo(this.id);
   return '.........';


  }

    Future _getGoodsTextInfo(BuildContext context)async{
      await Provide.value<DetailsInfoProvide>(context).getGoodsTextInfo(this.id);
      return '.........';
  }



}