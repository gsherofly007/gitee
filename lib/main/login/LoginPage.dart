import 'dart:math';

import 'package:flutter/material.dart';
import 'package:bruno/bruno.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gitee/main/mainPage.dart';
import 'package:gitee/model/UserAuthModel.dart';
import 'package:gitee/model/UserModel.dart';
import 'package:uikit/uikit.dart';
import 'package:gitee/api/UserApi.dart';
import 'package:gitee/data/userInfo/UserInfo.dart';
import 'package:gitee/main/home/HomePage.dart';
import 'package:gitee/main/mainPage.dart';
///@Description     登录页面
///@author          gs
///@create          2022-04-23 07:18 
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  SvgPicture logo = SvgPicture.asset(
    "assets/image/logo.svg",
    //动态改颜色
    // color:  Colors.red,
    //动态改大小
    width: 100, height: 50,
  );
  FocusNode nodeOne = FocusNode();
  FocusNode nodeTwo = FocusNode();

  String accountName = "";
  String accountPassword = "";
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        resizeToAvoidBottomInset:false,
      appBar: BrnAppBar(
        title:  const Text('登录',style: TextStyle(color: Colors.black,fontSize: 17.0,fontWeight: FontWeight.bold)),
         // backgroundColor: Colors.orange,
        automaticallyImplyLeading: false,
      ),
      // body: _loginWidget()
      body: GestureDetector(
            onTap: () {
                print("单击空白");
                nodeOne.unfocus();
                nodeTwo.unfocus();
             },
            child:Container(
              color: Colors.transparent,
              alignment: Alignment.topLeft,
              child:  _loginWidget(),)
      )
    );

  }
  // Widget  _loginWidget1(){
  //   return Center(
  //     child: Column(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children:_loginChildWidget(),
  //     ),
  //   );
  // }
  //
  // List<Widget>  _loginChildWidget(){
  //     return  [
  //       // logo,
  //       InputText(title: "账号",hint: "请输入账号",titleStyle: const TextStyle(color: Colors.grey,fontSize: 12.0),onInputSubmit:
  //           (String text){
  //         print("已输入文本"+text);
  //       },
  //         onTextChange:    (String text){
  //           print("文本变化"+text);
  //         },
  //         // focusNode: focusNode,
  //       ),
  //       const SizedBox(height: 10),
  //       InputText(title: "密码",hint: "请输入密码",onInputSubmit:
  //           (String text){
  //         print("已输入文本"+text);
  //       },
  //         onTextChange:    (String text){
  //           print("文本变化"+text);
  //         },
  //         // focusNode: focusNode,
  //       ),
  //
  //     ];
  // }
  List<Widget> _loginChild2Widget(){
      return [
         Expanded(
        child:
        Column(
          children:  <Widget>[
            const SizedBox(height: 20),
            InputText(title: "账号",hint: "请输入账号",textStyle: const TextStyle(color: Colors.grey,fontSize: 15.0),onInputSubmit:
            (String text){
               //print("已输入文本"+text);
              accountName = text;
            },
             onTextChange:    (String text){
                //print("文本变化"+text);
                accountName = text;
              },
             focusNode: nodeOne,
            ) ,
            const SizedBox(height: 10),
            InputText(title: "密码",textStyle: const TextStyle(color: Colors.grey,fontSize: 15.0),hint: "请输入密码",onInputSubmit:
                (String text){
              //print("已输入文本"+text);
              accountPassword = text;
            },
              onTextChange:    (String text){
                //print("文本变化"+text);
                accountPassword = text;
              },
              focusNode: nodeTwo,
            ),
            const SizedBox(height: 20),
            GSButton(title: "登录",width: 130,height: 50,bgColor: Colors.red,borderColor: Colors.transparent,
              tapCallBack: (){
                print("自定义按钮响应");
                _loginAction();

              },
            )
        ]

        ))
      ];
  }
  Widget _logoWidget(){
    return Container(
      padding: const EdgeInsets.only(top: 10.0),
      child: Center(
        child: logo,
      )
    );
  }
  Widget _loginPanelWidget(){
    return Container(
        padding: const EdgeInsets.only(top: 10.0,left: 30.0,right: 10.0),
        height: 250,
        color: Colors.transparent,
        child: Row(children:_loginChild2Widget(),

        )
    );
  }
  //登录界面
  Widget _loginWidget(){
      return Container(
        padding: const EdgeInsets.only(top: 80.0),
        //child: Column(children: [_logoWidget()]),
         child: Column(children: [_logoWidget(),_loginPanelWidget()]),
      );
  }
  //登录操作
  _loginAction(){

    //判断是否为空
    if( accountName.isEmpty || accountPassword.isEmpty ){
      BrnToast.show("账号或密码输入不完整，请检查", context);
      return;
    }
    accountName = "gsherofly@gmail.com";
    accountPassword = "gs123456";
    print("accountName"+accountName +" accountPassword" + accountPassword);
    UserApi.login(
        accountName,
        accountPassword,
        (Object model){
          //登录成功
          UserAuthModel uModel = model as UserAuthModel;
          UserInfo().userAuth = uModel;
          UserInfo().saveUserAuthData();
          print("接口请求用户资料");
          UserApi.getUsrProfile((Object model1) {
            UserModel uModel1 = model1 as UserModel;
            UserInfo().user = uModel1;
            UserInfo().saveUserData();
            Navigator.of(context).pop();
            Navigator.of(context).push(
                MaterialPageRoute(
                    fullscreenDialog: true,
                    builder: (context) {
                      return MainPageApp();
                    }
                )
            );

          }, (Object error) {

          });

        },
        (Object error){
          String err = error.toString();
          // print("code:"+ error.hashCode.toString() +"详情"+error.toString());
          BrnToast.show(err, context);
        }
    );
  }
}


  