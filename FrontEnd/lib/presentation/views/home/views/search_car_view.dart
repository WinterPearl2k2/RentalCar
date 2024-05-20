import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jumping_dot/jumping_dot.dart';
import 'package:rental_car/application/routes/routes.dart';
import 'package:rental_car/application/utils/assets_utils.dart';
import 'package:rental_car/application/utils/colors_utils.dart';
import 'package:rental_car/presentation/common/base_state_delegate/base_state_delegate.dart';
import 'package:rental_car/presentation/common/enum/status.dart';
import 'package:rental_car/presentation/common/widgets/error_custom_widget.dart';
import 'package:rental_car/presentation/common/widgets/search_form_field.dart';
import 'package:rental_car/presentation/views/home/notifier/home_notifier.dart';
import 'package:rental_car/presentation/views/home/widgets/item_car_widget.dart';
import 'package:rental_car/presentation/views/home/widgets/search_car_empty_widget.dart';
import 'package:rental_car/presentation/views/home/widgets/search_car_init_widget.dart';

class SearchCarView extends ConsumerStatefulWidget {
  const SearchCarView({super.key});

  @override
  BaseStateDelegate<SearchCarView, HomeNotifier> createState() =>
      _SearchCarViewState();
}

class _SearchCarViewState
    extends BaseStateDelegate<SearchCarView, HomeNotifier> {
  final TextEditingController searchController = TextEditingController();
  Timer? _debounce;

  @override
  void initNotifier() {
    notifier = ref.read(homeNotifierProvider.notifier);
    notifier.clearSearch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 40, left: 10, right: 10).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () => Routes.goToPreviousView(context),
              icon: const Icon(Icons.arrow_back_ios),
            ),
            SearchFormField(
              controller: searchController,
              prefixIcon: SvgPicture.asset(
                AssetUtils.icSearch,
                height: 5.h,
                width: 5.w,
                fit: BoxFit.scaleDown,
              ),
              onChanged: (_) {
                notifier.isCheckSearch(
                  searchController: searchController.text.toUpperCase().trim(),
                );
                if (_debounce?.isActive ?? false) _debounce?.cancel();
                _debounce = Timer(const Duration(milliseconds: 1000), () {
                  notifier.getListSearchCars(
                    nameCar: searchController.text.toUpperCase().trim(),
                  );
                });
              },
            ),
            const SizedBox(
              height: 10.0,
            ),
            Expanded(
              child: Consumer(
                builder: (_, ref, __) {
                  final listSearchCar = ref.watch(
                    homeNotifierProvider.select((value) => value.listSearchCar),
                  );
                  final isCheckSearch = ref.watch(
                    homeNotifierProvider.select((value) => value.isCheckSearch),
                  );
                  final statusSearch = ref.watch(
                    homeNotifierProvider.select((value) => value.statusSearch),
                  );
                  switch (isCheckSearch) {
                    case true:
                      switch (statusSearch) {
                        case Status.loading:
                          return Center(
                            child: SingleChildScrollView(
                              child: JumpingDots(
                                color: ColorUtils.primaryColor,
                              ),
                            ),
                          );
                        case Status.success:
                          return listSearchCar.isNotEmpty
                              ? ListView.builder(
                                  padding: const EdgeInsets.only(top: 2),
                                  itemCount: listSearchCar.length,
                                  itemBuilder: (context, index) => Padding(
                                    padding: EdgeInsets.only(bottom: 15.0.h),
                                    child: ItemCarWidget(
                                      notifier: notifier,
                                      idCar: listSearchCar[index].idCar,
                                      imagesCar: listSearchCar[index].imagesCar,
                                      nameCar: listSearchCar[index].nameCar,
                                      priceCar: listSearchCar[index].priceCar,
                                      averageRating: listSearchCar[index].averageRating,
                                      reviewCount:  listSearchCar[index].reviewCount,
                                    ),
                                  ),
                                )
                              : SearchCarEmptyWidget(
                                  typingInput: searchController.text,
                                );
                        case Status.error:
                          return const ErrorCustomWidget();
                      }
                    case false:
                      return const SearchCarInitWidget();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
