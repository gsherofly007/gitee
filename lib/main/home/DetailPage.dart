
import 'package:flutter/material.dart';

import 'package:flutter_inappwebview/flutter_inappwebview.dart';
///@Description     详情
///@author          gs
///@create          2022-04-22 10:15
class DetailPage extends StatefulWidget {

   Map arguments;
   DetailPage({required this.arguments});
  // DetailPage({Key key,this.arguments}) : super(key: key);
  // DetailPage({ this.title,this.url});

  _DetailPageState createState() => _DetailPageState(arguments);
}

class _DetailPageState extends State<DetailPage> {
   bool _flag=true;
   String? title;
   String? url;
   final Map arguments;
  _DetailPageState(this.arguments);
  @override
  void initState() {
    // TODO: implement initState
    title = arguments["title"];
    url = arguments["url"];
    super.initState();
     // print(this.arguments);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(title!)
        ),
        body:Column(
          children: <Widget>[
            // this._flag?_getMoreWidget():Text(""),
            Expanded(
              child: InAppWebView(
                initialUrlRequest:URLRequest(url: Uri.parse(url!)),
                onProgressChanged: (InAppWebViewController controller, int progress) {
                  print(progress/100);
                  if((progress/100)>0.999){
                    setState(() {
                      this._flag=false;
                    });
                  }
                },
              ),
            )
          ],
        )
    );
  }
  //加载中的圈圈
  Widget _getMoreWidget() {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              '加载中...',
              style: TextStyle(fontSize: 16.0),
            ),
            CircularProgressIndicator(
              strokeWidth: 1.0,
            )
          ],
        ),
      ),
    );
  }
}

