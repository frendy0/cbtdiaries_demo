import 'package:cbtdiaries_demo/domain/authentication/repositories/authentication_repository.dart';
import 'package:cbtdiaries_demo/domain/authentication/repositories/user_repository.dart';
import 'package:cbtdiaries_demo/infrastructure/database/firestore/authentication/authentication_repository_firestore.dart';
import 'package:cbtdiaries_demo/infrastructure/database/firestore/authentication/user_repository_firestore.dart';
import 'package:get_it/get_it.dart';

import 'firestore/itd/itd_repository_firestore.dart';
import '../../domain/itd/repositories/itd_repository.dart';

void setupRepositories() {
  GetIt.I.registerLazySingleton<ItdRepository>(() => ItdRepositoryFirestore());
  GetIt.I
      .registerLazySingleton<UserRepository>(() => UserRepositoryFirestore());
  GetIt.I.registerLazySingleton<AuthenticationRepository>(
      () => AuthenticationRepositoryFirestore());
}
