class ApiResponse {
  String? ErrorYn;
  String? ErrMsg;
  dynamic Data;
  String? ErrorYN;
  String? Error;
  // Map<String, dynamic> data;
  // dynamic data;

  ApiResponse({this.ErrorYn, this.ErrMsg, this.Data});

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
        ErrorYn: json['ErrorYn'], ErrMsg: json['ErrMsg'], Data: json['Data']);
  }



}
