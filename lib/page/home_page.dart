import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import '../utils/printUtils.dart';
import '../service/service_method.dart';
import 'home_page_swipper.dart';
import 'home_page_navigator.dart';
import 'home_page_adbnner.dart';
import 'home_page_leader_phone.dart';
import 'home_page_recommend.dart';
import 'home_page_floor_itle.dart';
import 'home_page_floor_context.dart';
import 'home_page_good.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin{
  final List picture = [
    {'image':'http://img5.mtime.cn/mg/2019/11/22/165612.96935414.jpg'},
    {'image':'http://img5.mtime.cn/mg/2019/09/19/104138.65713207.jpg'},
    {'image':'http://img5.mtime.cn/mg/2019/07/19/152249.72244334.jpg'},
    {'image':'http://img5.mtime.cn/mg/2019/09/02/111000.90305900.jpg'},
  ];
  final String bannerpic = 'images/agg.jpg';
  final String leaderImage = 'images/sc.jpg';
  final String leaderPhone = '010';
  final String floorPic = 'http://img5.mtime.cn/mg/2019/07/03/174012.80503273.jpg';
  List navigatorList = [];
  List<Map> recommendList = [];
  List floorGoodsList = [];
  List hotGoods = [];

  @override
  bool get wantKeepAlive =>true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('动漫电影商城'),
      ),
      body: FutureBuilder(
        future: getHomePage(),
        builder: (context,snapshot){
          if(snapshot.hasData){
             //var picture = snapshot.data['topics'][15]['Logo'];
             navigatorList = []
             ..add({'Logo':snapshot.data['topics'][2]['Logo'],'Alt':snapshot.data['topics'][2]['Alt']})
             ..add({'Logo':snapshot.data['topics'][7]['Logo'],'Alt':snapshot.data['topics'][7]['Alt']})
             ..add({'Logo':snapshot.data['topics'][13]['Logo'],'Alt':snapshot.data['topics'][13]['Alt']})
             ..add({'Logo':snapshot.data['topics'][25]['Logo'],'Alt':snapshot.data['topics'][25]['Alt']})
             ..add({'Logo':snapshot.data['topics'][26]['Logo'],'Alt':snapshot.data['topics'][26]['Alt']})
             ..add({'Logo':snapshot.data['topics'][29]['Logo'],'Alt':snapshot.data['topics'][29]['Alt']})
             ..add({'Logo':snapshot.data['topics'][30]['Logo'],'Alt':snapshot.data['topics'][30]['Alt']})
             ..add({'Logo':snapshot.data['topics'][39]['Logo'],'Alt':snapshot.data['topics'][39]['Alt']});

             recommendList = (snapshot.data['content']['goods']['goodsList'] as List).cast();

             var cellC = [
               {'image':'http://img5.mtime.cn/mg/2019/07/03/174427.96016382.jpg'},
               {'image':'http://img5.mtime.cn/mg/2019/09/19/104402.67521002.jpg'}     
             ];
             var subList = [
               {'image':'http://img5.mtime.cn/goods/2017/07/27/143439.62420403_600X600X1.jpg'},
               {'image':'http://img5.mtime.cn/goods/2017/11/02/142140.22636262_600X600X1.jpg'}     
             ];

             floorGoodsList
              ..add({'image':'http://img5.mtime.cn/mg/2019/08/19/141732.33138431.jpg'})
              ..add(cellC)
              ..add(subList);

             hotGoods
              ..add({'Logo':snapshot.data['topics'][2]['Logo'],'Alt':snapshot.data['topics'][3]['Alt'],'Summary':snapshot.data['topics'][3]['Summary']})
              ..add({'Logo':snapshot.data['topics'][7]['Logo'],'Alt':snapshot.data['topics'][4]['Alt'],'Summary':snapshot.data['topics'][4]['Summary']})
              ..add({'Logo':snapshot.data['topics'][13]['Logo'],'Alt':snapshot.data['topics'][5]['Alt'],'Summary':snapshot.data['topics'][5]['Summary']})
              ..add({'Logo':snapshot.data['topics'][25]['Logo'],'Alt':snapshot.data['topics'][6]['Alt'],'Summary':snapshot.data['topics'][6]['Summary']})
              ..add({'Logo':snapshot.data['topics'][26]['Logo'],'Alt':snapshot.data['topics'][8]['Alt'],'Summary':snapshot.data['topics'][8]['Summary']});

            //  return SingleChildScrollView(
            //   child: Column(
            //       children: <Widget>[
            //             HomePageWsipper(picture:picture),
            //             HomePageNavigator(navigatorList:navigatorList),
            //             HomePageADbnner(bannerpic:bannerpic),
            //             HomePageLeaderPhone(leaderImage:leaderImage,leaderPhone:leaderPhone),
            //             HomePageRecommend(recommendList:recommendList),
            //             HomePageFloorTitle(floorPic:floorPic),
            //             HomePageFloorCotnext(floorGoodsList:floorGoodsList),
            //             HomePageGood(hotGoods:hotGoods)
            //           ],
            //       ),
            //   );
              return EasyRefresh(
                  footer: ClassicalFooter(
                      bgColor: Colors.white,
                      loadText: '加载失败',
                      infoColor: Colors.blue,
                      textColor: Colors.blue,  
                      noMoreText: '',
                      showInfo: false,
                      loadingText: '加载中。。。',
                      loadReadyText: '准备开始加载',
                      loadedText: '加载完成',
                    ),
                  child: ListView(
                    children: <Widget>[
                        HomePageWsipper(picture:picture),
                        HomePageNavigator(navigatorList:navigatorList),
                        HomePageADbnner(bannerpic:bannerpic),
                        HomePageLeaderPhone(leaderImage:leaderImage,leaderPhone:leaderPhone),
                        HomePageRecommend(recommendList:recommendList),
                        HomePageFloorTitle(floorPic:floorPic),
                        HomePageFloorCotnext(floorGoodsList:floorGoodsList),
                        HomePageGood(hotGoods:hotGoods)
                    ],
                  ),
                  onLoad:() async{
                    Fluttertoast.showToast(
                        msg: "This is Center Short Toast",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0
                    );
                    await getHomePage().then((value) => print('加载完成'));
                  }
              );

          }else{
            return Center(
               child: Text('加载中！！！！'),
            );
          }
        }
      ),
    );
  }
}


