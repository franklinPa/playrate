

import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String theGameRawgKey = dotenv.env['THE_RAWG_KEY'] ?? 'No hay apikey';
}