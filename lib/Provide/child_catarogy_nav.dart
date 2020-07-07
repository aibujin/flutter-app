
import 'package:flutter/material.dart';
import '../model/catagory_list_nav.dart';


class ChildCategoryNav  with ChangeNotifier {

  List<CategoryListNavModel> categoryListNavModel = [];
  int childIndex= 0;

  getChildCategory(List<CategoryListNavModel> list){
    childIndex = 0;
    categoryListNavModel = list; 
    categoryListNavModel.forEach((e) => print(e.categoryId));
    notifyListeners();
  }

  changeChildIndex(index){
      childIndex=index;
      notifyListeners();
  }


}