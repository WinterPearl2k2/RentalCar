import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rental_car/presentation/common/base_state_delegate/base_state_delegate.dart';
import 'package:rental_car/presentation/views/notification/notifier/notification_notifier.dart';
import '../../../application/utils/colors_utils.dart';

class NotificationView extends ConsumerStatefulWidget {
  const NotificationView({super.key});

  @override
  BaseStateDelegate<NotificationView, NotificationNotifier> createState() =>
      _NotificationViewState();
}

class _NotificationViewState
    extends BaseStateDelegate<NotificationView, NotificationNotifier> with SingleTickerProviderStateMixin{
  late TabController _controller;

  @override
  void initNotifier() {
    notifier = ref.read(notificationNotifierProvider.notifier);
    _controller = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: SvgPicture.asset(
            'assets/icons/ic_arrow_back.svg',
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: PopScope(
        onPopInvoked: (didPop) async {
          if (didPop) {
            return;
          }
          Navigator.pop(context);
        },
        canPop: false,
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Car Rental Notification',
                    style: TextStyle(
                      color: ColorUtils.primaryColor,
                      fontSize: 26.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Expanded(
                    child: TabBar(
                      isScrollable: true,
                      unselectedLabelColor: Colors.grey,
                      indicatorColor: Colors.black54,
                      tabs: const [
                        Tab(
                          text: "Featured",
                        ),
                        Tab(
                          text: "Popular",
                        ),
                      ],
                      controller: _controller,
                    ),
                  ),
                ],
              ),
            ),
            // Consumer(
            //   builder: (context, ref, child) {
            //     // final isWaiting = ref.watch(
            //     //   accountProfileNotifierProvider.select(
            //     //         (value) => value.wait,
            //     //   ),
            //     // );
            //     return false ? const LoadingWidget() : const SizedBox();
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
