class ApiResponse {
  String? access_token;
  String? token_type;
  String? expires_in;
  String? ErrorYN;
  String? Error;
  // Map<String, dynamic> data;
  // dynamic data;

  ApiResponse({this.access_token, this.token_type, this.expires_in,this.ErrorYN,this.Error});

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
        access_token: json['access_token'], token_type: json['token_type'], expires_in: json['expires_in'], ErrorYN: json['ErrorYN'], Error: json['Error']);
  }
}
