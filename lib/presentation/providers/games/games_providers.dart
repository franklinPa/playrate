


import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:playrate/presentation/providers/games/games_repository_provider.dart';
import '../../../domain/entities/game/game.dart';




final upcomingProvider = StateNotifierProvider<GamesNotifier, List<Game>>((ref) {
  final fetchMoreGames = ref.watch( gameRepositoryProvider ).getUpcoming;
  return GamesNotifier(fetchMoreGames: fetchMoreGames);
});

final bestRatedGamesProvider = StateNotifierProvider<GamesNotifier, List<Game>>((ref) {
  final fetchMoreGames = ref.watch( gameRepositoryProvider ).getBestRated;
  return GamesNotifier(fetchMoreGames: fetchMoreGames);
});

typedef GameCallback = Future<List<Game>> Function({int page});

class GamesNotifier extends StateNotifier<List<Game>>{

  int currentPage = 0;
  bool isLoading = false;
  GameCallback fetchMoreGames;

  GamesNotifier({
    required this.fetchMoreGames
  }):super([]);

  Future<void> loadNextPage() async {

    if ( isLoading ) return;

    isLoading = true;
    currentPage++;

    final List<Game> games = await fetchMoreGames(page: currentPage);

    state = [...state, ...games];
    
    await Future.delayed(const Duration(milliseconds: 300));

    isLoading = false;

  }

}