import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../state/detail_contract_state.dart';
part 'detail_contract_notifier.g.dart';

@riverpod
class DetailContractNotifier extends _$DetailContractNotifier {
  @override
  DetailContractState build() => const DetailContractState();

}
