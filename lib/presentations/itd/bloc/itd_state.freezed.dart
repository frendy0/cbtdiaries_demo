// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'itd_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ItdState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() generalLoading,
    required TResult Function(String error, String? errorMessage) generalError,
    required TResult Function(List<ItdNote> notes, bool hasMoreResults,
            Map<String, ProcessingNote> processingNotes)
        contentLoaded,
    required TResult Function(List<ItdNote> notes, bool hasMoreResults,
            Map<String, ProcessingNote> processingNotes)
        loadingNextPage,
    required TResult Function(List<ItdNote> notes, bool hasMoreResults,
            Map<String, ProcessingNote> processingNotes)
        processingMutation,
    required TResult Function(List<ItdNote> notes, bool hasMoreResults,
            Map<String, ProcessingNote> processingNotes, ProcessingNote result)
        mutationResult,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? generalLoading,
    TResult? Function(String error, String? errorMessage)? generalError,
    TResult? Function(List<ItdNote> notes, bool hasMoreResults,
            Map<String, ProcessingNote> processingNotes)?
        contentLoaded,
    TResult? Function(List<ItdNote> notes, bool hasMoreResults,
            Map<String, ProcessingNote> processingNotes)?
        loadingNextPage,
    TResult? Function(List<ItdNote> notes, bool hasMoreResults,
            Map<String, ProcessingNote> processingNotes)?
        processingMutation,
    TResult? Function(List<ItdNote> notes, bool hasMoreResults,
            Map<String, ProcessingNote> processingNotes, ProcessingNote result)?
        mutationResult,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? generalLoading,
    TResult Function(String error, String? errorMessage)? generalError,
    TResult Function(List<ItdNote> notes, bool hasMoreResults,
            Map<String, ProcessingNote> processingNotes)?
        contentLoaded,
    TResult Function(List<ItdNote> notes, bool hasMoreResults,
            Map<String, ProcessingNote> processingNotes)?
        loadingNextPage,
    TResult Function(List<ItdNote> notes, bool hasMoreResults,
            Map<String, ProcessingNote> processingNotes)?
        processingMutation,
    TResult Function(List<ItdNote> notes, bool hasMoreResults,
            Map<String, ProcessingNote> processingNotes, ProcessingNote result)?
        mutationResult,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_GeneralLoading value) generalLoading,
    required TResult Function(_GeneralError value) generalError,
    required TResult Function(_ContentLoaded value) contentLoaded,
    required TResult Function(_LoadingNextPage value) loadingNextPage,
    required TResult Function(_LoadingMutation value) processingMutation,
    required TResult Function(_MutationResult value) mutationResult,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_GeneralLoading value)? generalLoading,
    TResult? Function(_GeneralError value)? generalError,
    TResult? Function(_ContentLoaded value)? contentLoaded,
    TResult? Function(_LoadingNextPage value)? loadingNextPage,
    TResult? Function(_LoadingMutation value)? processingMutation,
    TResult? Function(_MutationResult value)? mutationResult,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_GeneralLoading value)? generalLoading,
    TResult Function(_GeneralError value)? generalError,
    TResult Function(_ContentLoaded value)? contentLoaded,
    TResult Function(_LoadingNextPage value)? loadingNextPage,
    TResult Function(_LoadingMutation value)? processingMutation,
    TResult Function(_MutationResult value)? mutationResult,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItdStateCopyWith<$Res> {
  factory $ItdStateCopyWith(ItdState value, $Res Function(ItdState) then) =
      _$ItdStateCopyWithImpl<$Res, ItdState>;
}

/// @nodoc
class _$ItdStateCopyWithImpl<$Res, $Val extends ItdState>
    implements $ItdStateCopyWith<$Res> {
  _$ItdStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ItdState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$ItdStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of ItdState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl extends _Initial with DiagnosticableTreeMixin {
  const _$InitialImpl() : super._();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ItdState.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'ItdState.initial'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() generalLoading,
    required TResult Function(String error, String? errorMessage) generalError,
    required TResult Function(List<ItdNote> notes, bool hasMoreResults,
            Map<String, ProcessingNote> processingNotes)
        contentLoaded,
    required TResult Function(List<ItdNote> notes, bool hasMoreResults,
            Map<String, ProcessingNote> processingNotes)
        loadingNextPage,
    required TResult Function(List<ItdNote> notes, bool hasMoreResults,
            Map<String, ProcessingNote> processingNotes)
        processingMutation,
    required TResult Function(List<ItdNote> notes, bool hasMoreResults,
            Map<String, ProcessingNote> processingNotes, ProcessingNote result)
        mutationResult,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? generalLoading,
    TResult? Function(String error, String? errorMessage)? generalError,
    TResult? Function(List<ItdNote> notes, bool hasMoreResults,
            Map<String, ProcessingNote> processingNotes)?
        contentLoaded,
    TResult? Function(List<ItdNote> notes, bool hasMoreResults,
            Map<String, ProcessingNote> processingNotes)?
        loadingNextPage,
    TResult? Function(List<ItdNote> notes, bool hasMoreResults,
            Map<String, ProcessingNote> processingNotes)?
        processingMutation,
    TResult? Function(List<ItdNote> notes, bool hasMoreResults,
            Map<String, ProcessingNote> processingNotes, ProcessingNote result)?
        mutationResult,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? generalLoading,
    TResult Function(String error, String? errorMessage)? generalError,
    TResult Function(List<ItdNote> notes, bool hasMoreResults,
            Map<String, ProcessingNote> processingNotes)?
        contentLoaded,
    TResult Function(List<ItdNote> notes, bool hasMoreResults,
            Map<String, ProcessingNote> processingNotes)?
        loadingNextPage,
    TResult Function(List<ItdNote> notes, bool hasMoreResults,
            Map<String, ProcessingNote> processingNotes)?
        processingMutation,
    TResult Function(List<ItdNote> notes, bool hasMoreResults,
            Map<String, ProcessingNote> processingNotes, ProcessingNote result)?
        mutationResult,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_GeneralLoading value) generalLoading,
    required TResult Function(_GeneralError value) generalError,
    required TResult Function(_ContentLoaded value) contentLoaded,
    required TResult Function(_LoadingNextPage value) loadingNextPage,
    required TResult Function(_LoadingMutation value) processingMutation,
    required TResult Function(_MutationResult value) mutationResult,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_GeneralLoading value)? generalLoading,
    TResult? Function(_GeneralError value)? generalError,
    TResult? Function(_ContentLoaded value)? contentLoaded,
    TResult? Function(_LoadingNextPage value)? loadingNextPage,
    TResult? Function(_LoadingMutation value)? processingMutation,
    TResult? Function(_MutationResult value)? mutationResult,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_GeneralLoading value)? generalLoading,
    TResult Function(_GeneralError value)? generalError,
    TResult Function(_ContentLoaded value)? contentLoaded,
    TResult Function(_LoadingNextPage value)? loadingNextPage,
    TResult Function(_LoadingMutation value)? processingMutation,
    TResult Function(_MutationResult value)? mutationResult,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial extends ItdState {
  const factory _Initial() = _$InitialImpl;
  const _Initial._() : super._();
}

