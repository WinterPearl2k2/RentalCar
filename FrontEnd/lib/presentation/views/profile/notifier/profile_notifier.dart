import 'package:fluttertoast/fluttertoast.dart';
import 'package:rental_car/application/services/auth_service.dart';
import 'package:rental_car/application/services/preference_service.dart';
import 'package:rental_car/data/dtos/user_profile_dto.dart';
import 'package:rental_car/main.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../application/routes/routes.dart';
import '../../../../application/utils/log_utils.dart';
import '../../../../data/data_sources/remote/dio/api_exception.dart';
import '../state/profile_state.dart';

part 'profile_notifier.g.dart';

@riverpod
class ProfileNotifier extends _$ProfileNotifier {
  @override
  ProfileState build() => const ProfileState();

  void logOut({
    required context,
  }) {
    PreferenceService.clearUUID();
    PreferenceService.clearToken();
    Routes.goToAuthScreen(context);
  }

  Future<void> getUser() async {
    try {
      final user = await injection.getIt<IAuthService>().getUser();
      state = state.copyWith(user: user);
    } on APIException catch (e) {
      LogUtils.e(e.message.toString());
      Fluttertoast.showToast(msg: e.message.toString());
    }
    state = state.copyWith(loading: false);
  }

  void updateUser({required Object? user}) {
    if (user != null) {
      LogUtils.i(user.toString());
      state = state.copyWith(
        user: user as UserProfileDTO,
      );
    }
  }
}
