import '../../shared/entities/database_result.dart';
import '../entities/user_model.dart';

abstract class UserRepository {
  Future<DatabaseResult<User>> fetchUserData();

  Stream<User?> get onUserChanges;
}