/// @nodoc
abstract class _$$GeneralLoadingImplCopyWith<$Res> {
  factory _$$GeneralLoadingImplCopyWith(_$GeneralLoadingImpl value,
          $Res Function(_$GeneralLoadingImpl) then) =
      __$$GeneralLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GeneralLoadingImplCopyWithImpl<$Res>
    extends _$ItdStateCopyWithImpl<$Res, _$GeneralLoadingImpl>
    implements _$$GeneralLoadingImplCopyWith<$Res> {
  __$$GeneralLoadingImplCopyWithImpl(
      _$GeneralLoadingImpl _value, $Res Function(_$GeneralLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of ItdState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GeneralLoadingImpl extends _GeneralLoading
    with DiagnosticableTreeMixin {
  const _$GeneralLoadingImpl() : super._();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ItdState.generalLoading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'ItdState.generalLoading'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GeneralLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() generalLoading,
    required TResult Function(String error, String? errorMessage) generalError,
    required TResult Function(List<ItdNote> notes, bool hasMoreResults,
            Map<String, ProcessingNote> processingNotes)
        contentLoaded,
    required TResult Function(List<ItdNote> notes, bool hasMoreResults,
            Map<String, ProcessingNote> processingNotes)
        loadingNextPage,
    required TResult Function(List<ItdNote> notes, bool hasMoreResults,
            Map<String, ProcessingNote> processingNotes)
        processingMutation,
    required TResult Function(List<ItdNote> notes, bool hasMoreResults,
            Map<String, ProcessingNote> processingNotes, ProcessingNote result)
        mutationResult,
  }) {
    return generalLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? generalLoading,
    TResult? Function(String error, String? errorMessage)? generalError,
    TResult? Function(List<ItdNote> notes, bool hasMoreResults,
            Map<String, ProcessingNote> processingNotes)?
        contentLoaded,
    TResult? Function(List<ItdNote> notes, bool hasMoreResults,
            Map<String, ProcessingNote> processingNotes)?
        loadingNextPage,
    TResult? Function(List<ItdNote> notes, bool hasMoreResults,
            Map<String, ProcessingNote> processingNotes)?
        processingMutation,
    TResult? Function(List<ItdNote> notes, bool hasMoreResults,
            Map<String, ProcessingNote> processingNotes, ProcessingNote result)?
        mutationResult,
  }) {
    return generalLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? generalLoading,
    TResult Function(String error, String? errorMessage)? generalError,
    TResult Function(List<ItdNote> notes, bool hasMoreResults,
            Map<String, ProcessingNote> processingNotes)?
        contentLoaded,
    TResult Function(List<ItdNote> notes, bool hasMoreResults,
            Map<String, ProcessingNote> processingNotes)?
        loadingNextPage,
    TResult Function(List<ItdNote> notes, bool hasMoreResults,
            Map<String, ProcessingNote> processingNotes)?
        processingMutation,
    TResult Function(List<ItdNote> notes, bool hasMoreResults,
            Map<String, ProcessingNote> processingNotes, ProcessingNote result)?
        mutationResult,
    required TResult orElse(),
  }) {
    if (generalLoading != null) {
      return generalLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_GeneralLoading value) generalLoading,
    required TResult Function(_GeneralError value) generalError,
    required TResult Function(_ContentLoaded value) contentLoaded,
    required TResult Function(_LoadingNextPage value) loadingNextPage,
    required TResult Function(_LoadingMutation value) processingMutation,
    required TResult Function(_MutationResult value) mutationResult,
  }) {
    return generalLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_GeneralLoading value)? generalLoading,
    TResult? Function(_GeneralError value)? generalError,
    TResult? Function(_ContentLoaded value)? contentLoaded,
    TResult? Function(_LoadingNextPage value)? loadingNextPage,
    TResult? Function(_LoadingMutation value)? processingMutation,
    TResult? Function(_MutationResult value)? mutationResult,
  }) {
    return generalLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_GeneralLoading value)? generalLoading,
    TResult Function(_GeneralError value)? generalError,
    TResult Function(_ContentLoaded value)? contentLoaded,
    TResult Function(_LoadingNextPage value)? loadingNextPage,
    TResult Function(_LoadingMutation value)? processingMutation,
    TResult Function(_MutationResult value)? mutationResult,
    required TResult orElse(),
  }) {
    if (generalLoading != null) {
      return generalLoading(this);
    }
    return orElse();
  }
}

abstract class _GeneralLoading extends ItdState {
  const factory _GeneralLoading() = _$GeneralLoadingImpl;
  const _GeneralLoading._() : super._();
}

