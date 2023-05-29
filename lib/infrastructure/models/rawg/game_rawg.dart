
class GameRawg {
    final String name;
    final DateTime? released;
    final String backgroundImage;
    final double rating;
    final int ratingTop;
    final int ratingsCount;
    final int reviewsTextCount;
    final int added;
    final int id;
    final int reviewsCount;

    GameRawg({
        required this.name,
        required this.released,
        required this.backgroundImage,
        required this.rating,
        required this.ratingTop,
        required this.ratingsCount,
        required this.reviewsTextCount,
        required this.added,
        required this.id,
        required this.reviewsCount,
    });

    factory GameRawg.fromJson(Map<String, dynamic> json) => GameRawg(
        name: json["name"],
        released:json["released"] != null ? DateTime.parse(json["released"]) : null,
        backgroundImage: json["background_image"] ?? '',
        rating: json["rating"]?.toDouble() ?? 0,
        ratingTop: json["rating_top"],
        ratingsCount: json["ratings_count"],
        reviewsTextCount: json["reviews_text_count"],
        added: json["added"],
        id: json["id"],
        reviewsCount: json["reviews_count"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "released": released == null ? null : "${released!.year.toString().padLeft(4, '0')}-${released!.month.toString().padLeft(2, '0')}-${released!.day.toString().padLeft(2, '0')}",
        "background_image": backgroundImage,
        "rating": rating,
        "rating_top": ratingTop,
        "ratings_count": ratingsCount,
        "reviews_text_count": reviewsTextCount,
        "added": added,
        "id": id,
        "reviews_count": reviewsCount,
    };
}

