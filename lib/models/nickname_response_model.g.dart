// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nickname_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NicknameResponseModel _$NicknameResponseModelFromJson(
        Map<String, dynamic> json) =>
    NicknameResponseModel(
      gameName: json['gameName'] as String?,
      userId: json['userId'] as String?,
      zoneId: json['zoneId'] as String?,
      nickname: json['nickname'] as String?,
    );

Map<String, dynamic> _$NicknameResponseModelToJson(
        NicknameResponseModel instance) =>
    <String, dynamic>{
      'gameName': instance.gameName,
      'userId': instance.userId,
      'zoneId': instance.zoneId,
      'nickname': instance.nickname,
    };
