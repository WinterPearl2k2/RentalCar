// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contract_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ContractState {
  List<RentalContractDto> get rentalContracts =>
      throw _privateConstructorUsedError;
  bool get wait => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ContractStateCopyWith<ContractState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContractStateCopyWith<$Res> {
  factory $ContractStateCopyWith(
          ContractState value, $Res Function(ContractState) then) =
      _$ContractStateCopyWithImpl<$Res, ContractState>;
  @useResult
  $Res call({List<RentalContractDto> rentalContracts, bool wait});
}

/// @nodoc
class _$ContractStateCopyWithImpl<$Res, $Val extends ContractState>
    implements $ContractStateCopyWith<$Res> {
  _$ContractStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rentalContracts = null,
    Object? wait = null,
  }) {
    return _then(_value.copyWith(
      rentalContracts: null == rentalContracts
          ? _value.rentalContracts
          : rentalContracts // ignore: cast_nullable_to_non_nullable
              as List<RentalContractDto>,
      wait: null == wait
          ? _value.wait
          : wait // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ContractStateImplCopyWith<$Res>
    implements $ContractStateCopyWith<$Res> {
  factory _$$ContractStateImplCopyWith(
          _$ContractStateImpl value, $Res Function(_$ContractStateImpl) then) =
      __$$ContractStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<RentalContractDto> rentalContracts, bool wait});
}

/// @nodoc
class __$$ContractStateImplCopyWithImpl<$Res>
    extends _$ContractStateCopyWithImpl<$Res, _$ContractStateImpl>
    implements _$$ContractStateImplCopyWith<$Res> {
  __$$ContractStateImplCopyWithImpl(
      _$ContractStateImpl _value, $Res Function(_$ContractStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rentalContracts = null,
    Object? wait = null,
  }) {
    return _then(_$ContractStateImpl(
      rentalContracts: null == rentalContracts
          ? _value._rentalContracts
          : rentalContracts // ignore: cast_nullable_to_non_nullable
              as List<RentalContractDto>,
      wait: null == wait
          ? _value.wait
          : wait // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ContractStateImpl implements _ContractState {
  const _$ContractStateImpl(
      {final List<RentalContractDto> rentalContracts = const [],
      this.wait = false})
      : _rentalContracts = rentalContracts;

  final List<RentalContractDto> _rentalContracts;
  @override
  @JsonKey()
  List<RentalContractDto> get rentalContracts {
    if (_rentalContracts is EqualUnmodifiableListView) return _rentalContracts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rentalContracts);
  }

  @override
  @JsonKey()
  final bool wait;

  @override
  String toString() {
    return 'ContractState(rentalContracts: $rentalContracts, wait: $wait)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContractStateImpl &&
            const DeepCollectionEquality()
                .equals(other._rentalContracts, _rentalContracts) &&
            (identical(other.wait, wait) || other.wait == wait));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_rentalContracts), wait);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ContractStateImplCopyWith<_$ContractStateImpl> get copyWith =>
      __$$ContractStateImplCopyWithImpl<_$ContractStateImpl>(this, _$identity);
}

abstract class _ContractState implements ContractState {
  const factory _ContractState(
      {final List<RentalContractDto> rentalContracts,
      final bool wait}) = _$ContractStateImpl;

  @override
  List<RentalContractDto> get rentalContracts;
  @override
  bool get wait;
  @override
  @JsonKey(ignore: true)
  _$$ContractStateImplCopyWith<_$ContractStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
