import '../models/codashop_nickname_request_model.dart';

class GenshinImpactRequestEntity extends CodashopNicknameRequestModel {
  GenshinImpactRequestEntity({
    required super.voucherPricePointId,
    required super.voucherPricePointPrice,
    required super.voucherPricePointVariablePrice,
    required super.userId,
    required super.userZoneId,
    required super.voucherTypeName,
    required super.shopLang,
  });
}
