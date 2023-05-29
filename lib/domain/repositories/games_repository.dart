
import '../entities/game/game.dart';

abstract class GamesRepository {

  Future<List<Game>> getUpcoming({int pageSize = 10});
  
}