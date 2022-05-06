import 'BaseHttpRequest.dart';
import 'httpInterface.dart';
import 'package:gitee/model/UserAuthModel.dart';
import 'package:gitee/model/UserModel.dart';
import 'package:foundation/foundation.dart';
import 'dart:convert';
import 'package:gitee/data/userInfo/UserInfo.dart';

//用户相关api
class UserApi{
  //登录认证
  static Future<UserAuthModel?> login(String accountName,String accountPassword, Param1Callback success,Param1Callback fail) async {

     BaseHttpRequest.postRequest(kLoginApi, {"grant_type":"password",
             "username":accountName,
             "password":accountPassword,
             "client_id":kClientId,
             "client_secret":kClientSecret,
             "scope":"user_info projects pull_requests issues notes keys hook groups gists enterprises"
           } ,(data){

              // Map<String, dynamic> map = jsonDecode(data.toString());
              Map<String,dynamic> map = data  as Map<String,dynamic>;
              UserAuthModel userAuthModel = UserAuthModel.fromJson(map);
              success(userAuthModel);
      }, (err) {
        fail(err);
      });
      return null;

  }
  //获取用户授权资料
  static getUsrProfile(Param1Callback success,Param1Callback fail){
    BaseHttpRequest.getRequest(kMyUserProfileApi, {
      "access_token":UserInfo().userAuth?.accessToken
    } ,(data){
      Map<String,dynamic> map = jsonDecode(data.toString());
      UserModel userAuthModel = UserModel.fromJson(map);
      success(userAuthModel);
    }, (err) {
      fail(err);
    });
    return null;
  }
  //刷新token
  static getRefreshToken(Param1Callback success,Param1Callback fail){
    BaseHttpRequest.getRequest(kLoginApi, {
      "grant_type":"refresh_token",
      "access_token":UserInfo().userAuth?.accessToken
    } ,(data){
      Map<String,dynamic> map = jsonDecode(data.toString());
      UserModel userAuthModel = UserModel.fromJson(map);
      success(userAuthModel);
    }, (err) {
      fail(err);
    });
    return null;
  }
}
