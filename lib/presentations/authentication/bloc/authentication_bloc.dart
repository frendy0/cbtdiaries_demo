import 'dart:async';
import 'package:cbtdiaries_demo/domain/shared/enums/database_result_enum.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../../../domain/authentication/repositories/authentication_repository.dart';
import '../../../domain/authentication/repositories/user_repository.dart';

import 'authentication_event.dart';
import 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationRepository _authenticationRepository;
  final UserRepository _userRepository;
  late StreamSubscription _userSubscription;

  AuthenticationBloc(
      {AuthenticationRepository? authenticationRepository,
      UserRepository? userRepository})
      : _authenticationRepository =
            authenticationRepository ?? GetIt.I<AuthenticationRepository>(),
        _userRepository = userRepository ?? GetIt.I<UserRepository>(),
        super(AuthenticationState.initial()) {
    on<AuthenticationStarted>(_onStarted);
    on<UserChanged>(_onUserChanges);

    add(AuthenticationStarted());
    _userSubscription = _userRepository.onUserChanges
        .listen((user) => add(UserChanged(user: user)));
  }

  Future<void> _onUserChanges(
      UserChanged event, Emitter<AuthenticationState> emit) async {}

  Future<void> _onStarted(
      AuthenticationStarted event, Emitter<AuthenticationState> emit) async {
    try {
      final isSignedIn = await _authenticationRepository.isSignedIn();
      if (isSignedIn) {
        var res = await _userRepository.fetchUserData();
        if (res.status != DatabaseResultStatus.success) {
          throw ('auth-error');
        }
        emit(AuthenticationState.authenticated(user: res.data!));
        return;
      }
      await _authenticationRepository.signInAnonymously();
    } catch (e, s) {
      emit(AuthenticationState.error(error: "auth-error"));
    }
  }

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }
}
