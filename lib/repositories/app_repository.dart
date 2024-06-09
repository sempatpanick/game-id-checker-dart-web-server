import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:id_checker/data_sources/app_network_data_source.dart';

import '../common/exception.dart';
import '../common/failure.dart';
import '../models/codashop_nickname_model.dart';
import '../models/codashop_nickname_request_model.dart';

abstract class AppRepository {
  Future<Either<Failure, CodashopNicknameModel>> getNickname({
    required String gameId,
    required CodashopNicknameRequestModel data,
  });
}

class AppRepositoryImpl implements AppRepository {
  final AppRemoteDataSource remoteDataSource = AppRemoteDataSourceImpl();

  @override
  Future<Either<Failure, CodashopNicknameModel>> getNickname({
    required String gameId,
    required CodashopNicknameRequestModel data,
  }) async {
    try {
      final result =
          await remoteDataSource.getNickname(gameId: gameId, data: data);

      return Right(result);
    } on ResponseFailure catch (e) {
      return Left(e);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message ?? ''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }
}
