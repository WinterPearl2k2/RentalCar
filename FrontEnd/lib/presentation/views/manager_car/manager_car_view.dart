import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rental_car/application/utils/colors_utils.dart';
import 'package:rental_car/presentation/common/base_state_delegate/base_state_delegate.dart';
import 'package:rental_car/presentation/views/manager_car/notifier/manager_car_notifier.dart';
import 'package:rental_car/presentation/views/manager_car/state/manager_car_state.dart';
import 'package:rental_car/presentation/views/manager_car/widgets/list_manager_car_widget.dart';
import 'package:rental_car/presentation/views/manager_car/widgets/no_car_widget.dart';

class ManagerCarView extends ConsumerStatefulWidget {
  const ManagerCarView({super.key});

  @override
  BaseStateDelegate<ManagerCarView, ManagerCarNotifier> createState() =>
      _HomeViewState();
}

class _HomeViewState
    extends BaseStateDelegate<ManagerCarView, ManagerCarNotifier>
    with AutomaticKeepAliveClientMixin {
  @override
  void initNotifier() {
    notifier = ref.read(managerCarNotifierProvider.notifier);
    notifier.getListCarByIdUser();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.0.w, vertical: 15.0.h),
          child: EasyRefresh(
            onRefresh: () async {
              await notifier.getListCarByIdUser();
            },
            onLoad: () async {
              await notifier.getListCarByIdUser();
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  "Manager Car",
                  style: TextStyle(
                    color: ColorUtils.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 17.sp,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Consumer(
                  builder: (_, ref, __) {
                    final listCarUser = ref.watch(
                      managerCarNotifierProvider
                          .select((value) => value.listCarUser),
                    );
                    final status = ref.watch(
                      managerCarNotifierProvider
                          .select((value) => value.status),
                    );
                    switch (status) {
                      case Status.loading:
                        return const Expanded(
                          child: Center(
                            child: SingleChildScrollView(
                              child: CircularProgressIndicator(),
                            ),
                          ),
                        );

                      case Status.success:
                        return listCarUser.isNotEmpty
                            ? Expanded(
                                child: ListManagerCarWidget(
                                  notifier: notifier,
                                  listCarUser: listCarUser,
                                ),
                              )
                            : const Expanded(
                                child: NoCarWidget(),
                              );
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
