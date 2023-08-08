class ZoomControllerResponse {
  late String code, message;
  Map<String, dynamic>? additionalData;

  ZoomControllerResponse(this.code, this.message, this.additionalData);

  ZoomControllerResponse.fromNative(Map<String, dynamic> data) {
    code = data['code'];
    message = data['message'];
    additionalData = data['additional_data'];
  }
}