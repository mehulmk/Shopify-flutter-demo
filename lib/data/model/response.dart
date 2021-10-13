class CommonResponse {
  String? status;
  ResponseData? responseData;

  CommonResponse({this.responseData});

  CommonResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    responseData =
        json['result'] != null ? ResponseData.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (responseData != null) {
      data['result'] = responseData!.toJson();
    }
    return data;
  }
}

class ResponseData {
  String? message;
  Error? error;

  ResponseData({this.message, this.error});

  ResponseData.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    error = json['error'] != null ? Error.fromJson(json['error']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (error != null) {
      data['error'] = error!.toJson();
    }
    return data;
  }
}

class Error {
  String? message;

  Error({this.message});

  Error.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    return data;
  }
}
