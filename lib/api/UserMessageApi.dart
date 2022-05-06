import 'BaseHttpRequest.dart';
import 'httpInterface.dart';
import 'package:dio/dio.dart';
import 'package:gitee/model/UserMessageListModel.dart';
import 'package:foundation/foundation.dart';
import 'dart:convert';
import 'package:gitee/data/userInfo/UserInfo.dart';
///@Description     用户动态
///@author          gs
///@create          2022-04-26 10:28
///
//用户相关私信消息api
class UserMessageApi {
  //获取所有消息
  static getAllMessages(Param1Callback success,Param1Callback fail) async{
    String? accountName = UserInfo().user?.login;
    String? token = UserInfo().userAuth?.accessToken;
    if(token == null){
      fail("无效token");
      return;
    }
    String api = kMessagesApi;

    BaseHttpRequest.getRequest(api,
        {
          "access_token":token,

        },(data){
          // Map<String, dynamic> list = jsonDecode(data.toString()).cast<Map<String, dynamic>>();

          Map<String,dynamic> map = jsonDecode(data.toString());
          UserMessageListModel model = UserMessageListModel.fromJson(map);
          success(model);
          // var itemList = [];
          // for(int i=0;i<list.length;i++){
          //   // String value = list[i] ;
          //   print("index=$i");
          //   Map<String,dynamic> map = list[i];//jsonDecode(value);
          //   UserEventModel eventModel = UserEventModel.fromJson(map);
          //   itemList.add(eventModel);
          // }
          // success(itemList);
        }, (err) {
          fail(err);
        });
  }
}