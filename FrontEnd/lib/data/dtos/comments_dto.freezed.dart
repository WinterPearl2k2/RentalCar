// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comments_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CommentsDTO _$CommentsDTOFromJson(Map<String, dynamic> json) {
  return _CommentsDTO.fromJson(json);
}

/// @nodoc
mixin _$CommentsDTO {
  String get comment => throw _privateConstructorUsedError;
  String get commenter => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommentsDTOCopyWith<CommentsDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentsDTOCopyWith<$Res> {
  factory $CommentsDTOCopyWith(
          CommentsDTO value, $Res Function(CommentsDTO) then) =
      _$CommentsDTOCopyWithImpl<$Res, CommentsDTO>;
  @useResult
  $Res call({String comment, String commenter, DateTime createdAt});
}

/// @nodoc
class _$CommentsDTOCopyWithImpl<$Res, $Val extends CommentsDTO>
    implements $CommentsDTOCopyWith<$Res> {
  _$CommentsDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? comment = null,
    Object? commenter = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      commenter: null == commenter
          ? _value.commenter
          : commenter // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CommentsDTOImplCopyWith<$Res>
    implements $CommentsDTOCopyWith<$Res> {
  factory _$$CommentsDTOImplCopyWith(
          _$CommentsDTOImpl value, $Res Function(_$CommentsDTOImpl) then) =
      __$$CommentsDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String comment, String commenter, DateTime createdAt});
}

/// @nodoc
class __$$CommentsDTOImplCopyWithImpl<$Res>
    extends _$CommentsDTOCopyWithImpl<$Res, _$CommentsDTOImpl>
    implements _$$CommentsDTOImplCopyWith<$Res> {
  __$$CommentsDTOImplCopyWithImpl(
      _$CommentsDTOImpl _value, $Res Function(_$CommentsDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? comment = null,
    Object? commenter = null,
    Object? createdAt = null,
  }) {
    return _then(_$CommentsDTOImpl(
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      commenter: null == commenter
          ? _value.commenter
          : commenter // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommentsDTOImpl implements _CommentsDTO {
  const _$CommentsDTOImpl(
      {this.comment = '',
      this.commenter = '',
      this.createdAt = const ConstDateTime(2024)});

  factory _$CommentsDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommentsDTOImplFromJson(json);

  @override
  @JsonKey()
  final String comment;
  @override
  @JsonKey()
  final String commenter;
  @override
  @JsonKey()
  final DateTime createdAt;

  @override
  String toString() {
    return 'CommentsDTO(comment: $comment, commenter: $commenter, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommentsDTOImpl &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.commenter, commenter) ||
                other.commenter == commenter) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, comment, commenter, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CommentsDTOImplCopyWith<_$CommentsDTOImpl> get copyWith =>
      __$$CommentsDTOImplCopyWithImpl<_$CommentsDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommentsDTOImplToJson(
      this,
    );
  }
}

abstract class _CommentsDTO implements CommentsDTO {
  const factory _CommentsDTO(
      {final String comment,
      final String commenter,
      final DateTime createdAt}) = _$CommentsDTOImpl;

  factory _CommentsDTO.fromJson(Map<String, dynamic> json) =
      _$CommentsDTOImpl.fromJson;

  @override
  String get comment;
  @override
  String get commenter;
  @override
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$CommentsDTOImplCopyWith<_$CommentsDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
