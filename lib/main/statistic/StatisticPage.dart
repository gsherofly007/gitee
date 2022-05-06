import 'package:flutter/material.dart';
import 'package:bruno/bruno.dart';
///@Description     统计 
///@author          gs
///@create          2022-04-22 10:17 
class StatisticPage extends StatefulWidget {
  const StatisticPage({Key? key}) : super(key: key);

  @override
  _StatisticPageState createState() => _StatisticPageState();
}

class _StatisticPageState extends State<StatisticPage>  with AutomaticKeepAliveClientMixin {

  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BrnAppBar(
        title:  Text('关注',style: Theme.of(context).appBarTheme.titleTextStyle),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}