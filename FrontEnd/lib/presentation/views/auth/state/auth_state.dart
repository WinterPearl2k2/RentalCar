import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rental_car/domain/model/user.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    @Default(User()) User user,
    @Default(StateView.signIn) StateView stateView,
  }) = _AuthState;
}

enum StateView { signIn, signUp }