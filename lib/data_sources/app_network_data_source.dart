import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:id_checker/common/const.dart';

import '../common/failure.dart';
import '../models/codashop_nickname_model.dart';
import '../models/codashop_nickname_request_model.dart';

abstract class AppRemoteDataSource {
  Future<CodashopNicknameModel> getNickname({
    required String gameId,
    required CodashopNicknameRequestModel data,
  });
}

class AppRemoteDataSourceImpl implements AppRemoteDataSource {
  @override
  Future<CodashopNicknameModel> getNickname({
    required String gameId,
    required CodashopNicknameRequestModel data,
  }) async {
    final headers = {
      "Content-Type": "application/x-www-form-urlencoded",
      "Accept": "application/json",
      "Access_Control_Allow_Origin": "*",
    };
    final request = http.Request(
      "POST",
      Uri.parse("${codashopBaseUrl}initPayment.action"),
    );

    request.headers.addAll(headers);
    request.bodyFields = data.toJsonString();

    final response = await request.send();

    final body = await response.stream.bytesToString();

    if (response.statusCode == 200 || response.statusCode == 201) {
      if (json.decode(body)['errorMsg'].toString().isEmpty) {
        return CodashopNicknameModel.fromJson(json.decode(body));
      } else {
        throw ResponseFailure(
          json.decode(body)['errorMsg'] ?? 'Nickname not found',
          statusCode: response.statusCode,
        );
      }
    } else {
      throw ResponseFailure(
        "Failed to get nickname",
        statusCode: response.statusCode,
      );
    }
  }
}
