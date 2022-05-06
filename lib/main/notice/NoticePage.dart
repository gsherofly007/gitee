import 'package:flutter/material.dart';
import 'package:bruno/bruno.dart';
import 'package:gitee/api/UserMessageApi.dart';
import 'package:gitee/main/notice/NoticeItem.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:gitee/model/UserMessageListModel.dart';
///@Description     关注 
///@author          gs
///@create          2022-04-22 10:17 
class NoticePage extends StatefulWidget {
  // const NoticePage({Key? key}) : super(key: key);
  final String? title;
  final Widget? header;
  final Widget? footer;
  final bool enableOverScroll;
  final bool reverse;
   NoticePage(
      { this.title,
        this.header,
        this.reverse: false,
        this.footer,
        this.enableOverScroll: true});

  @override
  _NoticePageState createState() => _NoticePageState();
}

class _NoticePageState extends State<NoticePage> with AutomaticKeepAliveClientMixin {

  @override
  bool get wantKeepAlive => true;

  List<Widget> items = [];
  late RefreshController _refreshController;
  late ScrollController _scrollController;
  UserMessageListModel? model;
  @override
  void initState() {
    // TODO: implement initState
    _scrollController = ScrollController();
    _refreshController = RefreshController();
    Future.delayed(const Duration(milliseconds: 1000)).then((_) {
//      _jumpTo(0.0);
       _onRefresh();

    });

    super.initState();
  }
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: BrnAppBar(
  //       title:  Text('私信',style: Theme.of(context).appBarTheme.titleTextStyle),
  //       backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
  //       automaticallyImplyLeading: false,
  //       // brightness: Theme.of(context).brightness,
  //     ),
  //     body: SingleChildScrollView(
  //       child: Column(
  //         children: [],
  //       ),
  //     ),
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: BrnAppBar(
        title:  Text(widget.title!,style: Theme.of(context).appBarTheme.titleTextStyle),
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
                //_onLoading(c);
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
    UserMessageApi.getAllMessages((value) {
      model = value as UserMessageListModel;
      int length = model?.list?.length ?? 0;
      for(int i = 0; i < length;i++){
        UserMessageModel? messagemodel = model?.list![i] ;
        items = [];
        items.add(NoticeItem(model:messagemodel!,clickCallback: (model){
          print("响应1");
          // _clickItem(model as UserEventModel);
        },));
      }
      if(mounted){
        setState((){
        });
      }
      _refreshController.refreshCompleted();
    }, (error) {
      String err = error.toString();
      print("code:"+ error.hashCode.toString() +"详情"+error.toString());
      BrnToast.show(err, context);
      _refreshController.refreshCompleted();

    });
  }
}