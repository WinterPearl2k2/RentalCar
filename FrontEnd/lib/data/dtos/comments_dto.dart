import 'package:const_date_time/const_date_time.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'comments_dto.freezed.dart';
part 'comments_dto.g.dart';

@freezed
class CommentsDTO with _$CommentsDTO {
  const factory CommentsDTO({
    @Default('') String comment,
    @Default('') String commenter,
    @Default(ConstDateTime(2024)) DateTime createdAt,
  }) = _CommentsDTO;

  factory CommentsDTO.fromJson(Map<String, dynamic> json) => _$CommentsDTOFromJson(json);
}
