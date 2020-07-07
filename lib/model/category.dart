class  CategoryBigModel {

  String iconTitle;
  String image;
  String url;

  CategoryBigModel({
     this.iconTitle,
     this.image,
     this.url
  });

  factory CategoryBigModel.fromJson(dynamic json){
     return CategoryBigModel(
       iconTitle: json['iconTitle'],
       image:json['image'],
       url:json['url'],
     );
  }

}

class CategoryBigListModel {

  List<CategoryBigModel> data;
  CategoryBigListModel(this.data);
  factory CategoryBigListModel.formJson(List json){
    return CategoryBigListModel(
      json.map((i)=>CategoryBigModel.fromJson((i))).toList()
    );
  }

}