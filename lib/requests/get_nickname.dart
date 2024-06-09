import 'package:dartz/dartz.dart';
import 'package:id_checker/entities/hay_day_request_entity.dart';
import 'package:id_checker/entities/mobile_legends_request_entity.dart';

import '../common/failure.dart';
import '../entities/among_heroes_request_entity.dart';
import '../entities/free_fire_request_entity.dart';
import '../entities/metal_slug_awakening_request_entity.dart';
import '../entities/one_punch_man_the_strongest_request_entity.dart';
import '../entities/state_of_survival_request_entity.dart';
import '../entities/valorant_request_entity.dart';
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
    if (gameId.toLowerCase() == "hayday") {
      data = hayDayRequest(userId: userId);
    }
    if (gameId.toLowerCase() == "ffmax") {
      data = freeFireMaxRequest(userId: userId);
    }
    if (gameId.toLowerCase() == "opmts") {
      if (zoneId == null) {
        return Left(RequestFailure("required parameter zoneId"));
      }
      data = onePunchManTheStrongestMaxRequest(userId: userId, zoneId: zoneId);
    }
    if (gameId.toLowerCase() == "sos") {
      data = stateOfSurvivalRequest(userId: userId);
    }
    if (gameId.toLowerCase() == "amongheroes") {
      if (zoneId == null) {
        return Left(RequestFailure("required parameter zoneId"));
      }
      data = amongHeroesRequest(userId: userId, zoneId: zoneId);
    }
    if (gameId.toLowerCase() == "valorant") {
      data = valorantRequest(userId: userId);
    }

    if (data == null) {
      return Left(RequestFailure("Invalid game"));
    }
    return await _repository.getNickname(gameId: gameId, data: data);
  }

  CodashopNicknameRequestModel mobileLegendRequest({
    required String userId,
    String? zoneId,
  }) =>
      MobileLegendsRequestEntity(
        voucherPricePointId: "4150",
        voucherPricePointPrice: "1579.0",
        voucherPricePointVariablePrice: "0",
        userId: userId,
        userZoneId: zoneId,
        voucherTypeName: "MOBILE_LEGENDS",
        voucherTypeId: "1",
        gvtId: "1",
        shopLang: "id_ID",
      );

  CodashopNicknameRequestModel metalSlugAwakeningRequest({
    required String userId,
  }) =>
      MetalSlugAwakeningRequestEntity(
        voucherPricePointId: "868000",
        voucherPricePointPrice: "15000.0",
        voucherPricePointVariablePrice: "0",
        userId: userId,
        voucherTypeName: "VNG_METAL_SLUG",
        shopLang: "id_ID",
      );

  CodashopNicknameRequestModel hayDayRequest({
    required String userId,
  }) =>
      HayDayRequestEntity(
        voucherPricePointId: "3",
        voucherPricePointPrice: "30834.0",
        voucherPricePointVariablePrice: "0",
        userId:
            userId.contains("%23") ? userId.replaceAll("%23", "#") : "#$userId",
        voucherTypeName: "HAY_DAY",
        shopLang: "id_ID",
        lvtId: "6263",
        pricePointDynamicSkuToken:
            "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJkeW5hbWljU2t1SW5mbyI6IntcInBjSWRcIjoyNDAsXCJwcmljZVwiOjMwODM0LjAsXCJjdXJyZW5jeVwiOlwiSURSXCIsXCJhcGlQcmljZVwiOjMwODM0LjAsXCJhcGlQcmljZUN1cnJlbmN5XCI6XCJJRFJcIixcInByaWNlQmVmb3JlVGF4XCI6Mjc3NzguMCxcInRheEFtb3VudFwiOjMwNTYuMCxcInNrdUlkXCI6XCJjb20uc3VwZXJjZWxsLnNvaWwuY29kYXNob3AuMTBwY3QuZGlhbW9uZHBhY2thZ2UxXCIsXCJsdnRJZFwiOjYyNjN9In0.VVorKtLN9izAYNuTi6wbTne_yg0Al8jc27rt1n-5DtM",
        dynamicSkuToken:
            "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJkeW5hbWljU2t1SW5mbyI6IntcInNrdUlkXCI6XCJjb20uc3VwZXJjZWxsLnNvaWwuY29kYXNob3AuMTBwY3QuZGlhbW9uZHBhY2thZ2UxXCIsXCJldmVudFBhY2thZ2VcIjpcIjBcIixcImRlbm9tSW1hZ2VVcmxcIjpcImh0dHBzOi8vY2RuMS5jb2Rhc2hvcC5jb20vaW1hZ2VzLzgxOF80YWEyOTQwYy1kNGZhLTRlZjgtYmYwMC1jNGM3OTBkOWUzNTdfSGF5IERheV9pbWFnZS9TdXBlcmNlbGwtSGF5RGF5L0hheURheS9IYXlEYXlfYWxsY291bnRyaWVzXzUwZGlhbW9uZHMxMC5wbmdcIixcImRlbm9tTmFtZVwiOlwiNTAgRGlhbW9uZHMgKyA1IGJvbnVzXCIsXCJkZW5vbUNhdGVnb3J5TmFtZVwiOlwiVW5jYXRlZ29yaXplZFwiLFwidGFnc1wiOltdLFwiY291bnRyeTJOYW1lXCI6XCJJRFwiLFwibHZ0SWRcIjo2MjYzfSJ9.IEaxBFJrjjoV8J8U50lCmDEbB9zYy23OCI7NCpG71Lk",
      );

  CodashopNicknameRequestModel freeFireRequest({
    required String userId,
  }) =>
      FreeFireRequestEntity(
        voucherPricePointId: "20500",
        voucherPricePointPrice: "1000.0",
        voucherPricePointVariablePrice: "0",
        userId: userId,
        voucherTypeName: "FREEFIRE",
        shopLang: "id_ID",
      );

  CodashopNicknameRequestModel freeFireMaxRequest({
    required String userId,
  }) =>
      FreeFireRequestEntity(
        voucherPricePointId: "232851",
        voucherPricePointPrice: "1000.0",
        voucherPricePointVariablePrice: "0",
        userId: userId,
        voucherTypeName: "FREEFIRE",
        shopLang: "id_ID",
      );

  CodashopNicknameRequestModel onePunchManTheStrongestMaxRequest({
    required String userId,
    required String zoneId,
  }) =>
      OnePunchManTheStrongestRequestEntity(
        voucherPricePointId: "77738",
        voucherPricePointPrice: "10890.0",
        voucherPricePointVariablePrice: "0",
        userId: userId,
        userZoneId: zoneId,
        voucherTypeName: "ONE_PUNCH_MAN",
        shopLang: "id_ID",
      );

  CodashopNicknameRequestModel stateOfSurvivalRequest({
    required String userId,
  }) =>
      StateOfSurvivalRequestEntity(
        voucherPricePointId: "409041",
        voucherPricePointPrice: "17760.0",
        voucherPricePointVariablePrice: "0",
        userId: userId,
        voucherTypeName: "STATE_OF_SURVIVAL",
        shopLang: "id_ID",
      );

  CodashopNicknameRequestModel amongHeroesRequest({
    required String userId,
    required String zoneId,
  }) =>
      AmongHeroesRequestEntity(
        voucherPricePointId: "872023",
        voucherPricePointPrice: "16000.0",
        voucherPricePointVariablePrice: "0",
        userId: userId,
        userZoneId: zoneId
            .replaceAll("VN-", "11")
            .replaceAll("TH-", "16")
            .replaceAll("ID-", "21")
            .replaceAll("SEA-", "26"),
        voucherTypeName: "AMONG_HEROES",
        shopLang: "id_ID",
      );

  CodashopNicknameRequestModel valorantRequest({
    required String userId,
  }) =>
      ValorantRequestEntity(
        voucherPricePointId: "115689",
        voucherPricePointPrice: "15000.0",
        voucherPricePointVariablePrice: "0",
        userId: userId,
        voucherTypeName: "VALORANT",
        voucherTypeId: "109",
        shopLang: "id_ID",
        gvtId: "139",
      );
}
