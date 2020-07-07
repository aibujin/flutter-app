import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import '../page/details_page.dart';


Handler detailsHanderl =Handler(
  handlerFunc: (BuildContext context,Map<String,List<String>> params){
    String goodsId = params['id'].first;
    return DetailsPage(goodsId);
  }
);