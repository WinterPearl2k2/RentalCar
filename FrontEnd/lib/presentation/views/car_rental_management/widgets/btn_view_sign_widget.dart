import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rental_car/presentation/views/car_rental_management/widgets/text_button_notification_widget.dart';

import '../../../../application/utils/colors_utils.dart';
import '../../../../data/dtos/user_car_rental_dto.dart';
import '../notifier/car_rental_management_notifier.dart';

class BtnViewSignWidget extends StatelessWidget {
  const BtnViewSignWidget({
    super.key,
    required this.notifier,
    required this.user,
    required this.index,
  });

  final CarRentalManagementNotifier notifier;
  final List<UserCarRentalDto> user;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        TextButtonNotificationWidget(
          label: 'Sign contract',
          onPressed: () => notifier.signContract(
            idTransaction:
            user[index].transaction,
          ),
          backgroundColor:
          ColorUtils.primaryColor,
          textColor: ColorUtils.whiteColor,
        ),
        const SizedBox(
          height: 15,
        ),
        TextButtonNotificationWidget(
          label: 'Cancel',
          onPressed: () =>
              notifier.cancelRentalCar(
                idTransaction:
                user[index].transaction,
              ),
          backgroundColor: Colors.redAccent,
          textColor: ColorUtils.whiteColor,
        ),
      ],
    );
  }
}