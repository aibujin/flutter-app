
import 'dart:convert';

import 'package:flutter/material.dart';
import '../model/details.dart';
import '../service/service_method.dart';
import '../model/details_text.dart';

class DetailsInfoProvide with ChangeNotifier{

  DetailsModel detailsModel = null;
  DetailsTextModel detailsTextModel = null;

  bool isLeft = true;
  bool isRight = false;

  getGoodsInfo(String id) async {
   await getDetailInfo(id).then((value){
         var data = json.decode(value.toString());
         print(data);
         this.detailsModel = DetailsModel.fromJson(data['data']['productDetail']['goods']);
         notifyListeners();
    });
  }

  getGoodsTextInfo(String id) async {
   await getDetailTextInfo(id).then((value){
         var data = json.decode(value.toString());
         print(data);
         this.detailsTextModel = DetailsTextModel.fromJson(data['contentList']);
         notifyListeners();
    });
  }

  changeLeftAndRight(String changeState){
    if(changeState=='left'){
      isLeft=true;
      isRight=false;
    }else{
      isLeft=false;
      isRight=true;
    }
    notifyListeners();
  }

}