/// @nodoc
abstract class _$$GeneralErrorImplCopyWith<$Res> {
  factory _$$GeneralErrorImplCopyWith(
          _$GeneralErrorImpl value, $Res Function(_$GeneralErrorImpl) then) =
      __$$GeneralErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error, String? errorMessage});
}

/// @nodoc
class __$$GeneralErrorImplCopyWithImpl<$Res>
    extends _$ItdStateCopyWithImpl<$Res, _$GeneralErrorImpl>
    implements _$$GeneralErrorImplCopyWith<$Res> {
  __$$GeneralErrorImplCopyWithImpl(
      _$GeneralErrorImpl _value, $Res Function(_$GeneralErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of ItdState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$GeneralErrorImpl(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$GeneralErrorImpl extends _GeneralError with DiagnosticableTreeMixin {
  const _$GeneralErrorImpl({required this.error, this.errorMessage})
      : super._();

  @override
  final String error;
  @override
  final String? errorMessage;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ItdState.generalError(error: $error, errorMessage: $errorMessage)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ItdState.generalError'))
      ..add(DiagnosticsProperty('error', error))
      ..add(DiagnosticsProperty('errorMessage', errorMessage));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GeneralErrorImpl &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error, errorMessage);

  /// Create a copy of ItdState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GeneralErrorImplCopyWith<_$GeneralErrorImpl> get copyWith =>
      __$$GeneralErrorImplCopyWithImpl<_$GeneralErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() generalLoading,
    required TResult Function(String error, String? errorMessage) generalError,
    required TResult Function(List<ItdNote> notes, bool hasMoreResults,
            Map<String, ProcessingNote> processingNotes)
        contentLoaded,
    required TResult Function(List<ItdNote> notes, bool hasMoreResults,
            Map<String, ProcessingNote> processingNotes)
        loadingNextPage,
    required TResult Function(List<ItdNote> notes, bool hasMoreResults,
            Map<String, ProcessingNote> processingNotes)
        processingMutation,
    required TResult Function(List<ItdNote> notes, bool hasMoreResults,
            Map<String, ProcessingNote> processingNotes, ProcessingNote result)
        mutationResult,
  }) {
    return generalError(error, errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? generalLoading,
    TResult? Function(String error, String? errorMessage)? generalError,
    TResult? Function(List<ItdNote> notes, bool hasMoreResults,
            Map<String, ProcessingNote> processingNotes)?
        contentLoaded,
    TResult? Function(List<ItdNote> notes, bool hasMoreResults,
            Map<String, ProcessingNote> processingNotes)?
        loadingNextPage,
    TResult? Function(List<ItdNote> notes, bool hasMoreResults,
            Map<String, ProcessingNote> processingNotes)?
        processingMutation,
    TResult? Function(List<ItdNote> notes, bool hasMoreResults,
            Map<String, ProcessingNote> processingNotes, ProcessingNote result)?
        mutationResult,
  }) {
    return generalError?.call(error, errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? generalLoading,
    TResult Function(String error, String? errorMessage)? generalError,
    TResult Function(List<ItdNote> notes, bool hasMoreResults,
            Map<String, ProcessingNote> processingNotes)?
        contentLoaded,
    TResult Function(List<ItdNote> notes, bool hasMoreResults,
            Map<String, ProcessingNote> processingNotes)?
        loadingNextPage,
    TResult Function(List<ItdNote> notes, bool hasMoreResults,
            Map<String, ProcessingNote> processingNotes)?
        processingMutation,
    TResult Function(List<ItdNote> notes, bool hasMoreResults,
            Map<String, ProcessingNote> processingNotes, ProcessingNote result)?
        mutationResult,
    required TResult orElse(),
  }) {
    if (generalError != null) {
      return generalError(error, errorMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_GeneralLoading value) generalLoading,
    required TResult Function(_GeneralError value) generalError,
    required TResult Function(_ContentLoaded value) contentLoaded,
    required TResult Function(_LoadingNextPage value) loadingNextPage,
    required TResult Function(_LoadingMutation value) processingMutation,
    required TResult Function(_MutationResult value) mutationResult,
  }) {
    return generalError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_GeneralLoading value)? generalLoading,
    TResult? Function(_GeneralError value)? generalError,
    TResult? Function(_ContentLoaded value)? contentLoaded,
    TResult? Function(_LoadingNextPage value)? loadingNextPage,
    TResult? Function(_LoadingMutation value)? processingMutation,
    TResult? Function(_MutationResult value)? mutationResult,
  }) {
    return generalError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_GeneralLoading value)? generalLoading,
    TResult Function(_GeneralError value)? generalError,
    TResult Function(_ContentLoaded value)? contentLoaded,
    TResult Function(_LoadingNextPage value)? loadingNextPage,
    TResult Function(_LoadingMutation value)? processingMutation,
    TResult Function(_MutationResult value)? mutationResult,
    required TResult orElse(),
  }) {
    if (generalError != null) {
      return generalError(this);
    }
    return orElse();
  }
}

abstract class _GeneralError extends ItdState {
  const factory _GeneralError(
      {required final String error,
      final String? errorMessage}) = _$GeneralErrorImpl;
  const _GeneralError._() : super._();

  String get error;
  String? get errorMessage;

  /// Create a copy of ItdState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GeneralErrorImplCopyWith<_$GeneralErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ContentLoadedImplCopyWith<$Res> {
  factory _$$ContentLoadedImplCopyWith(
          _$ContentLoadedImpl value, $Res Function(_$ContentLoadedImpl) then) =
      __$$ContentLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<ItdNote> notes,
      bool hasMoreResults,
      Map<String, ProcessingNote> processingNotes});
}

