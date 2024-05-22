import 'package:freezed_annotation/freezed_annotation.dart';

part 'verify_id_state.freezed.dart';

@freezed
class VerifyIdState with _$VerifyIdState {
  const factory VerifyIdState({
    @Default('') String imgFileFront,
    @Default('') String imgFileBack,
    @Default([]) List<dynamic> dataFaceIdCard,
    @Default([]) List<int> test,
    @Default(VerifyStateView.verifyId) VerifyStateView stateView,
  }) = _VerifyIdState;
}

enum VerifyStateView {
  verifyId,
  verifyFace,
  verifySuccess,
}

enum TypeCard {
  frontCard,
  backCard
}