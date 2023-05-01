import '../entities/game.dart';

abstract class GamesRepository {

  Future<List<Game>> getNowPlaying({int addGames = 10});
  
}