/// @nodoc
class __$$ContentLoadedImplCopyWithImpl<$Res>
    extends _$ItdStateCopyWithImpl<$Res, _$ContentLoadedImpl>
    implements _$$ContentLoadedImplCopyWith<$Res> {
  __$$ContentLoadedImplCopyWithImpl(
      _$ContentLoadedImpl _value, $Res Function(_$ContentLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of ItdState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notes = null,
    Object? hasMoreResults = null,
    Object? processingNotes = null,
  }) {
    return _then(_$ContentLoadedImpl(
      notes: null == notes
          ? _value._notes
          : notes // ignore: cast_nullable_to_non_nullable
              as List<ItdNote>,
      hasMoreResults: null == hasMoreResults
          ? _value.hasMoreResults
          : hasMoreResults // ignore: cast_nullable_to_non_nullable
              as bool,
      processingNotes: null == processingNotes
          ? _value._processingNotes
          : processingNotes // ignore: cast_nullable_to_non_nullable
              as Map<String, ProcessingNote>,
    ));
  }
}

/// @nodoc

class _$ContentLoadedImpl extends _ContentLoaded with DiagnosticableTreeMixin {
  const _$ContentLoadedImpl(
      {required final List<ItdNote> notes,
      required this.hasMoreResults,
      required final Map<String, ProcessingNote> processingNotes})
      : _notes = notes,
        _processingNotes = processingNotes,
        super._();

  final List<ItdNote> _notes;
  @override
  List<ItdNote> get notes {
    if (_notes is EqualUnmodifiableListView) return _notes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_notes);
  }

  @override
  final bool hasMoreResults;
  final Map<String, ProcessingNote> _processingNotes;
  @override
  Map<String, ProcessingNote> get processingNotes {
    if (_processingNotes is EqualUnmodifiableMapView) return _processingNotes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_processingNotes);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ItdState.contentLoaded(notes: $notes, hasMoreResults: $hasMoreResults, processingNotes: $processingNotes)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ItdState.contentLoaded'))
      ..add(DiagnosticsProperty('notes', notes))
      ..add(DiagnosticsProperty('hasMoreResults', hasMoreResults))
      ..add(DiagnosticsProperty('processingNotes', processingNotes));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContentLoadedImpl &&
            const DeepCollectionEquality().equals(other._notes, _notes) &&
            (identical(other.hasMoreResults, hasMoreResults) ||
                other.hasMoreResults == hasMoreResults) &&
            const DeepCollectionEquality()
                .equals(other._processingNotes, _processingNotes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_notes),
      hasMoreResults,
      const DeepCollectionEquality().hash(_processingNotes));

  /// Create a copy of ItdState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ContentLoadedImplCopyWith<_$ContentLoadedImpl> get copyWith =>
      __$$ContentLoadedImplCopyWithImpl<_$ContentLoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() generalLoading,
    required TResult Function(String error, String? errorMessage) generalError,
    required TResult Function(List<ItdNote> notes, bool hasMoreResults,
            Map<String, ProcessingNote> processingNotes)
        contentLoaded,
    required TResult Function(List<ItdNote> notes, bool hasMoreResults,
            Map<String, ProcessingNote> processingNotes)
        loadingNextPage,
    required TResult Function(List<ItdNote> notes, bool hasMoreResults,
            Map<String, ProcessingNote> processingNotes)
        processingMutation,
    required TResult Function(List<ItdNote> notes, bool hasMoreResults,
            Map<String, ProcessingNote> processingNotes, ProcessingNote result)
        mutationResult,
  }) {
    return contentLoaded(notes, hasMoreResults, processingNotes);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? generalLoading,
    TResult? Function(String error, String? errorMessage)? generalError,
    TResult? Function(List<ItdNote> notes, bool hasMoreResults,
            Map<String, ProcessingNote> processingNotes)?
        contentLoaded,
    TResult? Function(List<ItdNote> notes, bool hasMoreResults,
            Map<String, ProcessingNote> processingNotes)?
        loadingNextPage,
    TResult? Function(List<ItdNote> notes, bool hasMoreResults,
            Map<String, ProcessingNote> processingNotes)?
        processingMutation,
    TResult? Function(List<ItdNote> notes, bool hasMoreResults,
            Map<String, ProcessingNote> processingNotes, ProcessingNote result)?
        mutationResult,
  }) {
    return contentLoaded?.call(notes, hasMoreResults, processingNotes);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? generalLoading,
    TResult Function(String error, String? errorMessage)? generalError,
    TResult Function(List<ItdNote> notes, bool hasMoreResults,
            Map<String, ProcessingNote> processingNotes)?
        contentLoaded,
    TResult Function(List<ItdNote> notes, bool hasMoreResults,
            Map<String, ProcessingNote> processingNotes)?
        loadingNextPage,
    TResult Function(List<ItdNote> notes, bool hasMoreResults,
            Map<String, ProcessingNote> processingNotes)?
        processingMutation,
    TResult Function(List<ItdNote> notes, bool hasMoreResults,
            Map<String, ProcessingNote> processingNotes, ProcessingNote result)?
        mutationResult,
    required TResult orElse(),
  }) {
    if (contentLoaded != null) {
      return contentLoaded(notes, hasMoreResults, processingNotes);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_GeneralLoading value) generalLoading,
    required TResult Function(_GeneralError value) generalError,
    required TResult Function(_ContentLoaded value) contentLoaded,
    required TResult Function(_LoadingNextPage value) loadingNextPage,
    required TResult Function(_LoadingMutation value) processingMutation,
    required TResult Function(_MutationResult value) mutationResult,
  }) {
    return contentLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_GeneralLoading value)? generalLoading,
    TResult? Function(_GeneralError value)? generalError,
    TResult? Function(_ContentLoaded value)? contentLoaded,
    TResult? Function(_LoadingNextPage value)? loadingNextPage,
    TResult? Function(_LoadingMutation value)? processingMutation,
    TResult? Function(_MutationResult value)? mutationResult,
  }) {
    return contentLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_GeneralLoading value)? generalLoading,
    TResult Function(_GeneralError value)? generalError,
    TResult Function(_ContentLoaded value)? contentLoaded,
    TResult Function(_LoadingNextPage value)? loadingNextPage,
    TResult Function(_LoadingMutation value)? processingMutation,
    TResult Function(_MutationResult value)? mutationResult,
    required TResult orElse(),
  }) {
    if (contentLoaded != null) {
      return contentLoaded(this);
    }
    return orElse();
  }
}

