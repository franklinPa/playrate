

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers.dart';

final initialLoadingProvider = Provider<bool>((ref) {

  final step1 = ref.watch(gamesSlideshowProvider).isEmpty;
  final step2 = ref.watch(upcomingProvider).isEmpty;
  final step3 = ref.watch(bestRatedGamesProvider).isEmpty;

  if(step1 || step2 || step3) return true;

  return false;

});