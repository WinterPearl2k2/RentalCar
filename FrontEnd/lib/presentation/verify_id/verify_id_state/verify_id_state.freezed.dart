// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verify_id_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$VerifyIdState {
  String get imgFileFront => throw _privateConstructorUsedError;
  String get imgFileBack => throw _privateConstructorUsedError;
  List<dynamic> get dataFaceIdCard => throw _privateConstructorUsedError;
  VerifyStateView get stateView => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $VerifyIdStateCopyWith<VerifyIdState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerifyIdStateCopyWith<$Res> {
  factory $VerifyIdStateCopyWith(
          VerifyIdState value, $Res Function(VerifyIdState) then) =
      _$VerifyIdStateCopyWithImpl<$Res, VerifyIdState>;
  @useResult
  $Res call(
      {String imgFileFront,
      String imgFileBack,
      List<dynamic> dataFaceIdCard,
      VerifyStateView stateView});
}

/// @nodoc
class _$VerifyIdStateCopyWithImpl<$Res, $Val extends VerifyIdState>
    implements $VerifyIdStateCopyWith<$Res> {
  _$VerifyIdStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imgFileFront = null,
    Object? imgFileBack = null,
    Object? dataFaceIdCard = null,
    Object? stateView = null,
  }) {
    return _then(_value.copyWith(
      imgFileFront: null == imgFileFront
          ? _value.imgFileFront
          : imgFileFront // ignore: cast_nullable_to_non_nullable
              as String,
      imgFileBack: null == imgFileBack
          ? _value.imgFileBack
          : imgFileBack // ignore: cast_nullable_to_non_nullable
              as String,
      dataFaceIdCard: null == dataFaceIdCard
          ? _value.dataFaceIdCard
          : dataFaceIdCard // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      stateView: null == stateView
          ? _value.stateView
          : stateView // ignore: cast_nullable_to_non_nullable
              as VerifyStateView,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VerifyIdStateImplCopyWith<$Res>
    implements $VerifyIdStateCopyWith<$Res> {
  factory _$$VerifyIdStateImplCopyWith(
          _$VerifyIdStateImpl value, $Res Function(_$VerifyIdStateImpl) then) =
      __$$VerifyIdStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String imgFileFront,
      String imgFileBack,
      List<dynamic> dataFaceIdCard,
      VerifyStateView stateView});
}

/// @nodoc
class __$$VerifyIdStateImplCopyWithImpl<$Res>
    extends _$VerifyIdStateCopyWithImpl<$Res, _$VerifyIdStateImpl>
    implements _$$VerifyIdStateImplCopyWith<$Res> {
  __$$VerifyIdStateImplCopyWithImpl(
      _$VerifyIdStateImpl _value, $Res Function(_$VerifyIdStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imgFileFront = null,
    Object? imgFileBack = null,
    Object? dataFaceIdCard = null,
    Object? stateView = null,
  }) {
    return _then(_$VerifyIdStateImpl(
      imgFileFront: null == imgFileFront
          ? _value.imgFileFront
          : imgFileFront // ignore: cast_nullable_to_non_nullable
              as String,
      imgFileBack: null == imgFileBack
          ? _value.imgFileBack
          : imgFileBack // ignore: cast_nullable_to_non_nullable
              as String,
      dataFaceIdCard: null == dataFaceIdCard
          ? _value._dataFaceIdCard
          : dataFaceIdCard // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      stateView: null == stateView
          ? _value.stateView
          : stateView // ignore: cast_nullable_to_non_nullable
              as VerifyStateView,
    ));
  }
}

/// @nodoc

class _$VerifyIdStateImpl implements _VerifyIdState {
  const _$VerifyIdStateImpl(
      {this.imgFileFront = '',
      this.imgFileBack = '',
      final List<dynamic> dataFaceIdCard = const [],
      this.stateView = VerifyStateView.verifyId})
      : _dataFaceIdCard = dataFaceIdCard;

  @override
  @JsonKey()
  final String imgFileFront;
  @override
  @JsonKey()
  final String imgFileBack;
  final List<dynamic> _dataFaceIdCard;
  @override
  @JsonKey()
  List<dynamic> get dataFaceIdCard {
    if (_dataFaceIdCard is EqualUnmodifiableListView) return _dataFaceIdCard;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dataFaceIdCard);
  }

  @override
  @JsonKey()
  final VerifyStateView stateView;

  @override
  String toString() {
    return 'VerifyIdState(imgFileFront: $imgFileFront, imgFileBack: $imgFileBack, dataFaceIdCard: $dataFaceIdCard, stateView: $stateView)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifyIdStateImpl &&
            (identical(other.imgFileFront, imgFileFront) ||
                other.imgFileFront == imgFileFront) &&
            (identical(other.imgFileBack, imgFileBack) ||
                other.imgFileBack == imgFileBack) &&
            const DeepCollectionEquality()
                .equals(other._dataFaceIdCard, _dataFaceIdCard) &&
            (identical(other.stateView, stateView) ||
                other.stateView == stateView));
  }

  @override
  int get hashCode => Object.hash(runtimeType, imgFileFront, imgFileBack,
      const DeepCollectionEquality().hash(_dataFaceIdCard), stateView);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifyIdStateImplCopyWith<_$VerifyIdStateImpl> get copyWith =>
      __$$VerifyIdStateImplCopyWithImpl<_$VerifyIdStateImpl>(this, _$identity);
}

abstract class _VerifyIdState implements VerifyIdState {
  const factory _VerifyIdState(
      {final String imgFileFront,
      final String imgFileBack,
      final List<dynamic> dataFaceIdCard,
      final VerifyStateView stateView}) = _$VerifyIdStateImpl;

  @override
  String get imgFileFront;
  @override
  String get imgFileBack;
  @override
  List<dynamic> get dataFaceIdCard;
  @override
  VerifyStateView get stateView;
  @override
  @JsonKey(ignore: true)
  _$$VerifyIdStateImplCopyWith<_$VerifyIdStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
