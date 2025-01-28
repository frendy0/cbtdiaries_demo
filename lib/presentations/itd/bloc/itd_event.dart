import 'package:equatable/equatable.dart';

import '../../../domain/authentication/entities/user_model.dart';
import '../../../domain/itd/entities/itd_note_model.dart';

abstract class ItdEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ItdInitializeEvent extends ItdEvent {}

class ItdUserChangedEvent extends ItdEvent {
  final User? user;

  ItdUserChangedEvent({required this.user});

  @override
  List<Object?> get props => [user];
}

class ItdAddNoteEvent extends ItdEvent {
  final ItdNote itdNote;

  ItdAddNoteEvent({required this.itdNote});

  @override
  List<Object?> get props => [itdNote];
}

class ItdNextPageEvent extends ItdEvent {}

class ItdDeleteNoteEvent extends ItdEvent {
  final ItdNote itdNote;

  ItdDeleteNoteEvent({required this.itdNote});

  @override
  List<Object?> get props => [itdNote];
}

class ItdUpdateNoteEvent extends ItdEvent {
  final ItdNote itdNote;

  ItdUpdateNoteEvent({required this.itdNote});

  @override
  List<Object?> get props => [itdNote];
}
