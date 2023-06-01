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

  List<Game> _jsonToGames( Map<String,dynamic> json ) {
    
    final gameRawgResponse = GameRawgResponse.fromJson(json);

    final List<Game> games = gameRawgResponse.results
    .where((gameRawg) => gameRawg.backgroundImage != 'no-image')
    .map(
      (gameRawg) => GameMapper.gameRawgToEntity(gameRawg)
    ).toList();
    
    return games;
  }
  
  @override
  Future<List<Game>> getUpcoming({int page = 1}) async {

    //hacer un getnow datetime :)

    final response = await dio.get('',queryParameters: {
      'dates': '2021-01-01,2023-05-01',
      'page': page,
      'ordering': '-relevance'
    });
    
    return _jsonToGames(response.data);
  }
  
  @override
  Future<List<Game>> getBestRated({int page = 1}) async {

    final response = await dio.get('',queryParameters: {
      'dates': '2023-01-01,2024-01-01',
      'page': page,
      'ordering': '-rating'
    });

    return _jsonToGames(response.data);

  }



}









