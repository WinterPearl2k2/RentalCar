import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rental_car/application/utils/colors_utils.dart';
import 'package:rental_car/presentation/common/base_state_delegate/base_state_delegate.dart';
import 'package:rental_car/presentation/common/widgets/error_custom_widget.dart';
import 'package:rental_car/presentation/common/widgets/loading_widget.dart';
import 'package:rental_car/presentation/views/manager_car/notifier/manager_car_notifier.dart';
import 'package:rental_car/presentation/views/manager_car/widgets/item_manager_car_loading_widget.dart';
import 'package:rental_car/presentation/views/manager_car/widgets/list_manager_car_widget.dart';
import 'package:rental_car/presentation/views/manager_car/widgets/no_car_widget.dart';

import '../../common/enum/status.dart';

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
    return Scaffold(
      backgroundColor: ColorUtils.primaryBackgroundColor,
      appBar: AppBar(
        backgroundColor: ColorUtils.primaryBackgroundColor,
        title: Text(
          'Manager Car',
          style: TextStyle(
            color: ColorUtils.primaryColor,
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 5.0.w,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: RefreshIndicator(
                onRefresh: () async {
                  await notifier.getListCarByIdUser();
                },
                child: EasyRefresh(
                  onLoad: () async {
                    await notifier.getListCarByIdUser();
                  },
                  child: Consumer(
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
                          return Stack(children: [
                            ListView.builder(
                              itemCount: 2,
                              itemBuilder: (context, index) => Padding(
                                padding: EdgeInsets.only(bottom: 20.h),
                                child: const ItemManagerCarLoadingWidget(),
                              ),
                            ),
                            const LoadingWidget(),
                          ]);
                        case Status.success:
                          return listCarUser.isNotEmpty
                              ? ListManagerCarWidget(
                                  notifier: notifier,
                                  listCarUser: listCarUser,
                                )
                              : const NoCarWidget();
                        case Status.error:
                          return const ErrorCustomWidget();
                      }
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
