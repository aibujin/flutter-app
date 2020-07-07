class CategoryTypeModel{

  int goodsId;
  String name;
  String image;
  String longName;

  CategoryTypeModel({this.goodsId,this.name,this.image,this.longName});

  factory CategoryTypeModel.fromJson(dynamic json){
     return CategoryTypeModel(
       goodsId: json['goodsId'],
       name: json['name'],
       image: json['image'],
       longName: json['longName'],
     );
  }

}


class CategoryTypeListModel{

   List<CategoryTypeModel> list;
   CategoryTypeListModel(this.list);

   factory CategoryTypeListModel.fromJson(List json){
      return CategoryTypeListModel(
        json.map((e) => CategoryTypeModel.fromJson(e)).toList()
      );
   }
}