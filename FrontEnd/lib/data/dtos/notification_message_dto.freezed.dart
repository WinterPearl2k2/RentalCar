// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_message_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NotificationMessageDto _$NotificationMessageDtoFromJson(
    Map<String, dynamic> json) {
  return _NotificationMessageDto.fromJson(json);
}

/// @nodoc
mixin _$NotificationMessageDto {
  String get typeMessage => throw _privateConstructorUsedError;
  String get carId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotificationMessageDtoCopyWith<NotificationMessageDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationMessageDtoCopyWith<$Res> {
  factory $NotificationMessageDtoCopyWith(NotificationMessageDto value,
          $Res Function(NotificationMessageDto) then) =
      _$NotificationMessageDtoCopyWithImpl<$Res, NotificationMessageDto>;
  @useResult
  $Res call({String typeMessage, String carId});
}

/// @nodoc
class _$NotificationMessageDtoCopyWithImpl<$Res,
        $Val extends NotificationMessageDto>
    implements $NotificationMessageDtoCopyWith<$Res> {
  _$NotificationMessageDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? typeMessage = null,
    Object? carId = null,
  }) {
    return _then(_value.copyWith(
      typeMessage: null == typeMessage
          ? _value.typeMessage
          : typeMessage // ignore: cast_nullable_to_non_nullable
              as String,
      carId: null == carId
          ? _value.carId
          : carId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NotificationMessageDtoImplCopyWith<$Res>
    implements $NotificationMessageDtoCopyWith<$Res> {
  factory _$$NotificationMessageDtoImplCopyWith(
          _$NotificationMessageDtoImpl value,
          $Res Function(_$NotificationMessageDtoImpl) then) =
      __$$NotificationMessageDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String typeMessage, String carId});
}

/// @nodoc
class __$$NotificationMessageDtoImplCopyWithImpl<$Res>
    extends _$NotificationMessageDtoCopyWithImpl<$Res,
        _$NotificationMessageDtoImpl>
    implements _$$NotificationMessageDtoImplCopyWith<$Res> {
  __$$NotificationMessageDtoImplCopyWithImpl(
      _$NotificationMessageDtoImpl _value,
      $Res Function(_$NotificationMessageDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? typeMessage = null,
    Object? carId = null,
  }) {
    return _then(_$NotificationMessageDtoImpl(
      typeMessage: null == typeMessage
          ? _value.typeMessage
          : typeMessage // ignore: cast_nullable_to_non_nullable
              as String,
      carId: null == carId
          ? _value.carId
          : carId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NotificationMessageDtoImpl implements _NotificationMessageDto {
  const _$NotificationMessageDtoImpl({this.typeMessage = '', this.carId = ''});

  factory _$NotificationMessageDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationMessageDtoImplFromJson(json);

  @override
  @JsonKey()
  final String typeMessage;
  @override
  @JsonKey()
  final String carId;

  @override
  String toString() {
    return 'NotificationMessageDto(typeMessage: $typeMessage, carId: $carId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationMessageDtoImpl &&
            (identical(other.typeMessage, typeMessage) ||
                other.typeMessage == typeMessage) &&
            (identical(other.carId, carId) || other.carId == carId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, typeMessage, carId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationMessageDtoImplCopyWith<_$NotificationMessageDtoImpl>
      get copyWith => __$$NotificationMessageDtoImplCopyWithImpl<
          _$NotificationMessageDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationMessageDtoImplToJson(
      this,
    );
  }
}

abstract class _NotificationMessageDto implements NotificationMessageDto {
  const factory _NotificationMessageDto(
      {final String typeMessage,
      final String carId}) = _$NotificationMessageDtoImpl;

  factory _NotificationMessageDto.fromJson(Map<String, dynamic> json) =
      _$NotificationMessageDtoImpl.fromJson;

  @override
  String get typeMessage;
  @override
  String get carId;
  @override
  @JsonKey(ignore: true)
  _$$NotificationMessageDtoImplCopyWith<_$NotificationMessageDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
