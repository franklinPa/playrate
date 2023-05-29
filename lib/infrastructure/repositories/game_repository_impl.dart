

import 'package:playrate/domain/datasources/games_datasource.dart';
import 'package:playrate/domain/entities/game/game.dart';
import 'package:playrate/domain/repositories/games_repository.dart';

class GameRepositoryImpl extends GamesRepository {

  final GamesDataSource dataSource;

  GameRepositoryImpl(this.dataSource);

  @override
  Future<List<Game>> getUpcoming({int pageSize = 10}) {
    return dataSource.getUpcoming(pageSize: pageSize);
  }
  
}