abstract class _ContentLoaded extends ItdState
    implements ItdContentStateInterface {
  const factory _ContentLoaded(
          {required final List<ItdNote> notes,
          required final bool hasMoreResults,
          required final Map<String, ProcessingNote> processingNotes}) =
      _$ContentLoadedImpl;
  const _ContentLoaded._() : super._();

  List<ItdNote> get notes;
  bool get hasMoreResults;
  Map<String, ProcessingNote> get processingNotes;

  /// Create a copy of ItdState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ContentLoadedImplCopyWith<_$ContentLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadingNextPageImplCopyWith<$Res> {
  factory _$$LoadingNextPageImplCopyWith(_$LoadingNextPageImpl value,
          $Res Function(_$LoadingNextPageImpl) then) =
      __$$LoadingNextPageImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<ItdNote> notes,
      bool hasMoreResults,
      Map<String, ProcessingNote> processingNotes});
}

/// @nodoc
class __$$LoadingNextPageImplCopyWithImpl<$Res>
    extends _$ItdStateCopyWithImpl<$Res, _$LoadingNextPageImpl>
    implements _$$LoadingNextPageImplCopyWith<$Res> {
  __$$LoadingNextPageImplCopyWithImpl(
      _$LoadingNextPageImpl _value, $Res Function(_$LoadingNextPageImpl) _then)
      : super(_value, _then);

  /// Create a copy of ItdState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notes = null,
    Object? hasMoreResults = null,
    Object? processingNotes = null,
  }) {
    return _then(_$LoadingNextPageImpl(
      notes: null == notes
          ? _value._notes
          : notes // ignore: cast_nullable_to_non_nullable
              as List<ItdNote>,
      hasMoreResults: null == hasMoreResults
          ? _value.hasMoreResults
          : hasMoreResults // ignore: cast_nullable_to_non_nullable
              as bool,
      processingNotes: null == processingNotes
          ? _value._processingNotes
          : processingNotes // ignore: cast_nullable_to_non_nullable
              as Map<String, ProcessingNote>,
    ));
  }
}

/// @nodoc

class _$LoadingNextPageImpl extends _LoadingNextPage
    with DiagnosticableTreeMixin {
  const _$LoadingNextPageImpl(
      {required final List<ItdNote> notes,
      required this.hasMoreResults,
      required final Map<String, ProcessingNote> processingNotes})
      : _notes = notes,
        _processingNotes = processingNotes,
        super._();

  final List<ItdNote> _notes;
  @override
  List<ItdNote> get notes {
    if (_notes is EqualUnmodifiableListView) return _notes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_notes);
  }

  @override
  final bool hasMoreResults;
  final Map<String, ProcessingNote> _processingNotes;
  @override
  Map<String, ProcessingNote> get processingNotes {
    if (_processingNotes is EqualUnmodifiableMapView) return _processingNotes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_processingNotes);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ItdState.loadingNextPage(notes: $notes, hasMoreResults: $hasMoreResults, processingNotes: $processingNotes)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ItdState.loadingNextPage'))
      ..add(DiagnosticsProperty('notes', notes))
      ..add(DiagnosticsProperty('hasMoreResults', hasMoreResults))
      ..add(DiagnosticsProperty('processingNotes', processingNotes));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingNextPageImpl &&
            const DeepCollectionEquality().equals(other._notes, _notes) &&
            (identical(other.hasMoreResults, hasMoreResults) ||
                other.hasMoreResults == hasMoreResults) &&
            const DeepCollectionEquality()
                .equals(other._processingNotes, _processingNotes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_notes),
      hasMoreResults,
      const DeepCollectionEquality().hash(_processingNotes));

  /// Create a copy of ItdState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadingNextPageImplCopyWith<_$LoadingNextPageImpl> get copyWith =>
      __$$LoadingNextPageImplCopyWithImpl<_$LoadingNextPageImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() generalLoading,
    required TResult Function(String error, String? errorMessage) generalError,
    required TResult Function(List<ItdNote> notes, bool hasMoreResults,
            Map<String, ProcessingNote> processingNotes)
        contentLoaded,
    required TResult Function(List<ItdNote> notes, bool hasMoreResults,
            Map<String, ProcessingNote> processingNotes)
        loadingNextPage,
    required TResult Function(List<ItdNote> notes, bool hasMoreResults,
            Map<String, ProcessingNote> processingNotes)
        processingMutation,
    required TResult Function(List<ItdNote> notes, bool hasMoreResults,
            Map<String, ProcessingNote> processingNotes, ProcessingNote result)
        mutationResult,
  }) {
    return loadingNextPage(notes, hasMoreResults, processingNotes);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? generalLoading,
    TResult? Function(String error, String? errorMessage)? generalError,
    TResult? Function(List<ItdNote> notes, bool hasMoreResults,
            Map<String, ProcessingNote> processingNotes)?
        contentLoaded,
    TResult? Function(List<ItdNote> notes, bool hasMoreResults,
            Map<String, ProcessingNote> processingNotes)?
        loadingNextPage,
    TResult? Function(List<ItdNote> notes, bool hasMoreResults,
            Map<String, ProcessingNote> processingNotes)?
        processingMutation,
    TResult? Function(List<ItdNote> notes, bool hasMoreResults,
            Map<String, ProcessingNote> processingNotes, ProcessingNote result)?
        mutationResult,
  }) {
    return loadingNextPage?.call(notes, hasMoreResults, processingNotes);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? generalLoading,
    TResult Function(String error, String? errorMessage)? generalError,
    TResult Function(List<ItdNote> notes, bool hasMoreResults,
            Map<String, ProcessingNote> processingNotes)?
        contentLoaded,
    TResult Function(List<ItdNote> notes, bool hasMoreResults,
            Map<String, ProcessingNote> processingNotes)?
        loadingNextPage,
    TResult Function(List<ItdNote> notes, bool hasMoreResults,
            Map<String, ProcessingNote> processingNotes)?
        processingMutation,
    TResult Function(List<ItdNote> notes, bool hasMoreResults,
            Map<String, ProcessingNote> processingNotes, ProcessingNote result)?
        mutationResult,
    required TResult orElse(),
  }) {
    if (loadingNextPage != null) {
      return loadingNextPage(notes, hasMoreResults, processingNotes);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_GeneralLoading value) generalLoading,
    required TResult Function(_GeneralError value) generalError,
    required TResult Function(_ContentLoaded value) contentLoaded,
    required TResult Function(_LoadingNextPage value) loadingNextPage,
    required TResult Function(_LoadingMutation value) processingMutation,
    required TResult Function(_MutationResult value) mutationResult,
  }) {
    return loadingNextPage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_GeneralLoading value)? generalLoading,
    TResult? Function(_GeneralError value)? generalError,
    TResult? Function(_ContentLoaded value)? contentLoaded,
    TResult? Function(_LoadingNextPage value)? loadingNextPage,
    TResult? Function(_LoadingMutation value)? processingMutation,
    TResult? Function(_MutationResult value)? mutationResult,
  }) {
    return loadingNextPage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_GeneralLoading value)? generalLoading,
    TResult Function(_GeneralError value)? generalError,
    TResult Function(_ContentLoaded value)? contentLoaded,
    TResult Function(_LoadingNextPage value)? loadingNextPage,
    TResult Function(_LoadingMutation value)? processingMutation,
    TResult Function(_MutationResult value)? mutationResult,
    required TResult orElse(),
  }) {
    if (loadingNextPage != null) {
      return loadingNextPage(this);
    }
    return orElse();
  }
}

