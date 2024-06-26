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
  List<RentalContractDto> get leaseContracts =>
      throw _privateConstructorUsedError;
  int get rentalFilter => throw _privateConstructorUsedError;
  int get leaseFilter => throw _privateConstructorUsedError;
  bool get wait => throw _privateConstructorUsedError;
  Status get status => throw _privateConstructorUsedError;

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
  $Res call(
      {List<RentalContractDto> rentalContracts,
      List<RentalContractDto> leaseContracts,
      int rentalFilter,
      int leaseFilter,
      bool wait,
      Status status});
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
    Object? leaseContracts = null,
    Object? rentalFilter = null,
    Object? leaseFilter = null,
    Object? wait = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      rentalContracts: null == rentalContracts
          ? _value.rentalContracts
          : rentalContracts // ignore: cast_nullable_to_non_nullable
              as List<RentalContractDto>,
      leaseContracts: null == leaseContracts
          ? _value.leaseContracts
          : leaseContracts // ignore: cast_nullable_to_non_nullable
              as List<RentalContractDto>,
      rentalFilter: null == rentalFilter
          ? _value.rentalFilter
          : rentalFilter // ignore: cast_nullable_to_non_nullable
              as int,
      leaseFilter: null == leaseFilter
          ? _value.leaseFilter
          : leaseFilter // ignore: cast_nullable_to_non_nullable
              as int,
      wait: null == wait
          ? _value.wait
          : wait // ignore: cast_nullable_to_non_nullable
              as bool,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
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
  $Res call(
      {List<RentalContractDto> rentalContracts,
      List<RentalContractDto> leaseContracts,
      int rentalFilter,
      int leaseFilter,
      bool wait,
      Status status});
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
    Object? leaseContracts = null,
    Object? rentalFilter = null,
    Object? leaseFilter = null,
    Object? wait = null,
    Object? status = null,
  }) {
    return _then(_$ContractStateImpl(
      rentalContracts: null == rentalContracts
          ? _value._rentalContracts
          : rentalContracts // ignore: cast_nullable_to_non_nullable
              as List<RentalContractDto>,
      leaseContracts: null == leaseContracts
          ? _value._leaseContracts
          : leaseContracts // ignore: cast_nullable_to_non_nullable
              as List<RentalContractDto>,
      rentalFilter: null == rentalFilter
          ? _value.rentalFilter
          : rentalFilter // ignore: cast_nullable_to_non_nullable
              as int,
      leaseFilter: null == leaseFilter
          ? _value.leaseFilter
          : leaseFilter // ignore: cast_nullable_to_non_nullable
              as int,
      wait: null == wait
          ? _value.wait
          : wait // ignore: cast_nullable_to_non_nullable
              as bool,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
    ));
  }
}

/// @nodoc

class _$ContractStateImpl implements _ContractState {
  const _$ContractStateImpl(
      {final List<RentalContractDto> rentalContracts = const [],
      final List<RentalContractDto> leaseContracts = const [],
      this.rentalFilter = -1,
      this.leaseFilter = -1,
      this.wait = false,
      this.status = Status.loading})
      : _rentalContracts = rentalContracts,
        _leaseContracts = leaseContracts;

  final List<RentalContractDto> _rentalContracts;
  @override
  @JsonKey()
  List<RentalContractDto> get rentalContracts {
    if (_rentalContracts is EqualUnmodifiableListView) return _rentalContracts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rentalContracts);
  }

  final List<RentalContractDto> _leaseContracts;
  @override
  @JsonKey()
  List<RentalContractDto> get leaseContracts {
    if (_leaseContracts is EqualUnmodifiableListView) return _leaseContracts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_leaseContracts);
  }

  @override
  @JsonKey()
  final int rentalFilter;
  @override
  @JsonKey()
  final int leaseFilter;
  @override
  @JsonKey()
  final bool wait;
  @override
  @JsonKey()
  final Status status;

  @override
  String toString() {
    return 'ContractState(rentalContracts: $rentalContracts, leaseContracts: $leaseContracts, rentalFilter: $rentalFilter, leaseFilter: $leaseFilter, wait: $wait, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContractStateImpl &&
            const DeepCollectionEquality()
                .equals(other._rentalContracts, _rentalContracts) &&
            const DeepCollectionEquality()
                .equals(other._leaseContracts, _leaseContracts) &&
            (identical(other.rentalFilter, rentalFilter) ||
                other.rentalFilter == rentalFilter) &&
            (identical(other.leaseFilter, leaseFilter) ||
                other.leaseFilter == leaseFilter) &&
            (identical(other.wait, wait) || other.wait == wait) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_rentalContracts),
      const DeepCollectionEquality().hash(_leaseContracts),
      rentalFilter,
      leaseFilter,
      wait,
      status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ContractStateImplCopyWith<_$ContractStateImpl> get copyWith =>
      __$$ContractStateImplCopyWithImpl<_$ContractStateImpl>(this, _$identity);
}

abstract class _ContractState implements ContractState {
  const factory _ContractState(
      {final List<RentalContractDto> rentalContracts,
      final List<RentalContractDto> leaseContracts,
      final int rentalFilter,
      final int leaseFilter,
      final bool wait,
      final Status status}) = _$ContractStateImpl;

  @override
  List<RentalContractDto> get rentalContracts;
  @override
  List<RentalContractDto> get leaseContracts;
  @override
  int get rentalFilter;
  @override
  int get leaseFilter;
  @override
  bool get wait;
  @override
  Status get status;
  @override
  @JsonKey(ignore: true)
  _$$ContractStateImplCopyWith<_$ContractStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
