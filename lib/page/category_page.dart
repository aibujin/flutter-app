import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Provide/cart.dart';
import 'package:provide/provide.dart';
import './cart_page/cart.dart';
class CategoryPage extends StatelessWidget {
  @override
 Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('购物车'),
      ),
      body:FutureBuilder(
         future: _getCartInfo(context),
         builder: (context,snapshot){
           if(snapshot.hasData){
              return  CartList();
           }else{
             return Text('正在加载中');
           }
         },
      )
    );
  }

  Future<String> _getCartInfo(BuildContext context) async{
     await Provide.value<CartProvide>(context).getCartInfo();
     return 'end';
  }

}




