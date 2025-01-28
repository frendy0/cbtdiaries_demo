import 'package:cbtdiaries_demo/domain/shared/enums/database_result_enum.dart';
import 'package:cbtdiaries_demo/infrastructure/database/firestore/itd/itd_note_firestore_dto.dart';
import 'package:cbtdiaries_demo/infrastructure/database/firestore/itd/itd_note_firestore_mapper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../../../../domain/itd/entities/itd_note_model.dart';
import '../../../../domain/itd/repositories/itd_repository.dart';
import '../../../../domain/shared/entities/database_result.dart';
import '../../../../domain/shared/entities/paged_database_result.dart';

class ItdRepositoryFirestore implements ItdRepository {
  dynamic _nextPageToken;
  final String _orderByField;
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  ItdRepositoryFirestore({FirebaseAuth? auth, String? orderByField})
      : _orderByField = orderByField ?? "date_time";

  String? get _currentUserId => _auth.currentUser?.uid;

  @override
  Future<DatabaseResult<ItdNote>> addItdNote(ItdNote itdNote) async {
    await Future.delayed(Duration(seconds: 2));
    try {
      var resId = (await _db
              .collection('users')
              .doc(_currentUserId!)
              .collection('itd_notes')
              .add(ItdNoteFirestoreMapper.fromDomain(itdNote).toJson()))
          .id;

      return DatabaseResult.success(data: itdNote.copyWith(id: resId));
    } catch (e, s) {
      debugPrint("An exception caught in addItdNote $e\nStack Trace: $s");
      return DatabaseResult.failure(
          error: "database", errorMessage: e.toString());
    }
  }

  @override
  Future<PagedDatabaseResult<List<ItdNote>>> nextItdPage(
      {int limit = 20}) async {
    await Future.delayed(Duration(seconds: 2));
    var result = await loadItdNotes(
        nextPageToken: _nextPageToken,
        orderByField: _orderByField,
        limit: limit);

    if (result.status == DatabaseResultStatus.success) {
      _nextPageToken = result.nextPageToken;
    }

    return result;
  }

  @override
  void resetPagination() {
    _nextPageToken = null;
  }

  @override
  Future<DatabaseResult<bool>> removeItdNote(ItdNote itdNote) async {
    await Future.delayed(Duration(seconds: 2));
    try {
      await _db
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .collection('itd_notes')
          .doc(itdNote.id)
          .delete();
      return DatabaseResult.success(data: true);
    } catch (e, s) {
      debugPrint("An exception caught in removeItdNote $e\nStack Trace: $s");
      return DatabaseResult.failure(
          error: "database", errorMessage: e.toString());
    }
  }

  @override
  Future<DatabaseResult<ItdNote>> updateItdNote(ItdNote itdNote) async {
    await Future.delayed(Duration(seconds: 2));
    try {
      await _db
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .collection('itd_notes')
          .doc(itdNote.id)
          .update(ItdNoteFirestoreMapper.fromDomain(itdNote).toJson());
      return DatabaseResult.success(data: itdNote);
    } catch (e, s) {
      debugPrint("An exception caught in updateItdNote $e\nStack Trace: $s");
      return DatabaseResult.failure(
          error: "database", errorMessage: e.toString());
    }
  }

  @override
  Future<PagedDatabaseResult<List<ItdNote>>> loadItdNotes(
      {dynamic nextPageToken,
      required String orderByField,
      required int limit}) async {
    try {
      var query = _db
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .collection('itd_notes')
          .orderBy(orderByField, descending: true)
          .limit(limit);
      if (nextPageToken != null) {
        query = query.startAfter([nextPageToken]);
      }
      var docs = (await query.get()).docs;

      return PagedDatabaseResult.success(
          data: docs
              .map((e) => ItdNoteFirestoreMapper.toDomain(
                  ItdNoteFirestoreDto.fromDocument(e)))
              .toList(),
          nextPageToken:
              docs.isNotEmpty ? docs.last.data()[orderByField] : null,
          hasMoreResults: docs.length == limit);
    } catch (e, s) {
      debugPrint("An exception caught in loadItdNotes $e\nStack Trace: $s");
      return PagedDatabaseResult.failure(
          error: "database", errorMessage: e.toString());
    }
  }
}
