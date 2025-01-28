import 'dart:async';

import 'package:cbtdiaries_demo/domain/authentication/entities/user_model.dart'
    as model;
import 'package:cbtdiaries_demo/domain/shared/entities/database_result.dart';
import 'package:cbtdiaries_demo/infrastructure/database/firestore/authentication/user_firestore_dto.dart';
import 'package:cbtdiaries_demo/infrastructure/database/firestore/authentication/user_firestore_mapper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import '../../../../domain/authentication/repositories/user_repository.dart';
import '../../../../domain/shared/enums/database_result_enum.dart';

class UserRepositoryFirestore implements UserRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final StreamController<model.User?> _userController =
      StreamController.broadcast();

  UserRepositoryFirestore() {
    _auth.authStateChanges().listen(_authStateChanged);
  }

  void _authStateChanged(User? user) async {
    var lastUser = await _userController.stream.last;
    if (lastUser?.uid == user?.uid) return;
    model.User? userData;
    if (user != null) {
      var result = await fetchUserData();
      if (result.status == DatabaseResultStatus.success) {
        userData = result.data;
      }
    }
    _userController.add(userData);
  }

  @override
  Future<DatabaseResult<model.User>> fetchUserData() async {
    try {
      var doc = await _firestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .get();
      model.User? userModel;
      if (!doc.exists) {
        var dto = UserFirestoreDto(
            uid: _auth.currentUser!.uid, created: Timestamp.now());
        await doc.reference.set(dto.toJson());
        userModel = UserFirestoreMapper.toDomain(dto);
      } else {
        userModel =
            UserFirestoreMapper.toDomain(UserFirestoreDto.fromDocument(doc));
      }
      return DatabaseResult.success(data: userModel);
    } catch (e, s) {
      debugPrint("An exception was caught at fetchUserData() $e\n$s");
      return DatabaseResult.failure(error: "database-error");
    }
  }

  @override
  Stream<model.User?> get onUserChanges => _userController.stream;
}
