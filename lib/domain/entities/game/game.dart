class Game {
    final int id;
    final String name;
    final String description;
    final DateTime released;
    final bool tba;
    final String backgroundImage;
    final String backgroundImageAdditional;
    final double rating;
    final int ratingTop;
    final int ratingsCount;
    final int reviewsCount;
    final List<String> platforms;
    final List<String> developers;
    final List<String> genres;
    final List<String> publishers;
    final String esrbRating;

    Game({
        required this.id,
        required this.name,
        required this.description,
        required this.released,
        required this.tba,
        required this.backgroundImage,
        required this.backgroundImageAdditional,
        required this.rating,
        required this.ratingTop,
        required this.ratingsCount,
        required this.reviewsCount,
        required this.platforms,
        required this.developers,
        required this.genres,
        required this.publishers,
        required this.esrbRating,
    });

    
}

