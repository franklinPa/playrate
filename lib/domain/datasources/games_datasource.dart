
import '../entities/game.dart';

abstract class GamesDataSource {


  Future<List<Game>> getNowPlaying({int addGames = 10});

}