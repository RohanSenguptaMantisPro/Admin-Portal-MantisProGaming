import 'package:admin_portal_mantis_pro_gaming/core/errors/exceptions.dart';

import 'package:dart_mappable/dart_mappable.dart';

// Will be generated by dart_mappable
part 'failures.mapper.dart';

@MappableClass()
abstract class Failure with FailureMappable {
  Failure({required this.message, required this.statusCode})
      : assert(
          statusCode is String || statusCode is int,
          'StatusCode cannot be a ${statusCode.runtimeType}',
        );

  final String message;
  final dynamic statusCode;

  String get errorMessage =>
      '$statusCode${statusCode is String ? '' : ' Error'}: $message';
}

@MappableClass()
class CacheFailure extends Failure with CacheFailureMappable {
  CacheFailure({required super.message, required super.statusCode});

  CacheFailure.fromException(CacheException exception)
      : this(
          message: exception.message,
          statusCode: exception.statusCode,
        );
}

@MappableClass()
class ServerFailure extends Failure with ServerFailureMappable {
  ServerFailure({required super.message, required super.statusCode});

  ServerFailure.fromException(ServerException exception)
      : this(message: exception.message, statusCode: exception.statusCode);
}
