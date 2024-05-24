import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jumping_dot/jumping_dot.dart';
import 'package:rental_car/application/utils/colors_utils.dart';
import 'package:rental_car/presentation/common/base_state_delegate/base_state_delegate.dart';
import 'package:rental_car/presentation/common/widgets/text_button_widget.dart';
import 'package:rental_car/presentation/views/profile/notifier/profile_notifier.dart';
import 'package:rental_car/presentation/views/profile/widgets/button_settings_widget.dart';

import '../../../application/routes/routes.dart';
import '../../common/widgets/loading_widget.dart';

class ProfileView extends ConsumerStatefulWidget {
  const ProfileView({super.key});

  @override
  BaseStateDelegate<ProfileView, ProfileNotifier> createState() =>
      _ProfileViewState();
}

class _ProfileViewState extends BaseStateDelegate<ProfileView, ProfileNotifier>
    with AutomaticKeepAliveClientMixin {
  @override
  void initNotifier() {
    notifier = ref.read(profileNotifierProvider.notifier);
    notifier.getUser();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: ColorUtils.primaryBackgroundColor,
      appBar: AppBar(
        backgroundColor: ColorUtils.primaryBackgroundColor,
        title: Text(
          'Profile',
          style: TextStyle(
            color: ColorUtils.primaryColor,
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.only(bottom: 40),
        child: Stack(
          children: [
            Consumer(
              builder: (BuildContext context, WidgetRef ref, Widget? child) {
                final user = ref.watch(
                  profileNotifierProvider.select((value) => value.user),
                );
                return Column(
                  children: [
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(30),
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        gradient: LinearGradient(
                          colors: [
                            ColorUtils.blueColor,
                            ColorUtils.blueMiddleColor,
                          ],
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 20.r),
                            width: 55.w,
                            height: 55.h,
                            decoration: BoxDecoration(
                              color: ColorUtils.whiteColor,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: SvgPicture.asset(
                              'assets/images/avatar_empty.svg',
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                user.name,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: ColorUtils.whiteColor,
                                  fontSize: 16.sp,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                user.email,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: ColorUtils.whiteColor,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    ButtonSettingsWidget(
                      icon: SvgPicture.asset(
                        'assets/icons/ic_user_account.svg',
                      ),
                      title: 'Account profile',
                      onPressed: () => Routes.goToAccountProfileView(
                        context,
                        user,
                      ).then(
                        (value) => notifier.updateUser(user: value),
                      ),
                    ),
                    Container(
                      height: 1,
                      width: double.infinity,
                      color: ColorUtils.textColor,
                    ),
                    ButtonSettingsWidget(
                      icon: SvgPicture.asset(
                        'assets/icons/ic_notification.svg',
                      ),
                      title: 'Car Rental Management',
                      onPressed: () => Routes.goToCarRentalManagementView(
                        context,
                      ),
                    ),
                    Container(
                      height: 1,
                      width: double.infinity,
                      color: ColorUtils.textColor,
                    ),
                    ButtonSettingsWidget(
                      icon: SvgPicture.asset(
                        'assets/icons/ic_change_password.svg',
                      ),
                      title: 'Change Password',
                      onPressed: () => Routes.goToChangePasswordView(
                        context,
                      ),
                    ),
                    const Expanded(
                      child: SizedBox.shrink(),
                    ),
                    TextButtonWidget(
                      label: 'Logout',
                      onPressed: () => notifier.logOut(context: context),
                    ),
                  ],
                );
              },
            ),
            Consumer(
              builder: (context, ref, child) {
                final isWaiting = ref.watch(
                  profileNotifierProvider.select(
                    (value) => value.loading,
                  ),
                );
                return isWaiting ? const LoadingWidget() : const SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
