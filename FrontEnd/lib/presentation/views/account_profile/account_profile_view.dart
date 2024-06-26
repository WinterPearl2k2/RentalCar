import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rental_car/application/utils/assets_utils.dart';
import 'package:rental_car/application/utils/colors_utils.dart';
import 'package:rental_car/data/dtos/user_profile_dto.dart';
import 'package:rental_car/presentation/common/base_state_delegate/base_state_delegate.dart';
import 'package:rental_car/presentation/common/widgets/text_button_widget.dart';
import 'package:rental_car/presentation/views/account_profile/notifier/account_profile_notifier.dart';

import '../../common/widgets/loading_widget.dart';
import '../../common/widgets/text_form_field.dart';

class AccountProfileView extends ConsumerStatefulWidget {
  const AccountProfileView({super.key, required this.user});

  final UserProfileDTO user;

  @override
  BaseStateDelegate<AccountProfileView, AccountProfileNotifier> createState() =>
      _AccountProfileViewState();
}

class _AccountProfileViewState
    extends BaseStateDelegate<AccountProfileView, AccountProfileNotifier> {
  late TextEditingController _emailController;
  late TextEditingController _nameController;
  late TextEditingController _phoneController;

  @override
  void initNotifier() {
    notifier = ref.read(accountProfileNotifierProvider.notifier);
    notifier.setUpData(user: widget.user);
    _emailController = TextEditingController(text: widget.user.email);
    _nameController = TextEditingController(text: widget.user.name);
    _phoneController = TextEditingController(text: widget.user.phone);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Consumer(
        builder: (_, ref, __) {
          final user = ref.watch(
            accountProfileNotifierProvider.select(
              (value) => value.user,
            ),
          );
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: SvgPicture.asset(
                  AssetUtils.icBack,
                ),
                onPressed: () => Navigator.pop(context, user),
              ),
            ),
            body: PopScope(
              onPopInvoked: (didPop) async {
                if (didPop) {
                  return;
                }
                Navigator.pop(context, user);
              },
              canPop: false,
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Account Profile',
                            style: TextStyle(
                              color: ColorUtils.primaryColor,
                              fontSize: 26.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          Center(
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 20.r),
                                  width: 80.w,
                                  height: 80.h,
                                  decoration: BoxDecoration(
                                    color: ColorUtils.textColor,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: SvgPicture.asset(
                                    'assets/images/avatar_empty.svg',
                                  ),
                                ),
                                Consumer(
                                  builder: (BuildContext context, WidgetRef ref,
                                      Widget? child) {
                                    final isAuthentication = ref.watch(
                                      accountProfileNotifierProvider.select(
                                        (value) => value.user.authentication,
                                      ),
                                    );
                                    return TextButton(
                                      onPressed: () => {
                                        if (!isAuthentication)
                                          notifier.goToVerifyUser(context)
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            isAuthentication
                                                ? 'User authenticated'
                                                : 'User not authenticated',
                                            style: TextStyle(
                                              color: ColorUtils.primaryColor,
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          Container(
                                            padding: const EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                              color: isAuthentication
                                                  ? ColorUtils.greenColor
                                                  : ColorUtils.redColor,
                                              shape: BoxShape.circle,
                                            ),
                                            child: SvgPicture.asset(
                                              'assets/icons/ic_security.svg',
                                              width: 15.w,
                                              height: 15.w,
                                              colorFilter: ColorFilter.mode(
                                                ColorUtils.whiteColor,
                                                BlendMode.srcIn,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          Consumer(
                            builder: (BuildContext context, WidgetRef ref,
                                Widget? child) {
                              final err = ref.watch(
                                accountProfileNotifierProvider.select(
                                  (value) => value.errorName,
                                ),
                              );
                              return TextFormFieldCustomWidget(
                                hint: 'Your full name',
                                label: "Full name",
                                inputAction: TextInputAction.next,
                                controller: _nameController,
                                error: err
                                    ? const Text(
                                        'Name cannot be empty!',
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 10,
                                        ),
                                      )
                                    : null,
                                onChanged: (value) => notifier.checkName(value),
                              );
                            },
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          Consumer(
                            builder: (BuildContext context, WidgetRef ref,
                                Widget? child) {
                              final err = ref.watch(
                                accountProfileNotifierProvider.select(
                                  (value) => value.errorEmail,
                                ),
                              );
                              return TextFormFieldCustomWidget(
                                hint: 'Your email address',
                                label: "Email address",
                                inputAction: TextInputAction.next,
                                controller: _emailController,
                                error: err
                                    ? const Text(
                                        'Invalid email!',
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 10,
                                        ),
                                      )
                                    : null,
                                onChanged: (value) =>
                                    notifier.checkEmail(value),
                              );
                            },
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          Consumer(
                            builder: (context, ref, child) {
                              final err = ref.watch(
                                accountProfileNotifierProvider.select(
                                  (value) => value.errorPhone,
                                ),
                              );
                              return TextFormFieldCustomWidget(
                                hint: 'Your phone number',
                                label: "Phone number",
                                inputAction: TextInputAction.done,
                                textInputType: TextInputType.number,
                                controller: _phoneController,
                                error: err
                                    ? const Text(
                                        'Invalid phone number!',
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 10,
                                        ),
                                      )
                                    : null,
                                onChanged: (value) =>
                                    notifier.checkPhone(value),
                              );
                            },
                          ),
                          SizedBox(
                            height: 50.h,
                          ),
                          Consumer(
                            builder: (context, ref, _) {
                              final isBlock = ref.watch(
                                accountProfileNotifierProvider
                                    .select((value) => value.blockButton),
                              );
                              return TextButtonWidget(
                                label: 'Update profile',
                                blockButton: !isBlock,
                                onPressed: () => notifier.updateProfile(
                                  name: _nameController,
                                  email: _emailController,
                                  phoneNumber: _phoneController,
                                  context: context,
                                ),
                              );
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                  Consumer(
                    builder: (context, ref, child) {
                      final isWaiting = ref.watch(
                        accountProfileNotifierProvider.select(
                          (value) => value.wait,
                        ),
                      );
                      return isWaiting
                          ? const LoadingWidget()
                          : const SizedBox();
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _nameController.dispose();
    _phoneController.dispose();
  }
}
