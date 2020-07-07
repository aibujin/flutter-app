import "package:dio/dio.dart";
import 'dart:async';
import 'dart:io';
import '../utils/printUtils.dart';
import '../config/service_url.dart';

Future getHomePage() async {
    try{
          Response response;
          Dio dio = new Dio();
          var data = {          
            'keyword':'', 
            'pageIndex': 1,
            'sf': 0,
            'sm': 2,
            'topicId': 0,
            'movieId': 0,
            'roleId': 0,
            'categoryId1': 0,
            'categoryId2': 0,
            'brandId': 0,
            'fmin': 0,
            'fmax': 0,
            'salefid': 0,
            'cd': 0,
            'searchID': '5607187517DEE7CD5ED24A42BE8296B9',
            't': 202061213515280265
          };
          response = await dio.get(fl_app_path['home_page_url'],queryParameters:data);
          if(response.statusCode==200){
            return response.data;
          }else{
            throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
          }
    }catch(e){
      return print('ERROR:======>${e}');
    }
}



Future getCardPage() async {
    try{
          Response response;
          Dio dio = new Dio();
          dio.options.headers = {
              'Accept': 'application/json, text/javascript, */*; q=0.01',
              'Accept-Encoding': 'gzip, deflate',
              'Accept-Language': 'zh-CN,zh;q=0.9',
              'Connection': 'keep-alive',
              'Cookie': '_tt_=5ee03cd500fc8c04360c7b86; Hm_lvt_6c79b03c4a38f58353c660ab7687f9c5=1591753941,1591838695,1592182819,1592269574; Hm_lvt_e07949f61338e36deb5fc85107e6157b=1591753942,1591838696,1592182820,1592269575; session_id=02A266C80C89079C8527ED495A7B048C; noresult=true; searchID=C55B6A3FDE5CAABE12AD6031DC2E23C1; Hm_lpvt_6c79b03c4a38f58353c660ab7687f9c5=1592277838; Hm_lpvt_e07949f61338e36deb5fc85107e6157b=1592278056',
              'Host': ' mall.wv.mtime.cn',
              'Referer': 'http://mall.wv.mtime.cn/',
              'User-Agent': 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1',
              'X-Mtime-Wap-CheckValue': 'mtime'
          };
          dio.options.responseType = ResponseType.plain;
          response = await dio.get(fl_app_path['cart_page_url']);
          if(response.statusCode==200){
            return response.data;
          }else{
            throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
          }
    }catch(e){
      return print('ERROR:======>${e}');
    }
}


Future getCardRightPage(int index) async {
    try{
          Response response;
          Dio dio = new Dio();
          dio.options.responseType = ResponseType.plain;
           var data = {          
            'keyword':'', 
            'pageIndex': 1,
            'sf': 0,
            'sm': 2,
            'topicId': 0,
            'movieId': 0,
            'roleId': 0,
            'categoryId1': index,
            'categoryId2': 0,
            'brandId': 0,
            'fmin': 0,
            'fmax': 0,
            'salefid': 0,
            'cd': 0,
            'searchID': 'D58AFA7DAA728A20FDB6E27A7BE6A291',
            't': 202061817383916640
          };
          response = await dio.get(fl_app_path['cart_right_page_url'],queryParameters: data);
          if(response.statusCode==200){
            return response.data;
          }else{
            throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
          }
    }catch(e){
      return print('ERROR:======>${e}');
    }
}




Future getRecommendProduct() async {
    try{
          Response response;
          Dio dio = new Dio();
          dio.options.responseType = ResponseType.plain;
          response = await dio.get(fl_app_path['cart_recommendProducts']);
          if(response.statusCode==200){
            return response.data;
          }else{
            throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
          }
    }catch(e){
      return print('ERROR:======>${e}');
    }
}


Future getDetailInfo(String id) async {
    try{
          Response response;
          Dio dio = new Dio();
          dio.options.responseType = ResponseType.plain;
           var data = {          
            'goodsId': id,
            'locationId': 290,
            't': 2020711372169179
          };
          response = await dio.get(fl_app_path['details_url'],queryParameters: data);
          if(response.statusCode==200){
            return response.data;
          }else{
            throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
          }
    }catch(e){
      return print('ERROR:======>${e}');
    }
}

Future getDetailTextInfo(String id) async {
    try{
          Response response;
          Dio dio = new Dio();
          dio.options.responseType = ResponseType.plain;
           var data = {          
            'goodsId': id,
            'pageIndex': 1,
            't': 20207115335119929
          };
          response = await dio.get(fl_app_path['details_text_url'],queryParameters: data);
          if(response.statusCode==200){
            return response.data;
          }else{
            throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
          }
    }catch(e){
      return print('ERROR:======>${e}');
    }
}