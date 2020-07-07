class  CategoryListNavModel {

  int categoryId;
  String name;

  CategoryListNavModel({
     this.categoryId,
     this.name,
  });

  factory CategoryListNavModel.fromJson(dynamic json){
     return CategoryListNavModel(
       categoryId: json['categoryId'],
       name:json['name']
     );
  }

}

class CategoryListNavListModel {

  List<CategoryListNavModel> data;
  CategoryListNavListModel(this.data);
  factory CategoryListNavListModel.formJson(List json){
    return CategoryListNavListModel(
      json.map((i)=>CategoryListNavModel.fromJson((i))).toList()
    );
  }

}