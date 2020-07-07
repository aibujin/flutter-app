import 'package:flutter/material.dart';
import 'cart_page_left_nav.dart';
import 'car_page_right_nav.dart';

class CartPage extends StatefulWidget {
  CartPage({Key key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(title: Text('商品分类'),),
       body: Row(
          children: <Widget>[
            LeftCategoryNav(),
            Column(
              children: <Widget>[
                 RightCategoryNav()
              ],
            )
          ],
       ),
    );
  }


}