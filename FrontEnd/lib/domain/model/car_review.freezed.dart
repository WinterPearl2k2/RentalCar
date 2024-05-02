// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'car_review.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CarReview _$CarReviewFromJson(Map<String, dynamic> json) {
  return _CarReview.fromJson(json);
}

/// @nodoc
mixin _$CarReview {
  String get idReview => throw _privateConstructorUsedError;
  int get rateReview => throw _privateConstructorUsedError;
  String get commentReview => throw _privateConstructorUsedError;
  String get createAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CarReviewCopyWith<CarReview> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CarReviewCopyWith<$Res> {
  factory $CarReviewCopyWith(CarReview value, $Res Function(CarReview) then) =
      _$CarReviewCopyWithImpl<$Res, CarReview>;
  @useResult
  $Res call(
      {String idReview, int rateReview, String commentReview, String createAt});
}

/// @nodoc
class _$CarReviewCopyWithImpl<$Res, $Val extends CarReview>
    implements $CarReviewCopyWith<$Res> {
  _$CarReviewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idReview = null,
    Object? rateReview = null,
    Object? commentReview = null,
    Object? createAt = null,
  }) {
    return _then(_value.copyWith(
      idReview: null == idReview
          ? _value.idReview
          : idReview // ignore: cast_nullable_to_non_nullable
              as String,
      rateReview: null == rateReview
          ? _value.rateReview
          : rateReview // ignore: cast_nullable_to_non_nullable
              as int,
      commentReview: null == commentReview
          ? _value.commentReview
          : commentReview // ignore: cast_nullable_to_non_nullable
              as String,
      createAt: null == createAt
          ? _value.createAt
          : createAt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CarReviewImplCopyWith<$Res>
    implements $CarReviewCopyWith<$Res> {
  factory _$$CarReviewImplCopyWith(
          _$CarReviewImpl value, $Res Function(_$CarReviewImpl) then) =
      __$$CarReviewImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String idReview, int rateReview, String commentReview, String createAt});
}

/// @nodoc
class __$$CarReviewImplCopyWithImpl<$Res>
    extends _$CarReviewCopyWithImpl<$Res, _$CarReviewImpl>
    implements _$$CarReviewImplCopyWith<$Res> {
  __$$CarReviewImplCopyWithImpl(
      _$CarReviewImpl _value, $Res Function(_$CarReviewImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idReview = null,
    Object? rateReview = null,
    Object? commentReview = null,
    Object? createAt = null,
  }) {
    return _then(_$CarReviewImpl(
      idReview: null == idReview
          ? _value.idReview
          : idReview // ignore: cast_nullable_to_non_nullable
              as String,
      rateReview: null == rateReview
          ? _value.rateReview
          : rateReview // ignore: cast_nullable_to_non_nullable
              as int,
      commentReview: null == commentReview
          ? _value.commentReview
          : commentReview // ignore: cast_nullable_to_non_nullable
              as String,
      createAt: null == createAt
          ? _value.createAt
          : createAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CarReviewImpl implements _CarReview {
  const _$CarReviewImpl(
      {this.idReview = '',
      this.rateReview = 0,
      this.commentReview = '',
      this.createAt = ''});

  factory _$CarReviewImpl.fromJson(Map<String, dynamic> json) =>
      _$$CarReviewImplFromJson(json);

  @override
  @JsonKey()
  final String idReview;
  @override
  @JsonKey()
  final int rateReview;
  @override
  @JsonKey()
  final String commentReview;
  @override
  @JsonKey()
  final String createAt;

  @override
  String toString() {
    return 'CarReview(idReview: $idReview, rateReview: $rateReview, commentReview: $commentReview, createAt: $createAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CarReviewImpl &&
            (identical(other.idReview, idReview) ||
                other.idReview == idReview) &&
            (identical(other.rateReview, rateReview) ||
                other.rateReview == rateReview) &&
            (identical(other.commentReview, commentReview) ||
                other.commentReview == commentReview) &&
            (identical(other.createAt, createAt) ||
                other.createAt == createAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, idReview, rateReview, commentReview, createAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CarReviewImplCopyWith<_$CarReviewImpl> get copyWith =>
      __$$CarReviewImplCopyWithImpl<_$CarReviewImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CarReviewImplToJson(
      this,
    );
  }
}

abstract class _CarReview implements CarReview {
  const factory _CarReview(
      {final String idReview,
      final int rateReview,
      final String commentReview,
      final String createAt}) = _$CarReviewImpl;

  factory _CarReview.fromJson(Map<String, dynamic> json) =
      _$CarReviewImpl.fromJson;

  @override
  String get idReview;
  @override
  int get rateReview;
  @override
  String get commentReview;
  @override
  String get createAt;
  @override
  @JsonKey(ignore: true)
  _$$CarReviewImplCopyWith<_$CarReviewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
