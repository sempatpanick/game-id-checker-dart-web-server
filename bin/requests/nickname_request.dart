import 'dart:convert';

import 'package:id_checker/common/header_common.dart';
import 'package:id_checker/models/nickname_response_model.dart';
import 'package:id_checker/models/response_model.dart';
import 'package:id_checker/requests/get_nickname.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class NicknameRequest {
  Future<Response> getNickname(Request request) async {
    final gameId = request.params['gameId'];

    final userId = request.url.queryParameters['userId'];
    final zoneId = request.url.queryParameters['zoneId'];
    if (gameId == null) {
      return Response.badRequest(
        body: json.encode(ResponseModel(
          success: false,
          message: "required parameter gameId",
        ).toJson()),
        headers: headers,
      );
    }
    if (userId == null) {
      return Response.badRequest(
        body: json.encode(ResponseModel(
          success: false,
          message: "required parameter userId",
        ).toJson()),
        headers: headers,
      );
    }
    final result = await GetNickname().execute(
      gameId: gameId,
      userId: userId,
      zoneId: zoneId,
    );

    Response? response;
    result.fold((l) {
      response = Response.notFound(
        json.encode(ResponseModel(
          success: false,
          message: "Failed, ${l.message}",
        ).toJson()),
        headers: headers,
      );
    }, (r) {
      response = Response.ok(
        json.encode(ResponseModel<NicknameResponseModel>(
          success: true,
          message: "Success",
          data: r.toResponse(),
        ).toJson()),
        headers: headers,
      );
    });
    return response ??
        Response.forbidden(
          json.encode(ResponseModel(
            success: false,
            message: "Failed, access forbidden",
          ).toJson()),
          headers: headers,
        );
  }
}
