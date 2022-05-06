import 'dart:ffi';

import 'package:flutter/material.dart';

///@Description     文件操作 
///@author          gs
///@create          2022-04-26 17:07 
import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
//文件处理相关
class FileHandle{
  //获取文件句柄
  static Future<File> _getLocalFile(String fileName) async {
    // 获取应用目录
    String dir = (await getApplicationDocumentsDirectory()).path;
    return File('$dir/$fileName');
  }

  //读取文件
  static Future<String?> readFile(String fileName) async {
    try {
      File file = await _getLocalFile(fileName);
      // 读取点击次数（以字符串）
      String contents = await file.readAsString();
      print("文件读取成功:$contents");
      return contents;//int.parse(contents);
    } on FileSystemException {
      print("文件读取失败");
      return null;
    }
  }
  //写入文件 true 成功 false 失败
  static Future<bool> writeFile(String data,String fileName) async{
    try {
      await (await _getLocalFile(fileName)).writeAsString(data);
      print("写入成功");
      return true;
    } on FileSystemException {
      print("写入失败");
      return false;
    }
  }
  //删除文件 true 成功 false 失败
  static Future<bool> deleteFile(String fileName) async{
    try {
      await (await _getLocalFile(fileName)).delete();
      print("删除成功");
      return true;
    } on FileSystemException {
      print("删除失败");
      return false;
    }
  }


}