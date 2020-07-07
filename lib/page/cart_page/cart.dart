import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import '../../Provide/cart.dart';
import './cart_item.dart';
import './cart_bottom.dart';

class CartList  extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Provide<CartProvide>(
       builder: (context,child,data){
          List cartList=Provide.value<CartProvide>(context).cartList;
          return Stack(
            children: <Widget>[
              ListView.builder(
                  itemCount: cartList.length,
                  itemBuilder: (context,index){
                  return CartItem(cartList[index]);
                  }
              ),
              Positioned(
                 bottom:0,
                 left:0,
                 child: CartBottom(),
              )  
            ],
          );
      },
    );
  }







}