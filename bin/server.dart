import 'dart:convert';
import 'dart:io';

import 'package:id_checker/requests/get_nickname.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';

// Configure routes.
final _router = Router()
  ..get('/', _rootHandler)
  ..get('/echo/<message>', _echoHandler)
  ..get('/<gameId>', _getNickname);

Response _rootHandler(Request req) {
  return Response.ok('Hello, World!\n');
}

Response _echoHandler(Request request) {
  final message = request.params['message'];
  return Response.ok('$message\n');
}

Future<Response> _getNickname(Request request) async {
  final gameId = request.params['gameId'];

  final userId = request.url.queryParameters['userId'];
  final zoneId = request.url.queryParameters['zoneId'];
  if (gameId == null) {
    return Response.badRequest(
      body: json
          .encode({"status": false, "message": "required parameter gameId"}),
      headers: {
        "Content-Type": "application/json",
      },
    );
  }
  if (userId == null) {
    return Response.badRequest(
      body: json.encode({
        "status": false,
        "message": "required parameter userId",
      }),
      headers: {
        "Content-Type": "application/json",
      },
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
      json.encode({
        "status": false,
        "message": "${l.message} ${gameId}_${userId}_$zoneId",
      }),
      headers: {
        "Content-Type": "application/json",
      },
    );
  }, (r) {
    response = Response.ok(
      json.encode({
        "status": true,
        "message": "Success",
        "data": {
          "game": r.confirmationFields?.productName,
          "userId": r.confirmationFields?.userId,
          "zoneId": r.confirmationFields?.zoneId,
          "nickname": r.confirmationFields?.username,
        },
      }),
      headers: {
        "Content-Type": "application/json",
      },
    );
  });
  return response ??
      Response.forbidden(
        json.encode({
          "status": false,
          "message": "Forbidden ${gameId}_${userId}_$zoneId",
        }),
        headers: {
          "Content-Type": "application/json",
        },
      );
}

void main(List<String> args) async {
  // Use any available host or container IP (usually `0.0.0.0`).
  final ip = InternetAddress.anyIPv4;

  // Configure a pipeline that logs requests.
  final handler =
      Pipeline().addMiddleware(logRequests()).addHandler(_router.call);

  // For running in containers, we respect the PORT environment variable.
  final port = int.parse(Platform.environment['PORT'] ?? '8080');
  final server = await serve(handler, ip, port);
  print('Server listening on port ${server.port}');
}
