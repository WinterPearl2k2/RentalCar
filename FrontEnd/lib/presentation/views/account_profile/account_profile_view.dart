import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rental_car/application/utils/colors_utils.dart';
import 'package:rental_car/data/dtos/user_profile_dto.dart';
import 'package:rental_car/presentation/common/base_state_delegate/base_state_delegate.dart';
import 'package:rental_car/presentation/common/widgets/text_button_widget.dart';
import 'package:rental_car/presentation/views/account_profile/notifier/account_profile_notifier.dart';

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
    // final args = (ModalRoute.of(context)?.settings.arguments ??
    //     <String, dynamic>{}) as Map;
    // final user = args['user'] ?? "";
    // notifier.setUpData(user: user);
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          appBar: AppBar(),
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
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
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Change profile picture',
                            style: TextStyle(
                              color: ColorUtils.primaryColor,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Consumer(
                    builder:
                        (BuildContext context, WidgetRef ref, Widget? child) {
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
                    builder:
                        (BuildContext context, WidgetRef ref, Widget? child) {
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
                        onChanged: (value) => notifier.checkEmail(value),
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
                        onChanged: (value) => notifier.checkPhone(value),
                      );
                    },
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  TextButtonWidget(
                    label: 'Update profile',
                    onPressed: () => notifier.updateProfile(
                      name: _nameController,
                      email: _emailController,
                      phoneNumber: _phoneController,
                      context: context,
                    ),
                  )
                ],
              ),
            ),
          )),
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
