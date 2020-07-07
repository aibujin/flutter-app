class DetailsModel{
  int goodsId;
  int marketPrice;
  String postAgeText;
  String longName;
  List imageRects;
  String note;

  DetailsModel({this.goodsId,this.marketPrice,this.postAgeText,this.longName,this.imageRects,this.note});

  factory DetailsModel.fromJson(dynamic json){
     return DetailsModel(
       marketPrice: json['marketPrice'],
       postAgeText: json['postAgeText'],
       longName: json['longName'],
       imageRects: json['imageRects'],
       note: json['note'],
       goodsId: json['goodsId'],
     );
  }

}