abstract class _LoadingNextPage extends ItdState
    implements ItdContentStateInterface {
  const factory _LoadingNextPage(
          {required final List<ItdNote> notes,
          required final bool hasMoreResults,
          required final Map<String, ProcessingNote> processingNotes}) =
      _$LoadingNextPageImpl;
  const _LoadingNextPage._() : super._();

  List<ItdNote> get notes;
  bool get hasMoreResults;
  Map<String, ProcessingNote> get processingNotes;

  /// Create a copy of ItdState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadingNextPageImplCopyWith<_$LoadingNextPageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadingMutationImplCopyWith<$Res> {
  factory _$$LoadingMutationImplCopyWith(_$LoadingMutationImpl value,
          $Res Function(_$LoadingMutationImpl) then) =
      __$$LoadingMutationImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<ItdNote> notes,
      bool hasMoreResults,
      Map<String, ProcessingNote> processingNotes});
}

/// @nodoc
class __$$LoadingMutationImplCopyWithImpl<$Res>
    extends _$ItdStateCopyWithImpl<$Res, _$LoadingMutationImpl>
    implements _$$LoadingMutationImplCopyWith<$Res> {
  __$$LoadingMutationImplCopyWithImpl(
      _$LoadingMutationImpl _value, $Res Function(_$LoadingMutationImpl) _then)
      : super(_value, _then);

  /// Create a copy of ItdState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notes = null,
    Object? hasMoreResults = null,
    Object? processingNotes = null,
  }) {
    return _then(_$LoadingMutationImpl(
      notes: null == notes
          ? _value._notes
          : notes // ignore: cast_nullable_to_non_nullable
              as List<ItdNote>,
      hasMoreResults: null == hasMoreResults
          ? _value.hasMoreResults
          : hasMoreResults // ignore: cast_nullable_to_non_nullable
              as bool,
      processingNotes: null == processingNotes
          ? _value._processingNotes
          : processingNotes // ignore: cast_nullable_to_non_nullable
              as Map<String, ProcessingNote>,
    ));
  }
}

/// @nodoc

