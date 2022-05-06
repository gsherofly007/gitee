import 'package:dio/dio.dart';
import 'httpInterface.dart';
import 'package:foundation/foundation.dart';
import 'dart:convert';
class HTTPConfig {
  static const baseURL = kServerUrl;
  static const timeout = 1000;
}
class BaseHttpRequest {
   static postRequest(String api,Map<String,dynamic> parameter,Param1Callback success,Param1Callback fail) async{
      try {
        Response response;
        var dio = Dio();
        String url = kServerUrl + api;
        print("post请求:"+url);
        print("参数:"+parameter.toString());
        response = await dio.post(kServerUrl + api,queryParameters:
          parameter,options: Options(responseType: ResponseType.plain));
        print("接口请求结果$response");
        Map<String, dynamic> map = jsonDecode(response.data);
        // UserAuthModel userAuthModel = UserAuthModel.fromJson(map);
        success(map);
        return null;
      } catch (e) {

        if(e is DioError){
          fail(e.response.data);
          return null;
        }
        print(e);
        fail("网络未知错误");
      }
    }
   static getRequest(String api,Map<String,dynamic> parameter,Param1Callback success,Param1Callback fail) async{
     try {
       Response response;
       var dio = Dio();
       String url = kServerUrl + api;
       print("get请求:"+url);
       print("参数:"+parameter.toString());
       response = await dio.get(url,queryParameters:
       parameter,options: Options(responseType: ResponseType.plain));
       print("接口请求结果$response");


       // UserAuthModel userAuthModel = UserAuthModel.fromJson(map);
       success(response.data);
       return null;
     } catch (e) {

       if(e is DioError){
         fail(e.response.data);
         return null;
       }
       print(e);
       fail("网络未知错误");
     }
   }
  // static final BaseOptions options = BaseOptions(
  //     baseUrl: HTTPConfig.baseURL, connectTimeout: HTTPConfig.timeout);
  // static final Dio dio = Dio(options);
  //
  // static Future<T> request<T>(String url,
  //     {String method = 'get',  Map<String, dynamic>? params, Interceptor? inter}) async {
  //   // 1.请求的单独配置
  //   final options = Options(method: method);
  //
  //   // 2.添加第一个拦截器
  //   Interceptor dInter = InterceptorsWrapper(
  //       onRequest: (RequestOptions options) {
  //         // 1.在进行任何网络请求的时候, 可以添加一个loading显示
  //         // 2.很多页面的访问必须要求携带Token,那么就可以在这里判断是有Token
  //
  //         // 3.对参数进行一些处理,比如序列化处理等
  //         print("拦截了请求");
  //         return options;
  //       },
  //       onResponse: (Response response) {
  //         print("拦截了响应");
  //         return response;
  //       },
  //       onError: (DioError error) {
  //         print("拦截了错误:"+error.toString() +error.request.baseUrl);
  //         return error;
  //       }
  //   );
  //   List<Interceptor> inters = [dInter];
  //   if (inter != null) {
  //     inters.add(inter);
  //   }
  //   dio.interceptors.addAll(inters);
  //
  //   // 3.发送网络请求
  //   try {
  //     Response response = await dio.request<T>(url, queryParameters: params, options: options);
  //     return response.data;
  //   } on DioError catch(e) {
  //     return Future.error(e);
  //   }
  // }

}

// import 'dart:convert';
//
// import 'package:dio/dio.dart';
// import 'httpInterface.dart';
// enum HttpMethod { post, get }
//
// typedef ParseObject = dynamic Function(dynamic originMap);
//
// extension ListExt on List<dynamic> {
//   List<T> parseObj<T>(ParseObject covert) {
//     return List<T>.from(map(covert)).toList();
//   }
// }
//
// extension ResultJsonExt on ResultJson? {
//   bool get requestIsSuccess => this!=null && this!.success == true && this!.errors.isEmpty;
// }
//
// abstract class BaseModel<T> {
//   T fromJson(Map<String, dynamic> map);
// }
//
// class ResultJson {
//   final bool success;
//   final String errorMessage;
//   final List<dynamic> errors;
//   final dynamic data;
//
//   ResultJson(
//       {required this.success,
//         required this.errorMessage,
//         required this.errors,
//         required this.data});
//
//   factory ResultJson.fromJson(Map<String, dynamic> map) {
//     return ResultJson(
//         success: map['success'],
//         errorMessage: map['errorMessage'] ?? '',
//         errors: map['errors'] ?? [],
//         data: map['data']);
//   }
//
//   //打印
//   void printDataJson() {
//     print(jsonEncode(data));
//   }
//
//   //转数组
//   List<dynamic> parseList() {
//     return data as List<dynamic>;
//   }
//
//   List<T> dataCovertToList<T>(ParseObject covert) {
//     return parseList().parseObj<T>(covert).toList();
//   }
//
//   @override
//   String toString() {
//     return '==========================================\n是否成功:${success ? '成功' : '失败'} data类型:${data.runtimeType} \n错误消息:$errorMessage\n错误列表:$errors\n数据:$data\n==========================================';
//   }
// }
//
// abstract class BaseApi {
//   static String host = kServerUrl;
//
//   final String url;
//   final HttpMethod httpMethod;
//   final Map<String, dynamic> params = <String, dynamic>{};
//
//   BaseApi(this.url, {this.httpMethod = HttpMethod.get});
//
//   Future<ResultJson?> request() async {
//     final response = await Dio().request(host + url,
//         options: Options(method: methed),
//         queryParameters: params,
//         data: params);
//     if (response.statusCode == 200) {
//       final data = response.data;
//       return ResultJson.fromJson(data);
//     }
//     return null;
//   }
//
//   //请求方法,
//   String get methed => getMethod();
//
//   String getMethod() {
//     switch (httpMethod) {
//       case HttpMethod.get:
//         return 'GET';
//       default:
//         return "POST";
//     }
//   }
// }

