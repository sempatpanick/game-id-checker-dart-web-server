import 'package:dartz/dartz.dart';

import '../common/failure.dart';
import '../models/codashop_nickname_model.dart';
import '../models/codashop_nickname_request_model.dart';
import '../repositories/app_repository.dart';

class GetNickname {
  final AppRepository _repository = AppRepositoryImpl();

  Future<Either<Failure, CodashopNicknameModel>> execute({
    required String gameId,
    required String userId,
    String? zoneId,
  }) async {
    CodashopNicknameRequestModel? data;

    if (gameId.toLowerCase() == "ml") {
      if (zoneId == null) {
        return Left(RequestFailure("required parameter zoneId"));
      }
      data = mobileLegendRequest(userId: userId, zoneId: zoneId);
    }
    if (gameId.toLowerCase() == "msavng") {
      data = metalSlugAwakeningRequest(userId: userId);
    }

    if (data == null) {
      return Left(RequestFailure("Invalid game"));
    }
    return await _repository.getNickname(gameId: gameId, data: data);
  }

  CodashopNicknameRequestModel mobileLegendRequest({
    required String userId,
    String? zoneId,
  }) {
    return CodashopNicknameRequestModel(
        voucherPricePointId: "4150",
        voucherPricePointPrice: "1579.0",
        voucherPricePointVariablePrice: "0",
        userId: userId,
        userZoneId: zoneId,
        voucherTypeName: "MOBILE_LEGENDS",
        voucherTypeId: "1",
        gvtId: "1",
        shopLang: "id_ID");
  }

  CodashopNicknameRequestModel metalSlugAwakeningRequest({
    required String userId,
  }) {
    return CodashopNicknameRequestModel(
        voucherPricePointId: "868000",
        voucherPricePointPrice: "15000.0",
        voucherPricePointVariablePrice: "0",
        userId: userId,
        voucherTypeName: "VNG_METAL_SLUG",
        shopLang: "id_ID");
  }
}
