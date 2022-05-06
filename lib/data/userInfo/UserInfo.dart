import 'package:flutter/material.dart';
import 'package:gitee/model/UserAuthModel.dart';
import 'package:gitee/model/UserModel.dart';
import 'package:path_provider/path_provider.dart';
import 'package:gitee/utils/FileHandle.dart';
import 'package:gitee/base/MacroDefine.dart';
import 'dart:convert';
import 'package:foundation/foundation.dart';

///@Description     gitee用户信息 
///@author          gs
///@create          2022-04-26 10:28
///

class UserInfo{

   UserAuthModel? userAuth;//用户认证信息(登录后)
   UserModel? user;//用户相关model

  // static _instance，_instance会在编译期被初始化，保证了只被创建一次
  static final UserInfo _instance = UserInfo._internal();

  //提供了一个工厂方法来获取该类的实例
  factory UserInfo(){
    return _instance;
  }

  // 通过私有方法_internal()隐藏了构造方法，防止被误创建
  UserInfo._internal(){
    // 初始化
    init();
  }
  // Singleton._internal(); // 不需要初始化

  void init(){
      print("userInfo初始化");
      getUserAuthData((){});
      getUserData(() { });
  }
  //保存登录数据
  void saveUserAuthData(){
      if (userAuth != null){
        Map<String, dynamic> map = userAuth!.toJson();
        String json = jsonEncode(map);

        FileHandle.writeFile(json,userAuthFileName).then((bool ret) {
        });
      }
  }
  //获取登录数据
   void getUserAuthData(Param0Callback callback){
       FileHandle.readFile(userAuthFileName).then((String? data){
           if(data != null){
             Map<String, dynamic> map = jsonDecode(data);
             userAuth = UserAuthModel.fromJson(map);
             callback();
           }else{
             callback();
           }
       });
  }
   //保存登录数据
   void saveUserData(){
     if (user != null){
       Map<String, dynamic> map = user!.toJson();
       String json = jsonEncode(map);
       FileHandle.writeFile(json,userFileName).then((bool ret) {
       });
     }
   }
   //获取登录数据
   void getUserData(Param0Callback callback){
     FileHandle.readFile(userFileName).then((String? data){
       if(data != null){
         Map<String, dynamic> map = jsonDecode(data);
         user = UserModel.fromJson(map);
         callback();
       }else{
         callback();
       }
     });
   }
   //重置用户数据
   void resetUserData(){
      FileHandle.deleteFile(userFileName);
      userAuth = null;
   }
}


