import 'package:dio/dio.dart';

import '../../config/constants/environment.dart';
import '../../domain/datasources/games_datasource.dart';
import '../../infrastructure/mappers/game_mapper.dart';
import '../../domain/entities/game/game.dart';
import '../models/rawg/rawg_response.dart';

class GamerawgDatasource extends GamesDataSource{
  
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.rawg.io/api/games',
      queryParameters: {
        'key': Environment.theGameRawgKey
      }
    )
  );
  
  @override
  Future<List<Game>> getUpcoming({int pageSize = 10}) async {

    //hacer un getnow datetime :)

    final response = await dio.get('',queryParameters: {
      'dates': '2023-01-01,2024-05-01',
      'page_size': '5',
      'ordering': '-relevance'
    });

    final gameRawgResponse = GameRawgResponse.fromJson(response.data);

    final List<Game> games = gameRawgResponse.results
    .where((gameRawg) => gameRawg.backgroundImage != 'no-image')
    .map(
      (gameRawg) => GameMapper.gameRawgToEntity(gameRawg)
    ).toList();

    return games;
  }



}









