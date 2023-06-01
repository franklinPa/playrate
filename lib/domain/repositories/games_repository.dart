
import '../entities/game/game.dart';

abstract class GamesRepository {

  Future<List<Game>> getUpcoming({int page = 1});
  
  Future<List<Game>> getBestRated({int page = 1});
  
}