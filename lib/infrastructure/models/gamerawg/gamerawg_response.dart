import 'game_gamerawg.dart';

class GameRawgResponse {
    final int count;
    final String next;
    final List<GameGameRAWG> results;
    final bool userPlatforms;

    GameRawgResponse({
        required this.count,
        required this.next,
        required this.results,
        required this.userPlatforms,
    });

    factory GameRawgResponse.fromJson(Map<String, dynamic> json) => GameRawgResponse(
        count: json["count"],
        next: json["next"],
        results: List<GameGameRAWG>.from(json["results"].map((x) => GameGameRAWG.fromJson(x))),
        userPlatforms: json["user_platforms"],
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "user_platforms": userPlatforms,
    };
}

