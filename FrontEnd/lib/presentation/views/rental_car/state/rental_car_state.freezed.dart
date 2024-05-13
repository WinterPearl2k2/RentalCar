// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rental_car_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RentalCarState {
  dynamic get loading => throw _privateConstructorUsedError;
  UserProfileDTO get user => throw _privateConstructorUsedError;
  CarDetailDTO get car => throw _privateConstructorUsedError;
  List<DateTimeDto> get dates => throw _privateConstructorUsedError;
  String get startDate => throw _privateConstructorUsedError;
  String get endDate => throw _privateConstructorUsedError;
  int get numberDays => throw _privateConstructorUsedError;
  double get total => throw _privateConstructorUsedError;
  bool get isSelectRental => throw _privateConstructorUsedError;
  RentalCarStatus get statusView => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RentalCarStateCopyWith<RentalCarState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RentalCarStateCopyWith<$Res> {
  factory $RentalCarStateCopyWith(
          RentalCarState value, $Res Function(RentalCarState) then) =
      _$RentalCarStateCopyWithImpl<$Res, RentalCarState>;
  @useResult
  $Res call(
      {dynamic loading,
      UserProfileDTO user,
      CarDetailDTO car,
      List<DateTimeDto> dates,
      String startDate,
      String endDate,
      int numberDays,
      double total,
      bool isSelectRental,
      RentalCarStatus statusView});

  $UserProfileDTOCopyWith<$Res> get user;
  $CarDetailDTOCopyWith<$Res> get car;
}

