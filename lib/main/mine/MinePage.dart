import 'package:flutter/material.dart';
import 'package:bruno/bruno.dart';
import 'package:gitee/data/userInfo/UserInfo.dart';
import 'package:uikit/uikit.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:gitee/main/login/LoginPage.dart';
///@Description     我的 
///@author          gs
///@create          2022-04-22 10:16 
class MinePage extends StatefulWidget {
  const MinePage({Key? key}) : super(key: key);

  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> with AutomaticKeepAliveClientMixin {

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    //设置尺寸（填写设计中设备的屏幕尺寸）如果设计基于360dp * 690dp的屏幕
    ScreenUtil.init(context,designSize: Size(2532, 1170), allowFontScaling: false);

    return Scaffold(
      appBar: BrnAppBar(
        title:  Text('我的',style: Theme.of(context).appBarTheme.titleTextStyle),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
          physics:const AlwaysScrollableScrollPhysics(),
        child: Column(

          children:
          [
            Container(
            height: ScreenUtil().setHeight(1170-350),
            // color: Colors.blue,
             alignment: Alignment.topLeft,
             child:
          // Expanded(
          // child:
          Row(
              children:[
                SizedBox(height: 100,),
                ClipRRect(//是ClipRRect，不是ClipRect
                  borderRadius: BorderRadius.circular(25/2),

                  child:
                  Padding(
                    padding: EdgeInsets.all(10),
                    child:
                    ClipRRect(//是ClipRRect，不是ClipRect
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        UserInfo().user!.avatarUrl!,
                        fit: BoxFit.fitWidth,
                        width: 40,
                        height: 40,
                      ),
                    ),),

                ),
                Padding(
                    padding:EdgeInsets.only(left: 20),
                    child:  Text(
                        UserInfo().user!.name!,
                        style: TextStyle(
                                        fontSize: 16,
                        )

                    ),

                )
               ]
            ),
          ),
          //
          // ),
            Container(  //始终位于页面底部
              // color: Colors.red,
              child:  Column(children: [
                 // const SizedBox(height: 20),
                 GSButton(title: "退出",width: 200,height: 50,bgColor: Colors.red,borderColor: Colors.transparent,
                tapCallBack: (){
                     print("自定义按钮响应");
                     _logoutOutClick();

                },)]
            ))
          ],
        ),

      ),
    );
  }
  // //退出视图
  // Widget logoutView(){
  //   return
  // }
  //退出操作
  _logoutOutClick(){

     Alert.show(context, "提示", "是否退出?", () {
        UserInfo().resetUserData();
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const LoginPage(),
        ));
     }, () {

     });
  }

}