class _$LoadingMutationImpl extends _LoadingMutation
    with DiagnosticableTreeMixin {
  const _$LoadingMutationImpl(
      {required final List<ItdNote> notes,
      required this.hasMoreResults,
      required final Map<String, ProcessingNote> processingNotes})
      : _notes = notes,
        _processingNotes = processingNotes,
        super._();

  final List<ItdNote> _notes;
  @override
  List<ItdNote> get notes {
    if (_notes is EqualUnmodifiableListView) return _notes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_notes);
  }

  @override
  final bool hasMoreResults;
  final Map<String, ProcessingNote> _processingNotes;
  @override
  Map<String, ProcessingNote> get processingNotes {
    if (_processingNotes is EqualUnmodifiableMapView) return _processingNotes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_processingNotes);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ItdState.processingMutation(notes: $notes, hasMoreResults: $hasMoreResults, processingNotes: $processingNotes)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ItdState.processingMutation'))
      ..add(DiagnosticsProperty('notes', notes))
      ..add(DiagnosticsProperty('hasMoreResults', hasMoreResults))
      ..add(DiagnosticsProperty('processingNotes', processingNotes));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingMutationImpl &&
            const DeepCollectionEquality().equals(other._notes, _notes) &&
            (identical(other.hasMoreResults, hasMoreResults) ||
                other.hasMoreResults == hasMoreResults) &&
            const DeepCollectionEquality()
                .equals(other._processingNotes, _processingNotes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_notes),
      hasMoreResults,
      const DeepCollectionEquality().hash(_processingNotes));

  /// Create a copy of ItdState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadingMutationImplCopyWith<_$LoadingMutationImpl> get copyWith =>
      __$$LoadingMutationImplCopyWithImpl<_$LoadingMutationImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() generalLoading,
    required TResult Function(String error, String? errorMessage) generalError,
    required TResult Function(List<ItdNote> notes, bool hasMoreResults,
            Map<String, ProcessingNote> processingNotes)
        contentLoaded,
    required TResult Function(List<ItdNote> notes, bool hasMoreResults,
            Map<String, ProcessingNote> processingNotes)
        loadingNextPage,
    required TResult Function(List<ItdNote> notes, bool hasMoreResults,
            Map<String, ProcessingNote> processingNotes)
        processingMutation,
    required TResult Function(List<ItdNote> notes, bool hasMoreResults,
            Map<String, ProcessingNote> processingNotes, ProcessingNote result)
        mutationResult,
  }) {
    return processingMutation(notes, hasMoreResults, processingNotes);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? generalLoading,
    TResult? Function(String error, String? errorMessage)? generalError,
    TResult? Function(List<ItdNote> notes, bool hasMoreResults,
            Map<String, ProcessingNote> processingNotes)?
        contentLoaded,
    TResult? Function(List<ItdNote> notes, bool hasMoreResults,
            Map<String, ProcessingNote> processingNotes)?
        loadingNextPage,
    TResult? Function(List<ItdNote> notes, bool hasMoreResults,
            Map<String, ProcessingNote> processingNotes)?
        processingMutation,
    TResult? Function(List<ItdNote> notes, bool hasMoreResults,
            Map<String, ProcessingNote> processingNotes, ProcessingNote result)?
        mutationResult,
  }) {
    return processingMutation?.call(notes, hasMoreResults, processingNotes);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? generalLoading,
    TResult Function(String error, String? errorMessage)? generalError,
    TResult Function(List<ItdNote> notes, bool hasMoreResults,
            Map<String, ProcessingNote> processingNotes)?
        contentLoaded,
    TResult Function(List<ItdNote> notes, bool hasMoreResults,
            Map<String, ProcessingNote> processingNotes)?
        loadingNextPage,
    TResult Function(List<ItdNote> notes, bool hasMoreResults,
            Map<String, ProcessingNote> processingNotes)?
        processingMutation,
    TResult Function(List<ItdNote> notes, bool hasMoreResults,
            Map<String, ProcessingNote> processingNotes, ProcessingNote result)?
        mutationResult,
    required TResult orElse(),
  }) {
    if (processingMutation != null) {
      return processingMutation(notes, hasMoreResults, processingNotes);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_GeneralLoading value) generalLoading,
    required TResult Function(_GeneralError value) generalError,
    required TResult Function(_ContentLoaded value) contentLoaded,
    required TResult Function(_LoadingNextPage value) loadingNextPage,
    required TResult Function(_LoadingMutation value) processingMutation,
    required TResult Function(_MutationResult value) mutationResult,
  }) {
    return processingMutation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_GeneralLoading value)? generalLoading,
    TResult? Function(_GeneralError value)? generalError,
    TResult? Function(_ContentLoaded value)? contentLoaded,
    TResult? Function(_LoadingNextPage value)? loadingNextPage,
    TResult? Function(_LoadingMutation value)? processingMutation,
    TResult? Function(_MutationResult value)? mutationResult,
  }) {
    return processingMutation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_GeneralLoading value)? generalLoading,
    TResult Function(_GeneralError value)? generalError,
    TResult Function(_ContentLoaded value)? contentLoaded,
    TResult Function(_LoadingNextPage value)? loadingNextPage,
    TResult Function(_LoadingMutation value)? processingMutation,
    TResult Function(_MutationResult value)? mutationResult,
    required TResult orElse(),
  }) {
    if (processingMutation != null) {
      return processingMutation(this);
    }
    return orElse();
  }
}

abstract class _LoadingMutation extends ItdState
    implements ItdContentStateInterface {
  const factory _LoadingMutation(
          {required final List<ItdNote> notes,
          required final bool hasMoreResults,
          required final Map<String, ProcessingNote> processingNotes}) =
      _$LoadingMutationImpl;
  const _LoadingMutation._() : super._();

  List<ItdNote> get notes;
  bool get hasMoreResults;
  Map<String, ProcessingNote> get processingNotes;

  /// Create a copy of ItdState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadingMutationImplCopyWith<_$LoadingMutationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MutationResultImplCopyWith<$Res> {
  factory _$$MutationResultImplCopyWith(_$MutationResultImpl value,
          $Res Function(_$MutationResultImpl) then) =
      __$$MutationResultImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<ItdNote> notes,
      bool hasMoreResults,
      Map<String, ProcessingNote> processingNotes,
      ProcessingNote result});
}

/// @nodoc
class __$$MutationResultImplCopyWithImpl<$Res>
    extends _$ItdStateCopyWithImpl<$Res, _$MutationResultImpl>
    implements _$$MutationResultImplCopyWith<$Res> {
  __$$MutationResultImplCopyWithImpl(
      _$MutationResultImpl _value, $Res Function(_$MutationResultImpl) _then)
      : super(_value, _then);

  /// Create a copy of ItdState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notes = null,
    Object? hasMoreResults = null,
    Object? processingNotes = null,
    Object? result = null,
  }) {
    return _then(_$MutationResultImpl(
      notes: null == notes
          ? _value._notes
          : notes // ignore: cast_nullable_to_non_nullable
              as List<ItdNote>,
      hasMoreResults: null == hasMoreResults
          ? _value.hasMoreResults
          : hasMoreResults // ignore: cast_nullable_to_non_nullable
              as bool,
      processingNotes: null == processingNotes
          ? _value._processingNotes
          : processingNotes // ignore: cast_nullable_to_non_nullable
              as Map<String, ProcessingNote>,
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as ProcessingNote,
    ));
  }
}

/// @nodoc

