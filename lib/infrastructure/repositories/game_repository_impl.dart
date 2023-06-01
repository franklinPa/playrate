

import 'package:playrate/domain/datasources/games_datasource.dart';
import 'package:playrate/domain/entities/game/game.dart';
import 'package:playrate/domain/repositories/games_repository.dart';

class GameRepositoryImpl extends GamesRepository {

  final GamesDataSource dataSource;

  GameRepositoryImpl(this.dataSource);

  @override
  Future<List<Game>> getUpcoming({int page = 1}) {
    return dataSource.getUpcoming(page: page);
  }
  
  @override
  Future<List<Game>> getBestRated({int page = 1}) {
    return dataSource.getBestRated(page: page);
  }
  
}