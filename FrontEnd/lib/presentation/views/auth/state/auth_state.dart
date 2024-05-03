import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rental_car/domain/model/user.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    @Default(User()) User user,
    @Default(StateView.signIn) StateView stateView,
    @Default(false) bool showPassword,
    @Default(false) bool wait,
    @Default(false) errorName,
    @Default(false) errorEmail,
    @Default(false) errorPhone,
    @Default(false) errorPassword,
  }) = _AuthState;
}

enum StateView { signIn, signUp }