import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rental_car/application/routes/routes.dart';
import 'package:rental_car/application/utils/colors_utils.dart';
import 'package:rental_car/presentation/common/base_state_delegate/base_state_delegate.dart';
import 'package:rental_car/presentation/views/home/notifier/home_notifier.dart';
import 'package:rental_car/presentation/views/home/widgets/divider_widget.dart';
import 'package:rental_car/presentation/views/home/widgets/header_home_widget.dart';
import 'package:rental_car/presentation/views/home/widgets/list_top_vehicle_widget.dart';
import 'package:rental_car/presentation/views/home/widgets/list_vehicle_near_you_widget.dart';
import 'package:rental_car/presentation/views/home/widgets/slide_banner_home_widget.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  BaseStateDelegate<HomeView, HomeNotifier> createState() => _HomeViewState();
}

class _HomeViewState extends BaseStateDelegate<HomeView, HomeNotifier>
    with AutomaticKeepAliveClientMixin {
  final ScrollController _scrollController = ScrollController();

  @override
  void initNotifier() {
    notifier = ref.read(homeNotifierProvider.notifier);
    notifier.getListTopCars();
    notifier.getLocationUser();
    notifier.getListAllCars();
    notifier.getNumberNotification();
    notifier.setListenMessage();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderHomeWidget(
              notifier: notifier,
            ),
            Expanded(
              child: RefreshIndicator(
                onRefresh: () async {
                  await notifier.getListTopCars();
                  await notifier.getListAllCars();
                },
                child: EasyRefresh(
                  footer: const MaterialFooter(
                    infiniteHitOver: false,
                  ),
                  onLoad: () async {
                    await notifier.getListAllCars();
                  },
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SlideBannerHomeWidget(),
                        const DividerWidget(),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 14.0.w,
                            vertical: 10.0.h,
                          ),
                          child: Row(
                            children: [
                              Text(
                                "Top vehicle",
                                style: TextStyle(
                                  color: ColorUtils.primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17.sp,
                                ),
                              ),
                              const Spacer(),
                              GestureDetector(
                                onTap: () =>
                                    Routes.goToSeeAllCarView(context, notifier),
                                child: Text(
                                  "See all",
                                  style: TextStyle(
                                    color: ColorUtils.textColor,
                                    fontSize: 14.sp,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 200.h,
                          child: ListTopVehicleWidget(notifier: notifier),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 14.0.w,
                            vertical: 10.0.h,
                          ),
                          child: Text(
                            "Vehicle near you",
                            style: TextStyle(
                              color: ColorUtils.primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 17.sp,
                            ),
                          ),
                        ),
                        ListVehicleNearYouWidget(
                          notifier: notifier,
                          scrollController: _scrollController,
                        ),
                        const SizedBox(height: 20,),
                      ],
                    ),
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
