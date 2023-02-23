class GenericResponseModel {
  GenericResponseModel({this.message, this.status});

  String? message;
  bool? status = false;
  factory GenericResponseModel.fromJson(Map<String, dynamic> json) =>
      GenericResponseModel(
          message: json["message"] ?? "", status: json["status"] ?? false);

  Map<String, dynamic> toJson() => {"message": message, "status": status};
}
