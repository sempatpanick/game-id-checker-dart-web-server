import 'package:json_annotation/json_annotation.dart';

part 'codashop_nickname_request_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CodashopNicknameRequestModel {
  @JsonKey(name: "voucherPricePoint.id")
  String voucherPricePointId;
  @JsonKey(name: "voucherPricePoint.price")
  String voucherPricePointPrice;
  @JsonKey(name: "voucherPricePoint.variablePrice")
  String voucherPricePointVariablePrice;
  @JsonKey(name: "user.userId")
  String userId;
  @JsonKey(name: "user.zoneId", defaultValue: "", disallowNullValue: true)
  String? userZoneId;
  String voucherTypeName;
  @JsonKey(includeIfNull: false)
  String? voucherTypeId;
  @JsonKey(includeIfNull: false)
  String? gvtId;
  String shopLang;

  CodashopNicknameRequestModel({
    required this.voucherPricePointId,
    required this.voucherPricePointPrice,
    required this.voucherPricePointVariablePrice,
    required this.userId,
    this.userZoneId,
    required this.voucherTypeName,
    this.voucherTypeId,
    this.gvtId,
    required this.shopLang,
  });

  factory CodashopNicknameRequestModel.fromJson(Map<String, dynamic> json) =>
      _$CodashopNicknameRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$CodashopNicknameRequestModelToJson(this);

  Map<String, String> toJsonString() {
    final Map<String, dynamic> json = toJson();
    return json.map((key, value) => MapEntry(key, value.toString()));
  }
}
