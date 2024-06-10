import 'package:json_annotation/json_annotation.dart';

part 'nickname_response_model.g.dart';

@JsonSerializable(explicitToJson: true)
class NicknameResponseModel {
  String? gameName;
  String? userId;
  @JsonKey(includeIfNull: false)
  String? zoneId;
  @JsonKey(includeIfNull: false)
  String? zoneName;
  @JsonKey(includeIfNull: false)
  String? server;
  @JsonKey(includeIfNull: false)
  String? nickname;
  @JsonKey(includeIfNull: false)
  List<String>? nicknames;

  NicknameResponseModel({
    this.gameName,
    this.userId,
    this.zoneId,
    this.zoneName,
    this.server,
    this.nickname,
    this.nicknames,
  });

  factory NicknameResponseModel.fromJson(Map<String, dynamic> json) =>
      _$NicknameResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$NicknameResponseModelToJson(this);
}