/// @nodoc
class _$RentalCarStateCopyWithImpl<$Res, $Val extends RentalCarState>
    implements $RentalCarStateCopyWith<$Res> {
  _$RentalCarStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = freezed,
    Object? user = null,
    Object? car = null,
    Object? dates = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? numberDays = null,
    Object? total = null,
    Object? isSelectRental = null,
    Object? statusView = null,
  }) {
    return _then(_value.copyWith(
      loading: freezed == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as dynamic,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserProfileDTO,
      car: null == car
          ? _value.car
          : car // ignore: cast_nullable_to_non_nullable
              as CarDetailDTO,
      dates: null == dates
          ? _value.dates
          : dates // ignore: cast_nullable_to_non_nullable
              as List<DateTimeDto>,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String,
      numberDays: null == numberDays
          ? _value.numberDays
          : numberDays // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      isSelectRental: null == isSelectRental
          ? _value.isSelectRental
          : isSelectRental // ignore: cast_nullable_to_non_nullable
              as bool,
      statusView: null == statusView
          ? _value.statusView
          : statusView // ignore: cast_nullable_to_non_nullable
              as RentalCarStatus,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserProfileDTOCopyWith<$Res> get user {
    return $UserProfileDTOCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CarDetailDTOCopyWith<$Res> get car {
    return $CarDetailDTOCopyWith<$Res>(_value.car, (value) {
      return _then(_value.copyWith(car: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RentalCarStateImplCopyWith<$Res>
    implements $RentalCarStateCopyWith<$Res> {
  factory _$$RentalCarStateImplCopyWith(_$RentalCarStateImpl value,
          $Res Function(_$RentalCarStateImpl) then) =
      __$$RentalCarStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {dynamic loading,
      UserProfileDTO user,
      CarDetailDTO car,
      List<DateTimeDto> dates,
      String startDate,
      String endDate,
      int numberDays,
      double total,
      bool isSelectRental,
      RentalCarStatus statusView});

  @override
  $UserProfileDTOCopyWith<$Res> get user;
  @override
  $CarDetailDTOCopyWith<$Res> get car;
}

/// @nodoc
class __$$RentalCarStateImplCopyWithImpl<$Res>
    extends _$RentalCarStateCopyWithImpl<$Res, _$RentalCarStateImpl>
    implements _$$RentalCarStateImplCopyWith<$Res> {
  __$$RentalCarStateImplCopyWithImpl(
      _$RentalCarStateImpl _value, $Res Function(_$RentalCarStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = freezed,
    Object? user = null,
    Object? car = null,
    Object? dates = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? numberDays = null,
    Object? total = null,
    Object? isSelectRental = null,
    Object? statusView = null,
  }) {
    return _then(_$RentalCarStateImpl(
      loading: freezed == loading ? _value.loading! : loading,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserProfileDTO,
      car: null == car
          ? _value.car
          : car // ignore: cast_nullable_to_non_nullable
              as CarDetailDTO,
      dates: null == dates
          ? _value._dates
          : dates // ignore: cast_nullable_to_non_nullable
              as List<DateTimeDto>,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String,
      numberDays: null == numberDays
          ? _value.numberDays
          : numberDays // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      isSelectRental: null == isSelectRental
          ? _value.isSelectRental
          : isSelectRental // ignore: cast_nullable_to_non_nullable
              as bool,
      statusView: null == statusView
          ? _value.statusView
          : statusView // ignore: cast_nullable_to_non_nullable
              as RentalCarStatus,
    ));
  }
}

/// @nodoc

class _$RentalCarStateImpl implements _RentalCarState {
  const _$RentalCarStateImpl(
      {this.loading = false,
      this.user = const UserProfileDTO(),
      this.car = const CarDetailDTO(),
      final List<DateTimeDto> dates = const [],
      this.startDate = '',
      this.endDate = '',
      this.numberDays = 0,
      this.total = 0,
      this.isSelectRental = false,
      this.statusView = RentalCarStatus.rentalCar})
      : _dates = dates;

  @override
  @JsonKey()
  final dynamic loading;
  @override
  @JsonKey()
  final UserProfileDTO user;
  @override
  @JsonKey()
  final CarDetailDTO car;
  final List<DateTimeDto> _dates;
  @override
  @JsonKey()
  List<DateTimeDto> get dates {
    if (_dates is EqualUnmodifiableListView) return _dates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dates);
  }

  @override
  @JsonKey()
  final String startDate;
  @override
  @JsonKey()
  final String endDate;
  @override
  @JsonKey()
  final int numberDays;
  @override
  @JsonKey()
  final double total;
  @override
  @JsonKey()
  final bool isSelectRental;
  @override
  @JsonKey()
  final RentalCarStatus statusView;

  @override
  String toString() {
    return 'RentalCarState(loading: $loading, user: $user, car: $car, dates: $dates, startDate: $startDate, endDate: $endDate, numberDays: $numberDays, total: $total, isSelectRental: $isSelectRental, statusView: $statusView)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RentalCarStateImpl &&
            const DeepCollectionEquality().equals(other.loading, loading) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.car, car) || other.car == car) &&
            const DeepCollectionEquality().equals(other._dates, _dates) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.numberDays, numberDays) ||
                other.numberDays == numberDays) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.isSelectRental, isSelectRental) ||
                other.isSelectRental == isSelectRental) &&
            (identical(other.statusView, statusView) ||
                other.statusView == statusView));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(loading),
      user,
      car,
      const DeepCollectionEquality().hash(_dates),
      startDate,
      endDate,
      numberDays,
      total,
      isSelectRental,
      statusView);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RentalCarStateImplCopyWith<_$RentalCarStateImpl> get copyWith =>
      __$$RentalCarStateImplCopyWithImpl<_$RentalCarStateImpl>(
          this, _$identity);
}

abstract class _RentalCarState implements RentalCarState {
  const factory _RentalCarState(
      {final dynamic loading,
      final UserProfileDTO user,
      final CarDetailDTO car,
      final List<DateTimeDto> dates,
      final String startDate,
      final String endDate,
      final int numberDays,
      final double total,
      final bool isSelectRental,
      final RentalCarStatus statusView}) = _$RentalCarStateImpl;

  @override
  dynamic get loading;
  @override
  UserProfileDTO get user;
  @override
  CarDetailDTO get car;
  @override
  List<DateTimeDto> get dates;
  @override
  String get startDate;
  @override
  String get endDate;
  @override
  int get numberDays;
  @override
  double get total;
  @override
  bool get isSelectRental;
  @override
  RentalCarStatus get statusView;
  @override
  @JsonKey(ignore: true)
  _$$RentalCarStateImplCopyWith<_$RentalCarStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
