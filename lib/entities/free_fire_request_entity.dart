import '../models/codashop_nickname_request_model.dart';

class FreeFireRequestEntity extends CodashopNicknameRequestModel {
  FreeFireRequestEntity({
    required super.voucherPricePointId,
    required super.voucherPricePointPrice,
    required super.voucherPricePointVariablePrice,
    required super.userId,
    required super.voucherTypeName,
    required super.shopLang,
  });
}
