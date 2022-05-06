import 'BaseHttpRequest.dart';
import 'httpInterface.dart';
import 'package:dio/dio.dart';
import 'package:gitee/model/UserEventModel.dart';
import 'package:foundation/foundation.dart';
import 'dart:convert';
import 'package:gitee/data/userInfo/UserInfo.dart';
///@Description     用户动态
///@author          gs
///@create          2022-04-26 10:28
///
//用户动态相关api
class UserDynamicsApi{
    /*  获取用户动态
    *   preId 最后一条记录id
    *   success 成功
    *   fail  失败
    * */
    static getUserDynamic(String? prevId,Param1Callback success,Param1Callback fail) async{
      String? accountName = UserInfo().user?.login;
      String? token = UserInfo().userAuth?.accessToken;
      if(token == null){
        fail("无效token");
        return;
      }
      String api = kUserEvents.replaceAll("{username}", accountName!);

      BaseHttpRequest.getRequest(api,
          {
             "access_token":token,
               "prev_id":prevId,
              "limit":"20"
          },(data){
        List<Map<String, dynamic>> list = jsonDecode(data.toString()).cast<Map<String, dynamic>>();

        //Map<String,dynamic> map = jsonDecode(data.toString());
        var itemList = [];
        for(int i=0;i<list.length;i++){
           // String value = list[i] ;
           print("index=$i");
           Map<String,dynamic> map = list[i];//jsonDecode(value);
           UserEventModel eventModel = UserEventModel.fromJson(map);
           itemList.add(eventModel);
        }
        success(itemList);
      }, (err) {
        fail(err);
      });
    }
}