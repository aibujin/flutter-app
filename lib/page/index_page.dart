import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'home_page.dart';
import 'cart_page.dart';
import 'category_page.dart';
import 'momber_page.dart';

import 'package:provide/provide.dart';
import '../Provide/CurrentIndexProvide.dart';


class IndexPage extends StatelessWidget {
  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(
      icon:Icon(CupertinoIcons.home),
      title:Text('首页')
    ),
    BottomNavigationBarItem(
      icon:Icon(CupertinoIcons.search),
      title:Text('分类')
    ),
    BottomNavigationBarItem(
      icon:Icon(CupertinoIcons.shopping_cart),
      title:Text('购物车')
    ),
     BottomNavigationBarItem(
      icon:Icon(CupertinoIcons.profile_circled),
      title:Text('会员中心')
    ),
  ];

   final List<Widget> tabBodies = [
      HomePage(),
      CartPage(),
      CategoryPage(),
      MomberPage()
   ];

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);
    return Provide<CurrentIndexProvide>(

      builder: (context,child,val){
        int currentIndex= Provide.value<CurrentIndexProvide>(context).currentIndex;
        return Scaffold(
            // backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
            backgroundColor: Colors.orangeAccent,
            bottomNavigationBar: BottomNavigationBar(
              type:BottomNavigationBarType.fixed,
              currentIndex: currentIndex,
              items:bottomTabs,
              onTap: (index){
                Provide.value<CurrentIndexProvide>(context).changeIndex(index);
              },
            ),
             body: IndexedStack(
                    index: currentIndex,
                    children: tabBodies
                  ),
        ); 
      }
    );
     
  }
}


// class IndexPage extends StatefulWidget {
//   @override
//   _IndexPageState createState() => _IndexPageState();
// }

// class _IndexPageState extends State<IndexPage> {

//    final List<BottomNavigationBarItem> BottomTabs = [
//      BottomNavigationBarItem(
//        icon: Icon(CupertinoIcons.home),
//        title: Text('首页')
//      ),
//      BottomNavigationBarItem(
//        icon: Icon(CupertinoIcons.search),
//        title: Text('分类')
//      ),BottomNavigationBarItem(
//        icon: Icon(CupertinoIcons.shopping_cart),
//        title: Text('购物车')
//      ),BottomNavigationBarItem(
//        icon: Icon(CupertinoIcons.profile_circled),
//        title: Text('会员中心')
//      ),
//    ];

//    final List<Widget> TabBodies = [
//       HomePage(),
//       CartPage(),
//       CategoryPage(),
//       MomberPage()
//    ];

//    int currentIndex = 0;
//    var currentPage;

//    @override
//   void initState() {
//     super.initState();
//     currentPage = TabBodies[currentIndex];
//   }

//   @override
//   Widget build(BuildContext context) {
//     ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);
//     return Scaffold(
//        backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
//        bottomNavigationBar: BottomNavigationBar(
//          type: BottomNavigationBarType.fixed,
//          currentIndex: currentIndex,
//          items: BottomTabs,
//          onTap: (index){
//            setState(() {
//              currentIndex = index;
//              currentPage = TabBodies[index];
//            });
//          },
//        ),
//        body: IndexedStack(
//           index: currentIndex,
//           children: TabBodies
//       ),
//     );
//   }
// }