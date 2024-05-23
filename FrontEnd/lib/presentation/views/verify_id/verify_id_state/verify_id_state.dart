import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rental_car/domain/model/citizen.dart';

part 'verify_id_state.freezed.dart';

@freezed
class VerifyIdState with _$VerifyIdState {
  const factory VerifyIdState({
    @Default('') String imgFileFront,
    @Default('') String imgFileBack,
    @Default([]) List<dynamic> dataFaceIdCard,
    @Default(0) int count,
    @Default([]) List<int> faceMemory,
    @Default(Citizen()) Citizen citizen,
    @Default(VerifyStateView.verifyId) VerifyStateView stateView,
    @Default(false) wait,
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