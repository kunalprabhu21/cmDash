import 'dart:convert';
import 'dart:io';
import 'package:cm_dashboard/controllers/InternetController.dart';
import 'package:cm_dashboard/pages/widgets/CustomDialog.dart';
import 'package:cm_dashboard/utils/ApiResponse.dart';
import 'package:cm_dashboard/utils/Urls.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';




CallApi callApi = CallApi();

class CallApi {
  InternetConnection _internetConnection = InternetConnection.getInstance();
  ConnectionStatus? _connectionResponse;
  static String _ip = "${Urls().SERVER_URL}";
  // ignore: missing_return
  Future<ApiResponse?> post(context,{String? url, data, Function? onConnectionFailed}) async {


    if (Provider.of<InternetController>(context,listen:false).connectionStatus.name != "none" ) {
      // Map<String,String> headerData = await headers();
      String fullUrl = _ip + url!;
      http.Response res = await http.post(Uri.parse(fullUrl), body: data);

      final response =  ApiResponse.fromJson(json.decode(res.body));

      return response;
    } else {
      customDialog(
          context,Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Text('Intenet Connection not found'),

          RaisedButton(
            child: Text("Submit", style: GoogleFonts.nunito(fontSize: 12,color: Colors.white)),
            onPressed: (){


            },
            color: Color(0xff00a65a),
            padding: EdgeInsets.symmetric(vertical: 20,horizontal: 50),
            splashColor: Colors.grey,
          ),
        ],
      ),"No internet Connected");
    }
  }

  //
  //
  // Future<http.StreamedResponse> multipart(
  //     {String url,
  //       data,
  //       List<http.MultipartFile> files,
  //       Function onConnectionFailed}) async {
  //   _connectionResponse = await _internetConnection.status();
  //   if (_connectionResponse.status == ConnectionStatus.online) {
  //     String fullUrl = _ip + url;
  //     var request = http.MultipartRequest(
  //       'POST',
  //       Uri.parse(fullUrl),
  //     );
  //     Map<String, String> headers = {"Content-type": "multipart/form-data"};
  //     files.forEach((element) {
  //       request.files.add(element);
  //     });
  //     request.headers.addAll(headers);
  //     if(data !=null){
  //       request.fields.addAll(data);
  //     }
  //     print("request: " + request.toString());
  //     var res = await request.send();
  //     print("This is response:" + res.toString());
  //     return res;
  //   } else {
  //     SchedulerBinding.instance
  //         .addPostFrameCallback((_) => onConnectionFailed());
  //   }
  // }

  Future<http.Response?> get(context,{String? url, Function? onConnectionFailed}) async {
    _connectionResponse = await _internetConnection.status();
    if (_connectionResponse!.status == ConnectionStatus.online) {
      String fullUrl = _ip + url!;
      // Map<String,String> headerData = await headers();
      http.Response res = await http.get(Uri.parse(fullUrl));

      return res;
    } else {
      SchedulerBinding.instance
          ?.addPostFrameCallback((_) {
        if(onConnectionFailed == null){
          print("No internet connection");
        } else{
          onConnectionFailed();
        }
      });
    }
  }
  //
  // Future<http.Response> put(context,{String url, data, Function onConnectionFailed}) async {
  //   _connectionResponse = await _internetConnection.status();
  //   if (_connectionResponse.status == ConnectionStatus.online) {
  //     String fullUrl = _ip + url;
  //     Map<String,String> headerData = await headers();
  //     http.Response res = await http.put(fullUrl,headers: headerData,body: data);
  //     if(res.statusCode == 401){
  //       final response = jsonDecode(res.body);
  //       if(response['error'] == "Token expired!!"){
  //         customDialog(context,barrierDismissible: true,body: [
  //           await sessionExpired(context)
  //         ]);
  //       }
  //     }
  //     return res;
  //   } else {
  //     SchedulerBinding.instance
  //         .addPostFrameCallback((_) {
  //       if(onConnectionFailed == null){
  //         print("No internet connection");
  //       } else{
  //         onConnectionFailed();
  //       }
  //     });
  //   }
  // }
  // Future<http.StreamedResponse> delete(context,{String url, data,Function onConnectionFailed}) async {
  //   _connectionResponse = await _internetConnection.status();
  //   if (_connectionResponse.status == ConnectionStatus.online) {
  //     String fullUrl = _ip + url;
  //     Map<String,String> headerData = await headers();
  //     final request = http.Request("DELETE", Uri.parse(fullUrl));
  //     request.headers.addAll(headerData);
  //     request.body = jsonEncode(data);
  //     final res = await request.send();
  //     if(res.statusCode == 401){
  //       final response = jsonDecode(await res.stream.bytesToString());
  //       if(response['error'] == "Token expired!!"){
  //         customDialog(context,barrierDismissible: true,body: [
  //           await sessionExpired(context)
  //         ]);
  //       }
  //     }
  //     return res;
  //   } else {
  //     SchedulerBinding.instance
  //         .addPostFrameCallback((_) {
  //       if(onConnectionFailed == null){
  //         print("No internet connection");
  //       } else{
  //         onConnectionFailed();
  //       }
  //     });
  //   }
  // }
  // Future<Map<String, String>> headers() async{
  //   SharedPref sharedPref = SharedPref();
  //   final token = await sharedPref.read("token");
  //   Map<String,String> headers = {'Content-Type':'application/json','Authorization': token};
  //   return headers;
  // }
}

final respo = {"id":435,"prescription":"https://sp-15022020.s3-ap-south-1.amazonaws.com/prescriptions/prescription_399_1622186353.jpeg?X-Amz-Expires=86400\u0026X-Amz-Date=20210528T071914Z\u0026X-Amz-Algorithm=AWS4-HMAC-SHA256\u0026X-Amz-Credential=AKIATOM4R3ZOGQTVPNHU/20210528/ap-south-1/s3/aws4_request\u0026X-Amz-SignedHeaders=host\u0026X-Amz-Signature=d7dae201bb0f11b96b2c404e4396cb4761f5551fa24c9a69421a3f35583b7fbe","status":"success","message":"Prescription Uploaded!"};


class InternetConnection {
  static InternetConnection? _instance;
  static InternetConnection getInstance() => _instance ??= InternetConnection();
  status() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return ConnectionStatus(status: ConnectionStatus.online);
      }
    } on SocketException catch (_) {
      return ConnectionStatus(status: ConnectionStatus.offline);
    }
  }
}

class ConnectionStatus {
  final String? status;
  ConnectionStatus({this.status});
  static String online = "Online";
  static String offline = "Offline";
}