class _$MutationResultImpl extends _MutationResult
    with DiagnosticableTreeMixin {
  const _$MutationResultImpl(
      {required final List<ItdNote> notes,
      required this.hasMoreResults,
      required final Map<String, ProcessingNote> processingNotes,
      required this.result})
      : _notes = notes,
        _processingNotes = processingNotes,
        super._();

  final List<ItdNote> _notes;
  @override
  List<ItdNote> get notes {
    if (_notes is EqualUnmodifiableListView) return _notes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_notes);
  }

  @override
  final bool hasMoreResults;
  final Map<String, ProcessingNote> _processingNotes;
  @override
  Map<String, ProcessingNote> get processingNotes {
    if (_processingNotes is EqualUnmodifiableMapView) return _processingNotes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_processingNotes);
  }

  @override
  final ProcessingNote result;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ItdState.mutationResult(notes: $notes, hasMoreResults: $hasMoreResults, processingNotes: $processingNotes, result: $result)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ItdState.mutationResult'))
      ..add(DiagnosticsProperty('notes', notes))
      ..add(DiagnosticsProperty('hasMoreResults', hasMoreResults))
      ..add(DiagnosticsProperty('processingNotes', processingNotes))
      ..add(DiagnosticsProperty('result', result));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MutationResultImpl &&
            const DeepCollectionEquality().equals(other._notes, _notes) &&
            (identical(other.hasMoreResults, hasMoreResults) ||
                other.hasMoreResults == hasMoreResults) &&
            const DeepCollectionEquality()
                .equals(other._processingNotes, _processingNotes) &&
            (identical(other.result, result) || other.result == result));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_notes),
      hasMoreResults,
      const DeepCollectionEquality().hash(_processingNotes),
      result);

  /// Create a copy of ItdState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MutationResultImplCopyWith<_$MutationResultImpl> get copyWith =>
      __$$MutationResultImplCopyWithImpl<_$MutationResultImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() generalLoading,
    required TResult Function(String error, String? errorMessage) generalError,
    required TResult Function(List<ItdNote> notes, bool hasMoreResults,
            Map<String, ProcessingNote> processingNotes)
        contentLoaded,
    required TResult Function(List<ItdNote> notes, bool hasMoreResults,
            Map<String, ProcessingNote> processingNotes)
        loadingNextPage,
    required TResult Function(List<ItdNote> notes, bool hasMoreResults,
            Map<String, ProcessingNote> processingNotes)
        processingMutation,
    required TResult Function(List<ItdNote> notes, bool hasMoreResults,
            Map<String, ProcessingNote> processingNotes, ProcessingNote result)
        mutationResult,
  }) {
    return mutationResult(notes, hasMoreResults, processingNotes, result);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? generalLoading,
    TResult? Function(String error, String? errorMessage)? generalError,
    TResult? Function(List<ItdNote> notes, bool hasMoreResults,
            Map<String, ProcessingNote> processingNotes)?
        contentLoaded,
    TResult? Function(List<ItdNote> notes, bool hasMoreResults,
            Map<String, ProcessingNote> processingNotes)?
        loadingNextPage,
    TResult? Function(List<ItdNote> notes, bool hasMoreResults,
            Map<String, ProcessingNote> processingNotes)?
        processingMutation,
    TResult? Function(List<ItdNote> notes, bool hasMoreResults,
            Map<String, ProcessingNote> processingNotes, ProcessingNote result)?
        mutationResult,
  }) {
    return mutationResult?.call(notes, hasMoreResults, processingNotes, result);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? generalLoading,
    TResult Function(String error, String? errorMessage)? generalError,
    TResult Function(List<ItdNote> notes, bool hasMoreResults,
            Map<String, ProcessingNote> processingNotes)?
        contentLoaded,
    TResult Function(List<ItdNote> notes, bool hasMoreResults,
            Map<String, ProcessingNote> processingNotes)?
        loadingNextPage,
    TResult Function(List<ItdNote> notes, bool hasMoreResults,
            Map<String, ProcessingNote> processingNotes)?
        processingMutation,
    TResult Function(List<ItdNote> notes, bool hasMoreResults,
            Map<String, ProcessingNote> processingNotes, ProcessingNote result)?
        mutationResult,
    required TResult orElse(),
  }) {
    if (mutationResult != null) {
      return mutationResult(notes, hasMoreResults, processingNotes, result);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_GeneralLoading value) generalLoading,
    required TResult Function(_GeneralError value) generalError,
    required TResult Function(_ContentLoaded value) contentLoaded,
    required TResult Function(_LoadingNextPage value) loadingNextPage,
    required TResult Function(_LoadingMutation value) processingMutation,
    required TResult Function(_MutationResult value) mutationResult,
  }) {
    return mutationResult(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_GeneralLoading value)? generalLoading,
    TResult? Function(_GeneralError value)? generalError,
    TResult? Function(_ContentLoaded value)? contentLoaded,
    TResult? Function(_LoadingNextPage value)? loadingNextPage,
    TResult? Function(_LoadingMutation value)? processingMutation,
    TResult? Function(_MutationResult value)? mutationResult,
  }) {
    return mutationResult?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_GeneralLoading value)? generalLoading,
    TResult Function(_GeneralError value)? generalError,
    TResult Function(_ContentLoaded value)? contentLoaded,
    TResult Function(_LoadingNextPage value)? loadingNextPage,
    TResult Function(_LoadingMutation value)? processingMutation,
    TResult Function(_MutationResult value)? mutationResult,
    required TResult orElse(),
  }) {
    if (mutationResult != null) {
      return mutationResult(this);
    }
    return orElse();
  }
}

abstract class _MutationResult extends ItdState
    implements ItdContentStateInterface {
  const factory _MutationResult(
      {required final List<ItdNote> notes,
      required final bool hasMoreResults,
      required final Map<String, ProcessingNote> processingNotes,
      required final ProcessingNote result}) = _$MutationResultImpl;
  const _MutationResult._() : super._();

  List<ItdNote> get notes;
  bool get hasMoreResults;
  Map<String, ProcessingNote> get processingNotes;
  ProcessingNote get result;

  /// Create a copy of ItdState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MutationResultImplCopyWith<_$MutationResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
