import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/authentication/entities/user_model.dart';

part 'authentication_state.freezed.dart';

@freezed
class AuthenticationState with _$AuthenticationState {
  const AuthenticationState._();

  const factory AuthenticationState.unauthenticated() = _Unauthenticated;

  const factory AuthenticationState.initial() = _Initial;

  const factory AuthenticationState.loading() = _Loading;

  const factory AuthenticationState.error({
    required String error,
    String? errorMessage,
  }) = _Error;

  const factory AuthenticationState.authenticated({
    required User user,
  }) = _Authenticated;
}
