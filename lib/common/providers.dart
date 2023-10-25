import 'package:flutter_riverpod/flutter_riverpod.dart';

final StateProvider<bool> devicePreviewProvider = StateProvider<bool>((_) => false);
final AutoDisposeStateProvider<bool> isLoadingProvider = StateProvider.autoDispose<bool>((_) => false);

final isAuthenticatedProvider = StateProvider<bool>((_) => false);

final AutoDisposeStateProvider<List<String>> orderReturnIdsProvider = StateProvider.autoDispose<List<String>>((_) => []);

final isPaymentSummaryModalOpenProvider = StateProvider<bool>((_) => false);
final isConfirmPaymentModalOpenProvider = StateProvider<bool>((_) => false);
