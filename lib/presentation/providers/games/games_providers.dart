


import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:playrate/presentation/providers/games/games_repository_provider.dart';
import '../../../domain/entities/game/game.dart';




final upcomingProvider = StateNotifierProvider<GamesNotifier, List<Game>>((ref) {
  final fetchMoreGames = ref.watch( gameRepositoryProvider ).getUpcoming;
  return GamesNotifier(fetchMoreGames: fetchMoreGames);
});

typedef GameCallback = Future<List<Game>> Function({int pageSize});

class GamesNotifier extends StateNotifier<List<Game>>{

  int currentPageSize = 0;
  bool isLoading = false;
  GameCallback fetchMoreGames;

  GamesNotifier({
    required this.fetchMoreGames
  }):super([]);

  Future<void> loadNextPageSize() async {

    if ( isLoading ) return;

    isLoading = true;
    currentPageSize += 10;

    final List<Game> games = await fetchMoreGames(pageSize: currentPageSize);

    state = [...state, ...games];
    await Future.delayed(const Duration(milliseconds: 300));
    isLoading = false;

  }

}