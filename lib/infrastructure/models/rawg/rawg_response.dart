
import 'game_rawg.dart';

class GameRawgResponse {
    final int count;
    final String next;
    final String previous;
    final List<GameRawg> results;

    GameRawgResponse({
        required this.count,
        required this.next,
        required this.previous,
        required this.results,
    });

    factory GameRawgResponse.fromJson(Map<String, dynamic> json) => GameRawgResponse(
        count: json["count"],
        next: json["next"],
        previous:  json["previous"] ?? '',
        results: List<GameRawg>.from(json["results"].map((x) => GameRawg.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous":previous == '' ? '' : previous,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
    };
}
