import 'package:json_annotation/json_annotation.dart';

import 'nickname_response_model.dart';

part 'codashop_nickname_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CodashopNicknameModel {
  bool? initCallBackendAPI;
  String? orderId;
  String? errorCode;
  bool? confirmation;
  bool? isUserConfirmation;
  String? errorMsg;
  String? paymentChannel;
  String? result;
  String? channelPrice;
  ConfirmationFieldsCodashopNicknameModel? confirmationFields;
  bool? success;
  String? denom;
  UserCodashopNicknameModel? user;
  bool? isThirdPartyMerchant;
  String? txnId;

  CodashopNicknameModel({
    this.initCallBackendAPI,
    this.orderId,
    this.errorCode,
    this.confirmation,
    this.isUserConfirmation,
    this.errorMsg,
    this.paymentChannel,
    this.result,
    this.channelPrice,
    this.confirmationFields,
    this.success,
    this.denom,
    this.user,
    this.isThirdPartyMerchant,
    this.txnId,
  });

  factory CodashopNicknameModel.fromJson(Map<String, dynamic> json) =>
      _$CodashopNicknameModelFromJson(json);

  Map<String, dynamic> toJson() => _$CodashopNicknameModelToJson(this);

  NicknameResponseModel toResponse() => NicknameResponseModel(
        gameName:
            confirmationFields?.productName?.replaceAll("Top-up", "").trim(),
        userId: confirmationFields?.userId,
        zoneId: confirmationFields?.zoneId,
        zoneName: (confirmationFields?.roleList
                        ?.where((item) => item.roleName != null) ??
                    [])
                .isEmpty
            ? null
            : confirmationFields?.zoneId
                ?.replaceAll("11", "VN-")
                .replaceAll("16", "TH-")
                .replaceAll("21", "ID-")
                .replaceAll("26", "SEA-"),
        nickname: confirmationFields?.username != null &&
                confirmationFields?.username != "null"
            ? confirmationFields?.username
            : confirmationFields?.roles
                ?.where((item) => (item.role ?? "").isNotEmpty)
                .firstOrNull
                ?.role,
        nicknames: confirmationFields?.roleList
            ?.where((item) => item.roleName != null)
            .map((item) => item.roleName!)
            .toList(),
      );
}

@JsonSerializable(explicitToJson: true)
class ConfirmationFieldsCodashopNicknameModel {
  String? zipCode;
  String? country;
  String? totalPrice;
  String? userId;
  String? productName;
  String? paymentChannel;
  String? channelPrice;
  String? price;
  String? zoneId;
  String? verifiedMsisdn;
  String? priceBeforeTax;
  String? taxAmount;
  String? email;
  String? inputRoleId;
  String? username;
  List<RoleConfirmationFieldsCodashopNicknameModel>? roles;
  List<RoleListConfirmationFieldsCodashopNicknameModel>? roleList;

  ConfirmationFieldsCodashopNicknameModel({
    this.zipCode,
    this.country,
    this.totalPrice,
    this.userId,
    this.productName,
    this.paymentChannel,
    this.channelPrice,
    this.price,
    this.zoneId,
    this.verifiedMsisdn,
    this.priceBeforeTax,
    this.taxAmount,
    this.email,
    this.inputRoleId,
    this.username,
  });

  factory ConfirmationFieldsCodashopNicknameModel.fromJson(
          Map<String, dynamic> json) =>
      _$ConfirmationFieldsCodashopNicknameModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ConfirmationFieldsCodashopNicknameModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class RoleConfirmationFieldsCodashopNicknameModel {
  @JsonKey(name: "packed_role_id")
  String? packedRoleId;
  String? server;
  String? role;
  @JsonKey(name: "role_id")
  String? roleId;
  @JsonKey(name: "client_type")
  String? clientType;
  @JsonKey(name: "server_id")
  String? serverId;

  RoleConfirmationFieldsCodashopNicknameModel({
    this.packedRoleId,
    this.server,
    this.role,
    this.roleId,
    this.clientType,
    this.serverId,
  });

  factory RoleConfirmationFieldsCodashopNicknameModel.fromJson(
          Map<String, dynamic> json) =>
      _$RoleConfirmationFieldsCodashopNicknameModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$RoleConfirmationFieldsCodashopNicknameModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class RoleListConfirmationFieldsCodashopNicknameModel {
  String? roleId;
  String? roleName;

  RoleListConfirmationFieldsCodashopNicknameModel({
    this.roleId,
    this.roleName,
  });

  factory RoleListConfirmationFieldsCodashopNicknameModel.fromJson(
          Map<String, dynamic> json) =>
      _$RoleListConfirmationFieldsCodashopNicknameModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$RoleListConfirmationFieldsCodashopNicknameModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UserCodashopNicknameModel {
  String? userId;
  String? zoneId;

  UserCodashopNicknameModel({
    this.userId,
    this.zoneId,
  });

  factory UserCodashopNicknameModel.fromJson(Map<String, dynamic> json) =>
      _$UserCodashopNicknameModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserCodashopNicknameModelToJson(this);
}
