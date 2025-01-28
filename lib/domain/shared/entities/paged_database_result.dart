import 'database_result.dart';

class PagedDatabaseResult<T> extends DatabaseResult<T> {
  final bool hasMoreResults;
  final dynamic nextPageToken;

  PagedDatabaseResult.success({
    required super.data,
    this.hasMoreResults = false,
    this.nextPageToken,
  }) : super.success();

  PagedDatabaseResult.failure({
    required super.error,
    super.errorMessage,
    this.hasMoreResults = false,
    this.nextPageToken,
  }) : super.failure();
}
