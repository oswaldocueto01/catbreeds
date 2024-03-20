// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cats_home_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CatState {
  /// Utilizamos [pageState] para conocer el estado de la página durante la ejecución del método.
  ///
  /// Puede tener valores como "cargando", "error" o "null" para indicar que no está cargando.
  AsyncValue<void> get pageState => throw _privateConstructorUsedError;
  List<CatEntity> get cats => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CatStateCopyWith<CatState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CatStateCopyWith<$Res> {
  factory $CatStateCopyWith(CatState value, $Res Function(CatState) then) =
      _$CatStateCopyWithImpl<$Res, CatState>;
  @useResult
  $Res call({AsyncValue<void> pageState, List<CatEntity> cats});
}

/// @nodoc
class _$CatStateCopyWithImpl<$Res, $Val extends CatState>
    implements $CatStateCopyWith<$Res> {
  _$CatStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageState = null,
    Object? cats = null,
  }) {
    return _then(_value.copyWith(
      pageState: null == pageState
          ? _value.pageState
          : pageState // ignore: cast_nullable_to_non_nullable
              as AsyncValue<void>,
      cats: null == cats
          ? _value.cats
          : cats // ignore: cast_nullable_to_non_nullable
              as List<CatEntity>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CatStateImplCopyWith<$Res>
    implements $CatStateCopyWith<$Res> {
  factory _$$CatStateImplCopyWith(
          _$CatStateImpl value, $Res Function(_$CatStateImpl) then) =
      __$$CatStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AsyncValue<void> pageState, List<CatEntity> cats});
}

/// @nodoc
class __$$CatStateImplCopyWithImpl<$Res>
    extends _$CatStateCopyWithImpl<$Res, _$CatStateImpl>
    implements _$$CatStateImplCopyWith<$Res> {
  __$$CatStateImplCopyWithImpl(
      _$CatStateImpl _value, $Res Function(_$CatStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageState = null,
    Object? cats = null,
  }) {
    return _then(_$CatStateImpl(
      pageState: null == pageState
          ? _value.pageState
          : pageState // ignore: cast_nullable_to_non_nullable
              as AsyncValue<void>,
      cats: null == cats
          ? _value._cats
          : cats // ignore: cast_nullable_to_non_nullable
              as List<CatEntity>,
    ));
  }
}

/// @nodoc

class _$CatStateImpl implements _CatState {
  const _$CatStateImpl(
      {this.pageState = const AsyncData<void>(null),
      final List<CatEntity> cats = const []})
      : _cats = cats;

  /// Utilizamos [pageState] para conocer el estado de la página durante la ejecución del método.
  ///
  /// Puede tener valores como "cargando", "error" o "null" para indicar que no está cargando.
  @override
  @JsonKey()
  final AsyncValue<void> pageState;
  final List<CatEntity> _cats;
  @override
  @JsonKey()
  List<CatEntity> get cats {
    if (_cats is EqualUnmodifiableListView) return _cats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cats);
  }

  @override
  String toString() {
    return 'CatState(pageState: $pageState, cats: $cats)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CatStateImpl &&
            (identical(other.pageState, pageState) ||
                other.pageState == pageState) &&
            const DeepCollectionEquality().equals(other._cats, _cats));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, pageState, const DeepCollectionEquality().hash(_cats));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CatStateImplCopyWith<_$CatStateImpl> get copyWith =>
      __$$CatStateImplCopyWithImpl<_$CatStateImpl>(this, _$identity);
}

abstract class _CatState implements CatState {
  const factory _CatState(
      {final AsyncValue<void> pageState,
      final List<CatEntity> cats}) = _$CatStateImpl;

  @override

  /// Utilizamos [pageState] para conocer el estado de la página durante la ejecución del método.
  ///
  /// Puede tener valores como "cargando", "error" o "null" para indicar que no está cargando.
  AsyncValue<void> get pageState;
  @override
  List<CatEntity> get cats;
  @override
  @JsonKey(ignore: true)
  _$$CatStateImplCopyWith<_$CatStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
