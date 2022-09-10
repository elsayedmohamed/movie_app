import '../ntework/error_message_model.dart';

class ServerErrorException implements Exception {
  final ErrorMessageModel errorMessageModel;

  const ServerErrorException({
    required this.errorMessageModel,
  });
}

class LocalDataBaseException implements Exception {
  final String message;

  const LocalDataBaseException({
    required this.message,
  });
}
