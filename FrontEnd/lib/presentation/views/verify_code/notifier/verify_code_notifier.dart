import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../state/verify_code_state.dart';

part 'verify_code_notifier.g.dart';

@riverpod
class VerifyCodeNotifier extends _$VerifyCodeNotifier {
  @override
  VerifyCodeState build() => const VerifyCodeState();
}
