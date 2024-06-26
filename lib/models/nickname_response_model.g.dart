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
      zoneName: json['zoneName'] as String?,
      server: json['server'] as String?,
      nickname: json['nickname'] as String?,
      nicknames: (json['nicknames'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$NicknameResponseModelToJson(
    NicknameResponseModel instance) {
  final val = <String, dynamic>{
    'gameName': instance.gameName,
    'userId': instance.userId,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('zoneId', instance.zoneId);
  writeNotNull('zoneName', instance.zoneName);
  writeNotNull('server', instance.server);
  writeNotNull('nickname', instance.nickname);
  writeNotNull('nicknames', instance.nicknames);
  return val;
}
