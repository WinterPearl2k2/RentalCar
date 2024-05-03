import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../application/utils/log_utils.dart';

abstract class BaseStateDelegate<V extends ConsumerStatefulWidget,
N extends AutoDisposeNotifier> extends ConsumerState<V> {
  late final N notifier;

  void initNotifier();

  @override
  void initState() {
    LogUtils.i('Runtime type of widget init: ${widget.runtimeType}');
    super.initState();
    initNotifier();
  }

  @override
  void dispose() {
    LogUtils.i('Runtime type of widget dispose: ${widget.runtimeType}');
    super.dispose();
  }
}
