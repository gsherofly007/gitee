
import 'package:flutter/material.dart';
import 'package:bruno/bruno.dart';
import 'package:gitee/main/home/HomePage.dart';
import 'package:gitee/main/launchPage/launchPage.dart';
import 'package:gitee/main/notice/NoticePage.dart';
import 'package:gitee/main/statistic/StatisticPage.dart';
import 'package:gitee/main/mine/MinePage.dart';
import 'package:gitee/data/userInfo/UserInfo.dart';
import 'package:gitee/theme/config_theme.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:gitee/main/mainPage.dart';
class GiteeApp extends StatefulWidget {
  const GiteeApp({Key? key, required this.isLogin}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final bool isLogin;

  @override
  State<GiteeApp> createState() => _GiteeAppState();
}

class _GiteeAppState extends State<GiteeApp> {
  int _counter = 0;
  var titles = ['首页', '私信', '统计', '我的'];

  /// 选中的index
  int _selectedIndex = 0;

  // int  _currentSelectIndex = 0;
  /// 未读消息数量
  String? badgeNo1;
  List<Widget>? _pageList;
  late PageController _pageController;

  //第一步：创建PageController 并制定初始选中页面
  PageController _controller = PageController(initialPage: 0); // 页面控制器
  @override
  void initState() {
    super.initState();
    _pageList = [
      HomePage(title: titles[0],
          header: const ClassicHeader(refreshStyle: RefreshStyle.Follow)),
      NoticePage(title: titles[1],header: const ClassicHeader(refreshStyle: RefreshStyle.Follow),),
      StatisticPage(),
      MinePage()
    ];
    _pageController = PageController(initialPage: _selectedIndex);
  }

  /// 选中状态时state设置
  void _onItemSelected(int index) {
    setState(() {
      /// 置为当前选中item的索引值
      _selectedIndex = index;

      /// 选中后未读消息的数量
      badgeNo1 = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    if (!widget.isLogin) {
      return _LoginWidget();
    }
    //return _MainWidget(context);
    return Scaffold(
      body: MainPageApp()
    );
  }

  Widget _LoginWidget() {
    // return Scaffold(
    //   body: Center(
    //     child: Column(
    //
    //     )
    //   ),
    // );
    return MaterialApp(
        title: 'Flutter Example',
        theme: ThemeData(
          primarySwatch: Colors.grey,
        ),
        home: LaunchPage() //const LoginPage(),
    );
  }

  //主页面
  Widget _MainWidget(BuildContext context) {
    return Scaffold(

      /// 首先定义一个BottomTabBar容器
        bottomNavigationBar: BrnBottomTabBar(
          // 选中item后的颜色
          fixedColor: Theme
              .of(context)
              .tabBarTheme
              .labelColor,
          //const Color(0xFF0984F9),
          // 当前选中的item索引值
          currentIndex: _selectedIndex,
          // item点击事件
          onTap:
              (index) {
            setState(() {
              _selectedIndex = index;
              //页面控制器进行转跳
              _pageController.jumpToPage(index);
            });
          },
          // 未读信息背景颜色
          badgeColor: Colors.red,

          type: BrnBottomTabBarDisplayType.fixed,
          isAnimation: false,
          // 定义itemLists
          items: <BrnBottomTabBarItem>[
            // 定义每个BottomTabBarItem，子属性请看源码
            BrnBottomTabBarItem(
              icon: const Image(
                  image: AssetImage("assets/icons/navbar_house.png")),
              activeIcon: Image(
                image: AssetImage("assets/icons/navbar_house.png"),
                color: Theme
                    .of(context)
                    .tabBarTheme
                    .labelColor, //Colors.orange,
              ),
              title: Text(titles[0]),
              badgeNo: badgeNo1,
              //  selectedTextStyle: const TextStyle(color: Colors.red),
              // unSelectedTextStyle: const TextStyle(color: Colors.deepPurple)
              // selectedTextStyle:TextStyle(color: Theme.of(context).tabBarTheme.labelColor),
              // unSelectedTextStyle: TextStyle(color: Theme.of(context).tabBarTheme.unselectedLabelColor),
            ),
            BrnBottomTabBarItem(
                icon: const Image(
                    image: AssetImage("assets/icons/navbar_house.png")),
                activeIcon: Image(
                  image: const AssetImage("assets/icons/navbar_house.png"),
                  color: Theme
                      .of(context)
                      .tabBarTheme
                      .labelColor,
                ),
                title: Text(titles[1])),
            BrnBottomTabBarItem(
                icon: const Image(
                    image: AssetImage("assets/icons/navbar_house.png")),
                activeIcon: Image(
                  image: AssetImage("assets/icons/navbar_house.png"),
                  color: Theme
                      .of(context)
                      .tabBarTheme
                      .labelColor,
                ),
                title: Text(titles[2])),
            BrnBottomTabBarItem(
                icon: const Image(
                    image: AssetImage("assets/icons/navbar_house.png")),
                activeIcon: Image(
                  image: AssetImage("assets/icons/navbar_house.png"),
                  color: Theme
                      .of(context)
                      .tabBarTheme
                      .labelColor,
                ),
                title: Text(titles[3])),
          ],
        ),
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _pageController,
          children: _pageList!,
        )
      // _buildVBodyWidget(),
    );
  }
}