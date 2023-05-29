import '../../domain/entities/game/game.dart';
import '../models/rawg/game_rawg.dart';

class GameMapper {
  static Game gameRawgToEntity(GameRawg gameRawg) => Game(
      id: gameRawg.id,
      name: gameRawg.name,
      description: '',
      released: DateTime.now(),
      tba: true,
      backgroundImage: (gameRawg.backgroundImage != '') 
      ? gameRawg.backgroundImage
      : 'no-image',
      backgroundImageAdditional: '',
      rating: gameRawg.rating,
      ratingTop: gameRawg.ratingTop,
      ratingsCount: gameRawg.ratingsCount,
      reviewsCount: gameRawg.reviewsCount,
      platforms: List.empty(),
      developers: List.empty(),
      genres: List.empty(),
      publishers: List.empty(),
      esrbRating: '');
}
