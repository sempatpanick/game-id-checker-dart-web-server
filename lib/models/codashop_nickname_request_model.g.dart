// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'codashop_nickname_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CodashopNicknameRequestModel _$CodashopNicknameRequestModelFromJson(
    Map<String, dynamic> json) {
  $checkKeys(
    json,
    disallowNullValues: const ['user.zoneId'],
  );
  return CodashopNicknameRequestModel(
    voucherPricePointId: json['voucherPricePoint.id'] as String,
    voucherPricePointPrice: json['voucherPricePoint.price'] as String,
    voucherPricePointVariablePrice:
        json['voucherPricePoint.variablePrice'] as String,
    userId: json['user.userId'] as String,
    userZoneId: json['user.zoneId'] as String? ?? '',
    voucherTypeName: json['voucherTypeName'] as String,
    voucherTypeId: json['voucherTypeId'] as String?,
    gvtId: json['gvtId'] as String?,
    lvtId: json['lvtId'] as String?,
    shopLang: json['shopLang'] as String,
    pricePointDynamicSkuToken: json['pricePointDynamicSkuToken'] as String?,
    dynamicSkuToken: json['dynamicSkuToken'] as String?,
  );
}

Map<String, dynamic> _$CodashopNicknameRequestModelToJson(
    CodashopNicknameRequestModel instance) {
  final val = <String, dynamic>{
    'voucherPricePoint.id': instance.voucherPricePointId,
    'voucherPricePoint.price': instance.voucherPricePointPrice,
    'voucherPricePoint.variablePrice': instance.voucherPricePointVariablePrice,
    'user.userId': instance.userId,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('user.zoneId', instance.userZoneId);
  val['voucherTypeName'] = instance.voucherTypeName;
  writeNotNull('voucherTypeId', instance.voucherTypeId);
  writeNotNull('gvtId', instance.gvtId);
  writeNotNull('lvtId', instance.lvtId);
  val['shopLang'] = instance.shopLang;
  writeNotNull('pricePointDynamicSkuToken', instance.pricePointDynamicSkuToken);
  writeNotNull('dynamicSkuToken', instance.dynamicSkuToken);
  return val;
}
