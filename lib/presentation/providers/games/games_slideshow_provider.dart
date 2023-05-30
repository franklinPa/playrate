import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:playrate/domain/entities/game/game.dart';
import 'games_providers.dart';


final gamesSlideshowProvider = Provider<List<Game>>((ref){

  final upcoming = ref.watch(upcomingProvider);

  if(upcoming.isEmpty) return [];

  return upcoming.sublist(0,6);

  
});