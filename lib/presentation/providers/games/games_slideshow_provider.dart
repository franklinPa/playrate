import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:playrate/domain/entities/game/game.dart';
import 'games_providers.dart';


final gamesSlideshowProvider = Provider<List<Game>>((ref){

  final upcomingGames = ref.watch(upcomingProvider);

  if(upcomingGames.isEmpty) return [];

  return upcomingGames.sublist(0,6);

  
});