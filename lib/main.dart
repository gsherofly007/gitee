
import 'package:flutter/material.dart';
import 'package:gitee/app.dart';
import 'package:bruno/bruno.dart';
import 'package:gitee/theme/config_theme.dart';
import 'package:gitee/data/userInfo/UserInfo.dart';
import 'package:gitee/main/notice/NoticePage.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {


  realRunApp();
  //runApp(const MyApp( isLogin: true));
}
void realRunApp() async{
  WidgetsFlutterBinding.ensureInitialized();

  UserInfo().getUserAuthData(() {
    bool isLogin = false;
    if(UserInfo().userAuth != null){
      isLogin = true;
    }
     // isLogin = false;
    runApp(MyApp( isLogin: isLogin));
  });

}
class MyApp extends StatelessWidget {
  const MyApp({Key? key,required this.isLogin}) : super(key: key);
  final bool isLogin;//是否已登录
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
      // BrnInitializer.register(allThemeConfig:ConfigTheme.defaultAllConfig);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        primarySwatch: Colors.blue,
        primaryColor: Colors.green,//字体颜色
          appBarTheme: const AppBarTheme(
              color: Colors.blueGrey,
              titleTextStyle: TextStyle(color: Colors.white,fontSize: 17.0,fontWeight: FontWeight.bold)

          ),
          // 7.Text的主题
          textTheme: const TextTheme(
            bodyText1: TextStyle(fontSize: 16, color: Colors.red),
            bodyText2: TextStyle(fontSize: 20),

          ),
          tabBarTheme: const TabBarTheme(
               labelColor: Colors.black,
               unselectedLabelColor: Colors.grey,
              // bodyText1: TextStyle(fontSize: 16, color: Colors.red),
              // bodyText2: TextStyle(fontSize: 20),
              // caption: TextStyle(fontSize: 17, color: Colors.white)
          ),
    ),

      // home: const NoticePage()
      home: GiteeApp(isLogin: isLogin),
        // initialRoute: '/',
        // routes:{
        //     "/homeDetail":(context)=>DetailPage(),
        // }
    );
  }
}

