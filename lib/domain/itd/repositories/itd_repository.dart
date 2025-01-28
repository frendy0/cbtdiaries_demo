import '../../shared/entities/database_result.dart';
import '../../shared/entities/paged_database_result.dart';
import '../entities/itd_note_model.dart';

abstract class ItdRepository {
  ItdRepository({required String orderByField});

  Future<DatabaseResult<ItdNote>> addItdNote(ItdNote itdNote);

  Future<PagedDatabaseResult<List<ItdNote>>> nextItdPage({int limit});

  void resetPagination();

  Future<DatabaseResult<bool>> removeItdNote(ItdNote itdNote);

  Future<DatabaseResult<ItdNote>> updateItdNote(ItdNote itdNote);

  Future<PagedDatabaseResult<List<ItdNote>>> loadItdNotes(
      {dynamic nextPageToken,
      required String orderByField,
      required int limit});
}
