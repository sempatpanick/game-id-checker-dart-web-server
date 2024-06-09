import 'package:json_annotation/json_annotation.dart';

part 'response_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ResponseModel<T> {
  bool success;
  String message;
  @JsonKey(fromJson: responseFromJson, toJson: responseToJson)
  T? data;

  ResponseModel({
    required this.success,
    required this.message,
    this.data,
  });

  factory ResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseModelToJson(this);
}

T responseFromJson<T>(dynamic value) {
  return value?.fromJson();
}

T responseToJson<T>(dynamic value) {
  return value?.toJson();
}
