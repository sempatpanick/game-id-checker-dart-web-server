// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseModel<T> _$ResponseModelFromJson<T>(Map<String, dynamic> json) =>
    ResponseModel<T>(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: responseFromJson(json['data']),
    );

Map<String, dynamic> _$ResponseModelToJson<T>(ResponseModel<T> instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': responseToJson(instance.data),
    };
