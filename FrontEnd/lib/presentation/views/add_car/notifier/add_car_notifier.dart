import 'package:rental_car/presentation/views/add_car/state/add_car_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'add_car_notifier.g.dart';

@riverpod
class AddCarNotifier extends _$AddCarNotifier {
  @override
  AddCarState build() =>  AddCarState();

  void changeForwardView() {
    switch (state.addCarStep) {
      case AddCarStep.step0:
        state = state.copyWith(addCarStep: AddCarStep.step1);
        break;
      case AddCarStep.step1:
        state = state.copyWith(addCarStep: AddCarStep.step2);
        break;
      case AddCarStep.step2:
        state = state.copyWith(addCarStep: AddCarStep.step3);
        break;
      case AddCarStep.step3:
        state = state.copyWith(addCarStep: AddCarStep.step4);
        break;
      case AddCarStep.step4:
        state = state.copyWith(addCarStep: AddCarStep.success);
        break;
      case AddCarStep.success:
        break;
    }
  }

  void changeBackwardView() {
    switch (state.addCarStep) {
      case AddCarStep.step0:
        break;
      case AddCarStep.step1:
        state = state.copyWith(addCarStep: AddCarStep.step0);
        break;
      case AddCarStep.step2:
        state = state.copyWith(addCarStep: AddCarStep.step1);
        break;
      case AddCarStep.step3:
        state = state.copyWith(addCarStep: AddCarStep.step2);
        break;
      case AddCarStep.step4:
        state = state.copyWith(addCarStep: AddCarStep.step3);
        break;
      case AddCarStep.success:
        state = state.copyWith(addCarStep: AddCarStep.step4);
        break;
    }
  }
}
