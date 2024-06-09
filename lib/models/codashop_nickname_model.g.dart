// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'codashop_nickname_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CodashopNicknameModel _$CodashopNicknameModelFromJson(
        Map<String, dynamic> json) =>
    CodashopNicknameModel(
      initCallBackendAPI: json['initCallBackendAPI'] as bool?,
      orderId: json['orderId'] as String?,
      errorCode: json['errorCode'] as String?,
      confirmation: json['confirmation'] as bool?,
      isUserConfirmation: json['isUserConfirmation'] as bool?,
      errorMsg: json['errorMsg'] as String?,
      paymentChannel: json['paymentChannel'] as String?,
      result: json['result'] as String?,
      channelPrice: json['channelPrice'] as String?,
      confirmationFields: json['confirmationFields'] == null
          ? null
          : ConfirmationFieldsCodashopNicknameModel.fromJson(
              json['confirmationFields'] as Map<String, dynamic>),
      success: json['success'] as bool?,
      denom: json['denom'] as String?,
      user: json['user'] == null
          ? null
          : UserCodashopNicknameModel.fromJson(
              json['user'] as Map<String, dynamic>),
      isThirdPartyMerchant: json['isThirdPartyMerchant'] as bool?,
      txnId: json['txnId'] as String?,
    );

Map<String, dynamic> _$CodashopNicknameModelToJson(
        CodashopNicknameModel instance) =>
    <String, dynamic>{
      'initCallBackendAPI': instance.initCallBackendAPI,
      'orderId': instance.orderId,
      'errorCode': instance.errorCode,
      'confirmation': instance.confirmation,
      'isUserConfirmation': instance.isUserConfirmation,
      'errorMsg': instance.errorMsg,
      'paymentChannel': instance.paymentChannel,
      'result': instance.result,
      'channelPrice': instance.channelPrice,
      'confirmationFields': instance.confirmationFields?.toJson(),
      'success': instance.success,
      'denom': instance.denom,
      'user': instance.user?.toJson(),
      'isThirdPartyMerchant': instance.isThirdPartyMerchant,
      'txnId': instance.txnId,
    };

ConfirmationFieldsCodashopNicknameModel
    _$ConfirmationFieldsCodashopNicknameModelFromJson(
            Map<String, dynamic> json) =>
        ConfirmationFieldsCodashopNicknameModel(
          zipCode: json['zipCode'] as String?,
          country: json['country'] as String?,
          totalPrice: json['totalPrice'] as String?,
          userId: json['userId'] as String?,
          productName: json['productName'] as String?,
          paymentChannel: json['paymentChannel'] as String?,
          channelPrice: json['channelPrice'] as String?,
          price: json['price'] as String?,
          zoneId: json['zoneId'] as String?,
          verifiedMsisdn: json['verifiedMsisdn'] as String?,
          priceBeforeTax: json['priceBeforeTax'] as String?,
          taxAmount: json['taxAmount'] as String?,
          email: json['email'] as String?,
          inputRoleId: json['inputRoleId'] as String?,
          username: json['username'] as String?,
        );

Map<String, dynamic> _$ConfirmationFieldsCodashopNicknameModelToJson(
        ConfirmationFieldsCodashopNicknameModel instance) =>
    <String, dynamic>{
      'zipCode': instance.zipCode,
      'country': instance.country,
      'totalPrice': instance.totalPrice,
      'userId': instance.userId,
      'productName': instance.productName,
      'paymentChannel': instance.paymentChannel,
      'channelPrice': instance.channelPrice,
      'price': instance.price,
      'zoneId': instance.zoneId,
      'verifiedMsisdn': instance.verifiedMsisdn,
      'priceBeforeTax': instance.priceBeforeTax,
      'taxAmount': instance.taxAmount,
      'email': instance.email,
      'inputRoleId': instance.inputRoleId,
      'username': instance.username,
    };

UserCodashopNicknameModel _$UserCodashopNicknameModelFromJson(
        Map<String, dynamic> json) =>
    UserCodashopNicknameModel(
      userId: json['userId'] as String?,
      zoneId: json['zoneId'] as String?,
    );

Map<String, dynamic> _$UserCodashopNicknameModelToJson(
        UserCodashopNicknameModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'zoneId': instance.zoneId,
    };
