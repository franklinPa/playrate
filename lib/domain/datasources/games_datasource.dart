

import '../entities/game/game.dart';

abstract class GamesDataSource {


  Future<List<Game>> getUpcoming({int pageSize = 10});

}