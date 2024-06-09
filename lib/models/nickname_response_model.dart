import 'package:json_annotation/json_annotation.dart';

part 'nickname_response_model.g.dart';

@JsonSerializable(explicitToJson: true)
class NicknameResponseModel {
  String? gameName;
  String? userId;
  String? zoneId;
  String? nickname;

  NicknameResponseModel({
    this.gameName,
    this.userId,
    this.zoneId,
    this.nickname,
  });

  factory NicknameResponseModel.fromJson(Map<String, dynamic> json) =>
      _$NicknameResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$NicknameResponseModelToJson(this);
}
