


import 'package:dio/dio.dart';
import 'package:playrate/config/constants/environment.dart';
import 'package:playrate/domain/datasources/games_datasource.dart';
import 'package:playrate/domain/entities/game.dart';

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
  Future<List<Game>> getNowPlaying({int addGames = 10}) async {
    
    final response = await dio.get('',queryParameters: {
      'dates': '2022-01-01,2023-05-01',
      'ordering': '-added',
      'page_size': '2'
    });

    final List<Game> games = [];

    return games;
  }



}









