import '../state/auth_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_notifier.g.dart';

@riverpod
class AuthNotifier extends _$AuthNotifier {
  @override
  AuthState build() => const AuthState();

  void changeView() {
    if (state.stateView == StateView.signIn) {
      state = state.copyWith(stateView: StateView.signUp);
    } else {
      state = state.copyWith(stateView: StateView.signIn);
    }
  }
}