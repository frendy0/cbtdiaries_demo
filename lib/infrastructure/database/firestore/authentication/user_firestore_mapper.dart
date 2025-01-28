import 'package:cbtdiaries_demo/infrastructure/database/firestore/authentication/user_firestore_dto.dart';

import '../../../../domain/authentication/entities/user_model.dart';

class UserFirestoreMapper {
  static User toDomain(UserFirestoreDto dto) {
    return User(
      uid: dto.uid,
      displayName: dto.displayName,
      created: dto.created.toDate(),
    );
  }
}
