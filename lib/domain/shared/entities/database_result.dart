import '../enums/database_result_enum.dart';

class DatabaseResult<T> {
  final String? error;
  final String? errorMessage;
  final T? data;
  final DatabaseResultStatus status;

  DatabaseResult.success({required this.data})
      : error = null,
        errorMessage = null,
        status = DatabaseResultStatus.success;

  DatabaseResult.failure({
    required this.error,
    this.errorMessage,
  })  : data = null,
        status = DatabaseResultStatus.error;
}
