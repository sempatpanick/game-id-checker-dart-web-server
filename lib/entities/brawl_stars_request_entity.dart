import '../models/codashop_nickname_request_model.dart';

class BrawlStarsRequestEntity extends CodashopNicknameRequestModel {
  BrawlStarsRequestEntity({
    required super.voucherPricePointId,
    required super.voucherPricePointPrice,
    required super.voucherPricePointVariablePrice,
    required super.userId,
    required super.voucherTypeName,
    required super.voucherTypeId,
    required super.shopLang,
    required super.gvtId,
    required super.lvtId,
    required super.pricePointDynamicSkuToken,
    required super.dynamicSkuToken,
  });
}
