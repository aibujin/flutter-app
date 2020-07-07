class DetailsTextModel{

  List contentList;

  DetailsTextModel({this.contentList});

  factory DetailsTextModel.fromJson(dynamic json){
     return DetailsTextModel(
       contentList: json['contentList']
     );
  }

}