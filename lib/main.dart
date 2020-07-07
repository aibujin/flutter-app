import 'package:flutter/material.dart';
import './page/index_page.dart';

import 'package:provide/provide.dart';
import './provide/counter.dart';
import './Provide/child_category.dart';
import './Provide/child_catarogy_nav.dart';
import './Provide/details_info.dart';
import 'package:fluro/fluro.dart';
import './routers/Application.dart';
import './routers/routes.dart';
import './Provide/cart.dart';
import './Provide/CurrentIndexProvide.dart';


void main(){
  var counter = Counter();
  var childCategory = ChildCategory();
  var childCategoryNav  = ChildCategoryNav();
  var providers  = Providers();
  var detailsInfoProvide  = DetailsInfoProvide();
  var cartProvide = CartProvide();
  var currentIndexProvide = CurrentIndexProvide();
  providers
    ..provide(Provider<Counter>.value(counter))
    ..provide(Provider<ChildCategory>.value(childCategory))
    ..provide(Provider<ChildCategoryNav>.value(childCategoryNav))
    ..provide(Provider<CartProvide>.value(cartProvide))
    ..provide(Provider<CurrentIndexProvide>.value(currentIndexProvide))
    ..provide(Provider<DetailsInfoProvide>.value(detailsInfoProvide));
  runApp(ProviderNode(child:MyApp(),providers:providers));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

     final router = Router();
     Routes.configureRoutes(router);
     Application.router=router;

    return Container(
      child: MaterialApp(
        title:'百姓生活+',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor:Colors.blueAccent
        ),
        home:IndexPage()
      ),
    );
  }
}