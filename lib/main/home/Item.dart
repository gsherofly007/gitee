/*
 * Author: Jpeng
 * Email: peng8350@gmail.com
 * Time: 2019/5/7 下午12:22
 */
import 'package:flutter/material.dart';
import 'package:foundation/foundation.dart';
import '../../model/UserEventModel.dart';

class Item extends StatefulWidget {
   // final String title;
   final UserEventModel eventModel;
   final Param1Callback clickCallback;//点击item回调
  // Item({required this.title});
   Item({required this.eventModel,required this.clickCallback});

  @override
  _ItemState createState() => _ItemState();
}

class _ItemState extends State<Item> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:  Card(
        margin: EdgeInsets.only(left: 15.0, right: 15.0, top: 5.0, bottom: 0.0),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),//设置圆角
        child: GestureDetector(

          child: Container(
            color:Colors.transparent,
            child: _containerView(),
          ),
          onTap: (){
            print("已点击");
            widget.clickCallback(widget.eventModel);
          },
        ),
        //_containerView(),

        shadowColor:Colors.transparent,
        color: Colors.white70 ,

      ),
      height: 100.0,

    );
  }
  Widget _containerView(){
    return Container(
        child:  Container(
            child: Row(children: <Widget>[
            ClipRRect(//是ClipRRect，不是ClipRect
              borderRadius: BorderRadius.circular(25/2),

              child:
                  Image.network(
                    widget.eventModel.actor!.avatarUrl!,
                    fit: BoxFit.fitWidth,
                    width: 25,
                    height: 25,
                    ),
            ),
             SizedBox(width: 15,),
              Expanded(
                child:  Align(
                     alignment: Alignment.topLeft,

                    child: Container(
                     // color: Colors.green,


                      child: Column(

                      children:
                      [
                        Container(
                            alignment: Alignment.topLeft,
                          // color: Colors.blue,
                          // height: 40,
                          constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width-100),
                            //color: Colors.blue,
                          child: Text.rich(
                              TextSpan(
                                text: "仓库:",
                                style: TextStyle(
                                    fontSize: 15.0,
                                    color: Colors.black54,
                                ),
                                children: [
                                  TextSpan(
                                    text: Strings.autoLineString(widget.eventModel.repo!.fullName!),
                                     style: TextStyle(
                                         fontSize: 15.0,
                                         color: Colors.grey,
                                     )
                                  )
                                ]
                              )
                          )
                        ),
                        const SizedBox(height: 5,),
                        Container(
                          // color: Colors.red,
                            alignment: Alignment.topLeft,
                          constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width-100),
                            child:
                            Text.rich(
                                TextSpan(
                                    text: "简介:",
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      color: Colors.black54,
                                    ),
                                    children: [
                                      TextSpan(
                                          text: _restrictStr(widget.eventModel.payload?.description) ?? "无",
                                          style: TextStyle(
                                            fontSize: 12.0,
                                            color: Colors.grey,
                                          )
                                      )
                                    ]
                                )
                            )
                        )

                      ],
                    ),
                  )
              )
              ),
            ]
          ),
          margin: EdgeInsets.all(10),

        )

    );
  }
  String? _restrictStr(String? text){
      if(text != null){
         if(text.length > 50){
            return text.substring(0,50)+"...";
         }
      }
      return null;
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
