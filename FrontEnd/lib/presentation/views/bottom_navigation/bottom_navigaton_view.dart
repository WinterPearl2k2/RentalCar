import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rental_car/application/routes/routes.dart';
import 'package:rental_car/application/utils/assets_utils.dart';
import 'package:rental_car/presentation/views/bottom_navigation/notifier/bottom_navigation_notifier.dart';
import 'package:rental_car/presentation/views/home/home_view.dart';
import 'package:rental_car/presentation/views/manager_car/manager_car_view.dart';
import 'package:rental_car/presentation/views/profile/profile_view.dart';

import '../../../application/utils/colors_utils.dart';
import '../../common/base_state_delegate/base_state_delegate.dart';
import '../contract/contract_view.dart';

class BottomNavigationView extends ConsumerStatefulWidget {
  const BottomNavigationView({super.key});

  @override
  BaseStateDelegate<BottomNavigationView, BottomNavigationNotifier>
      createState() => _BottomNavigationViewState();
}

class _BottomNavigationViewState
    extends BaseStateDelegate<BottomNavigationView, BottomNavigationNotifier> {
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void initNotifier() {
    notifier = ref.read(bottomNavigationNotifierProvider.notifier);
    notifier.listenMessage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Consumer(
          builder: (context, ref, child) {
            ref.watch(
              bottomNavigationNotifierProvider.select(
                (value) => value.currentIndex,
              ),
            );
            return PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _pageController,
              children: const [
                HomeView(),
                ManagerCarView(),
                ContractView(),
                ProfileView(),
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Routes.goToAddCarView(context),
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                ColorUtils.blueColor,
                ColorUtils.blueMiddleColor,
                ColorUtils.blueLightColor,
              ],
              transform: const GradientRotation(50),
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Icon(
            Icons.add,
            color: ColorUtils.whiteColor,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Container(
        color: ColorUtils.primaryBackgroundColor,
        child: BottomAppBar(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          padding: const EdgeInsets.all(0),
          shape: AutomaticNotchedShape(
            const RoundedRectangleBorder(),
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          child: Consumer(
            builder: (context, ref, child) {
              final index = ref.watch(
                bottomNavigationNotifierProvider.select(
                  (value) => value.currentIndex,
                ),
              );
              return BottomNavigationBar(
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      AssetUtils.home,
                      colorFilter: ColorFilter.mode(
                        ColorUtils.primaryColor,
                        BlendMode.srcIn,
                      ),
                    ),
                    activeIcon: SvgPicture.asset(
                      AssetUtils.homeActive,
                      colorFilter: ColorFilter.mode(
                        ColorUtils.blueColor,
                        BlendMode.srcIn,
                      ),
                    ),
                    label: "home",
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      AssetUtils.car,
                      colorFilter: ColorFilter.mode(
                        ColorUtils.primaryColor,
                        BlendMode.srcIn,
                      ),
                    ),
                    activeIcon: SvgPicture.asset(
                      AssetUtils.carActive,
                      colorFilter: ColorFilter.mode(
                        ColorUtils.blueColor,
                        BlendMode.srcIn,
                      ),
                    ),
                    label: "contract",
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      AssetUtils.history,
                      colorFilter: ColorFilter.mode(
                        ColorUtils.primaryColor,
                        BlendMode.srcIn,
                      ),
                    ),
                    activeIcon: SvgPicture.asset(
                      AssetUtils.historyActive,
                      colorFilter: ColorFilter.mode(
                        ColorUtils.blueColor,
                        BlendMode.srcIn,
                      ),
                    ),
                    label: "history",
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      AssetUtils.profile,
                      colorFilter: ColorFilter.mode(
                        ColorUtils.primaryColor,
                        BlendMode.srcIn,
                      ),
                    ),
                    activeIcon: SvgPicture.asset(
                      AssetUtils.profileActive,
                      colorFilter: ColorFilter.mode(
                        ColorUtils.blueColor,
                        BlendMode.srcIn,
                      ),
                    ),
                    label: "profile",
                  ),
                ],
                backgroundColor: ColorUtils.whiteColor,
                selectedItemColor: ColorUtils.blueColor,
                unselectedItemColor: ColorUtils.primaryColor,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                currentIndex: index,
                type: BottomNavigationBarType.fixed,
                onTap: (value) => {
                  _pageController.jumpToPage(value),
                  notifier.setCurrentIndex(value),
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
