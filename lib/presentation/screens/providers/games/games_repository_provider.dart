

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:playrate/infrastructure/datasources/gamerawg_datasource.dart';
import 'package:playrate/infrastructure/repositories/game_repository_impl.dart';


// Este repositorio es inmutable
final gameRepositoryProvider = Provider((ref) {

  return GameRepositoryImpl(GamerawgDatasource());
});