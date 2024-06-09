abstract class Failure {
  final String message;
  final int? statusCode;

  const Failure(this.message, {this.statusCode});
}

class Exception extends Failure {
  const Exception(super.message);
}

class ServerFailure extends Failure {
  const ServerFailure(super.message);
}

class RequestFailure extends Failure {
  const RequestFailure(super.message);
}

class ResponseFailure extends Failure {
  const ResponseFailure(super.message, {super.statusCode});
}

class ConnectionFailure extends Failure {
  const ConnectionFailure(super.message);
}

class DatabaseFailure extends Failure {
  const DatabaseFailure(super.message);
}
