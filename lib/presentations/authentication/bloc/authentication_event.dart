import 'package:equatable/equatable.dart';

import '../../../domain/authentication/entities/user_model.dart';

sealed class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();
}

class AuthenticationStarted extends AuthenticationEvent {
  @override
  List<Object?> get props => [];
}

class UserChanged extends AuthenticationEvent {
  final User? user;

  const UserChanged({required this.user});

  @override
  List<Object?> get props => [user];
}
