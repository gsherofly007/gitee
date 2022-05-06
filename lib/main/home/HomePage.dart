import 'package:flutter/material.dart'
      hide RefreshIndicator, RefreshIndicatorState;
import 'package:gitee/data/userInfo/UserInfo.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:gitee/main/home/Item.dart';
import 'package:bruno/bruno.dart';
import 'package:gitee/api/UserDynamicsApi.dart';
import '../../model/UserEventModel.dart';
import 'package:gitee/main/home/DetailPage.dart';
///@Description     首页 
///@author          gs
///@create          2022-04-22 10:15
class HomePage extends StatefulWidget  {
  final String? title;

  final Widget? header;

  final Widget? footer;

  final bool enableOverScroll;
  final bool reverse;

    HomePage(
      { this.title,
         this.header,
        this.reverse: false,
         this.footer,
        this.enableOverScroll: true});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _IndicatorActivityState();
  }
}

class _IndicatorActivityState extends State<HomePage> with AutomaticKeepAliveClientMixin {

  @override
  bool get wantKeepAlive => true;

  List<Widget> items = [];
  late RefreshController _refreshController;
  String? _prevId;//最后一条id
  void _init() {
    // for (int i = 0; i < 15; i++) {
    //   items.add(Item(
    //     title: "Data$i",
    //   ));
    // }


  }

  late ScrollController _scrollController;

  @override
  void initState() {
    // TODO: implement initState
    _scrollController = ScrollController();
    _refreshController = RefreshController();
    Future.delayed(const Duration(milliseconds: 3000)).then((_) {
//      _jumpTo(0.0);
        _onRefresh();

    });
    _init();

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: BrnAppBar(
        title:  Text('首页',style: Theme.of(context).appBarTheme.titleTextStyle),
         backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
         automaticallyImplyLeading: false,
      ),
      body: Builder(
        builder: (c) {
          return SmartRefresher(
              child: ListView.builder(
                itemBuilder: (c, i) => items[i],
                itemExtent: 100.0,
                controller: _scrollController,
                reverse: widget.reverse,
                itemCount: items.length,
              ),
              onRefresh: _onRefresh,
              onLoading: () {
                _onLoading(c);
              },
              header: widget.header,
              footer: widget.footer,
              enablePullDown: true,
              enablePullUp: true,
              controller: _refreshController);
        },
      ),
    );
  }
  //获取最新数据
  _onRefresh() {
    print("onRefresh");

    UserDynamicsApi.getUserDynamic(_prevId, (value) {
      List list = value as List;
      for(int i=0;i<list.length;i++){
          UserEventModel eventModel = list[i];
          items.add(Item(eventModel: eventModel,clickCallback: (model){
                print("响应1");
                _clickItem(model as UserEventModel);
          },));
      }
      if(list.isNotEmpty){
        UserEventModel eventModel = list[list.length - 1];
        _prevId = eventModel.id.toString();
      }

         if (mounted) setState(() {});
         _refreshController.refreshCompleted();

    }, (Object error){
      String err = error.toString();
      print("code:"+ error.hashCode.toString() +"详情"+error.toString());
      BrnToast.show(err, context);
      _refreshController.refreshCompleted();
    }
    );
    // Future.delayed(Duration(milliseconds: 1000)).then((_) {
    //
    //   items.add(Item(title: "Data"));
    //   if (mounted) setState(() {});
    //   _refreshController.refreshCompleted();
    // });
  }
  //加载历史数据
  _onLoading(BuildContext context) {
    print("onLoading");
    Future.delayed(Duration(milliseconds: 1000)).then((_) {
      _refreshController.loadComplete();
    });
  }
  //点击item响应
  _clickItem(UserEventModel model){
      print("item响应");
      var userName = UserInfo().user?.name;
      var repoName = model.repo?.fullName?.replaceAll(userName! + "/", "");
      var url = model.repo?.url!;
       url = url?.replaceAll("api/v5/repos/", "");
      print("节点名称:"+repoName!);
      print("地址:"+url!);
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => DetailPage(arguments:  {"title":repoName,"url":url}),
      ));
  }
}
