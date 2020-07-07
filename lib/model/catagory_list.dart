class  CategoryListModel {

  int goodsId;
  String imageSrc;
  String name;

  CategoryListModel({
     this.goodsId,
     this.imageSrc,
     this.name
  });

  factory CategoryListModel.fromJson(dynamic json){
     return CategoryListModel(
       goodsId: json['goodsId'],
       imageSrc:json['imageSrc'],
       name:json['name'],
     );
  }

}

class CategoryListsModel {

  List<CategoryListModel> data;
  CategoryListsModel(this.data);
  factory CategoryListsModel.formJson(List json){
    return CategoryListsModel(
      json.map((i)=>CategoryListModel.fromJson((i))).toList()
    );
  }

}