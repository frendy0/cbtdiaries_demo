import 'package:cloud_firestore/cloud_firestore.dart';

class UserFirestoreDto {
  final String uid;
  final String? displayName;
  final Timestamp created;

  UserFirestoreDto(
      {required this.uid, this.displayName, required this.created});

  factory UserFirestoreDto.fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return UserFirestoreDto(
        uid: doc.id,
        displayName: data['display_name'],
        created: data["created"]);
  }

  Map<String, dynamic> toJson() =>
      {"display_name": displayName, "created": created};
}
