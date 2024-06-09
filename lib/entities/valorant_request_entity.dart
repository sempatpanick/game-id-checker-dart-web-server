import '../models/codashop_nickname_request_model.dart';

class ValorantRequestEntity extends CodashopNicknameRequestModel {
  ValorantRequestEntity({
    required super.voucherPricePointId,
    required super.voucherPricePointPrice,
    required super.voucherPricePointVariablePrice,
    required super.userId,
    required super.voucherTypeName,
    required super.voucherTypeId,
    required super.shopLang,
    required super.gvtId,
  });
}
