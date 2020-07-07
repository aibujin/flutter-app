
import 'dart:convert';

import 'package:flutter/material.dart';
import '../model/catagory_list.dart';


class ChildCategory  with ChangeNotifier {
  
  int page = 0;

  List<CategoryListModel> childCategoryList = [];

  getChildCategory(List<CategoryListModel> list){
    page = 1;
    childCategoryList = list; 
    notifyListeners();
  }


}