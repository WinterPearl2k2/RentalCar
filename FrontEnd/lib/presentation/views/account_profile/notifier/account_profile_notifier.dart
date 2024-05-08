import 'package:fluttertoast/fluttertoast.dart';
import 'package:rental_car/application/services/preference_service.dart';
import 'package:rental_car/data/dtos/user_profile_dto.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../application/services/auth_service.dart';
import '../../../../application/utils/log_utils.dart';
import '../../../../application/utils/regex_check_utils.dart';
import '../../../../data/data_sources/remote/dio/api_exception.dart';
import '../../../../main.dart';
import '../state/account_profile_state.dart';

part 'account_profile_notifier.g.dart';

@riverpod
class AccountProfileNotifier extends _$AccountProfileNotifier {
  @override
  AccountProfileState build() => const AccountProfileState();

  Future<void> setUpData({
    required UserProfileDTO user,
  }) async {
    await Future.delayed(const Duration(milliseconds: 1),);
    state = state.copyWith(
      user: UserProfileDTO(
        email: user.email,
        phone: user.phone,
        name: user.name,
      ),
    );
  }

  Future<void> updateProfile({
    required name,
    required email,
    required phoneNumber,
    required context,
  }) async {
    state = state.copyWith(wait: true);
    if (_checkValid(
      name.text,
      email.text,
      phoneNumber.text,
    )) {
      Fluttertoast.showToast(msg: 'Invalid information!');
      state = state.copyWith(wait: false);
      return;
    }

    final userProfileDto = UserProfileDTO(
      name: name.text,
      email: email.text,
      phone: phoneNumber.text,
    );
    try {
      final userUpdated = await injection.getIt<IAuthService>().updateUser(
        userDTO: userProfileDto,
      );
      state = state.copyWith(
        user: userUpdated,
      );
      state = state.copyWith(blockButton: false);
      Fluttertoast.showToast(msg: 'Information updated successfully.');
    } on APIException catch (e) {
      LogUtils.e(e.message.toString());
      Fluttertoast.showToast(msg: e.message.toString());
    }
    state = state.copyWith(wait: false);
  }

  bool _checkValid(
    String name,
    String email,
    String phoneNumber,
  ) {
    bool check = false;
    if (!RegexCheckUtils.emailRegex.hasMatch(email)) {
      state = state.copyWith(errorEmail: true);
      check = true;
    }
    if (name.isEmpty) {
      state = state.copyWith(errorName: true);
      check = true;
    }
    if (!RegexCheckUtils.phoneRegex.hasMatch(phoneNumber)) {
      state = state.copyWith(errorPhone: true);
      check = true;
    }
    return check;
  }

  void checkName(String value) {
    if(value == state.user.name) {
      state = state.copyWith(blockButton: false);
      return;
    }
    if (state.errorName) {
      state = state.copyWith(errorName: value.isEmpty);
    }
    state = state.copyWith(blockButton: true);
  }

  void checkEmail(String value) {
    if(value == state.user.email) {
      state = state.copyWith(blockButton: false);
      return;
    }
    if (state.errorEmail) {
      state = state.copyWith(
        errorEmail: !RegexCheckUtils.emailRegex.hasMatch(value),
      );
    }
    state = state.copyWith(blockButton: true);
  }

  void checkPhone(String value) {
    if(value == state.user.phone) {
      state = state.copyWith(blockButton: false);
      return;
    }
    if (state.errorPhone) {
      state = state.copyWith(
        errorPhone: !RegexCheckUtils.phoneRegex.hasMatch(value),
      );
    }
    state = state.copyWith(blockButton: true);
  }
}
