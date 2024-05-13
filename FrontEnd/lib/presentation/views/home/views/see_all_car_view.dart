import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rental_car/application/routes/routes.dart';
import 'package:rental_car/presentation/views/home/notifier/home_notifier.dart';
import 'package:rental_car/presentation/views/home/widgets/item_car.dart';

class SeeAllCarView extends StatelessWidget {
  const SeeAllCarView({super.key, required this.notifier});

  final HomeNotifier notifier;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(top: 40, left: 30, right: 30 ).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () => Routes.goToPreviousView(context),
              icon: const Icon(Icons.arrow_back_ios),
            ),
            Expanded(
              child: Consumer(
                builder: (_, ref, __) {
                  final listTopCar = ref.watch(
                    homeNotifierProvider.select((value) => value.listTopCar),
                  );
                  return ListView.builder(
                    padding: const EdgeInsets.only(top: 2),
                    itemCount: listTopCar.length,
                    itemBuilder: (context, index) => Padding(
                      padding:  EdgeInsets.only(bottom: 15.0.h),
                      child: ItemCarWidget(
                        topCarDTO: listTopCar[index],
                        notifier: notifier,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
