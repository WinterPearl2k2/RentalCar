// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'date_time_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DateTimeDto {
  String get startDate => throw _privateConstructorUsedError;
  String get endDate => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DateTimeDtoCopyWith<DateTimeDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DateTimeDtoCopyWith<$Res> {
  factory $DateTimeDtoCopyWith(
          DateTimeDto value, $Res Function(DateTimeDto) then) =
      _$DateTimeDtoCopyWithImpl<$Res, DateTimeDto>;
  @useResult
  $Res call({String startDate, String endDate});
}

/// @nodoc
class _$DateTimeDtoCopyWithImpl<$Res, $Val extends DateTimeDto>
    implements $DateTimeDtoCopyWith<$Res> {
  _$DateTimeDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startDate = null,
    Object? endDate = null,
  }) {
    return _then(_value.copyWith(
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DateTimeDtoImplCopyWith<$Res>
    implements $DateTimeDtoCopyWith<$Res> {
  factory _$$DateTimeDtoImplCopyWith(
          _$DateTimeDtoImpl value, $Res Function(_$DateTimeDtoImpl) then) =
      __$$DateTimeDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String startDate, String endDate});
}

/// @nodoc
class __$$DateTimeDtoImplCopyWithImpl<$Res>
    extends _$DateTimeDtoCopyWithImpl<$Res, _$DateTimeDtoImpl>
    implements _$$DateTimeDtoImplCopyWith<$Res> {
  __$$DateTimeDtoImplCopyWithImpl(
      _$DateTimeDtoImpl _value, $Res Function(_$DateTimeDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startDate = null,
    Object? endDate = null,
  }) {
    return _then(_$DateTimeDtoImpl(
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DateTimeDtoImpl implements _DateTimeDto {
  const _$DateTimeDtoImpl({this.startDate = '', this.endDate = ''});

  @override
  @JsonKey()
  final String startDate;
  @override
  @JsonKey()
  final String endDate;

  @override
  String toString() {
    return 'DateTimeDto(startDate: $startDate, endDate: $endDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DateTimeDtoImpl &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, startDate, endDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DateTimeDtoImplCopyWith<_$DateTimeDtoImpl> get copyWith =>
      __$$DateTimeDtoImplCopyWithImpl<_$DateTimeDtoImpl>(this, _$identity);
}

abstract class _DateTimeDto implements DateTimeDto {
  const factory _DateTimeDto({final String startDate, final String endDate}) =
      _$DateTimeDtoImpl;

  @override
  String get startDate;
  @override
  String get endDate;
  @override
  @JsonKey(ignore: true)
  _$$DateTimeDtoImplCopyWith<_$DateTimeDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
