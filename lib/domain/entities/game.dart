
class Game {
    final int id;
    final String name;
    final String nameOriginal;
    final String description;
    final int metacritic;
    final DateTime released;
    final bool tba;
    final DateTime updated;
    final String backgroundImage;
    final String backgroundImageAdditional;
    final double rating;
    final int ratingTop;
    final int added;
    final AddedByStatus addedByStatus;
    final int playtime;
    final int screenshotsCount;
    final int moviesCount;
    final int creatorsCount;
    final int achievementsCount;
    final int parentAchievementsCount;
    final int twitchCount;
    final int youtubeCount;
    final int reviewsTextCount;
    final int ratingsCount;
    final int suggestionsCount;
    final List<String> alternativeNames;
    final String metacriticUrl;
    final int parentsCount;
    final int additionsCount;
    final int gameSeriesCount;
    final int reviewsCount;
    final List<ParentPlatform> parentPlatforms;
    final List<PlatformElement> platforms;
    final List<Store> stores;
    final List<Developer> developers;
    final List<Developer> genres;
    final List<Developer> tags;
    final List<Developer> publishers;
    final EsrbRating esrbRating;
    final dynamic clip;
    final String descriptionRaw;

    Game({
        required this.id,
        required this.name,
        required this.nameOriginal,
        required this.description,
        required this.metacritic,
        required this.released,
        required this.tba,
        required this.updated,
        required this.backgroundImage,
        required this.backgroundImageAdditional,
        required this.rating,
        required this.ratingTop,
        required this.added,
        required this.addedByStatus,
        required this.playtime,
        required this.screenshotsCount,
        required this.moviesCount,
        required this.creatorsCount,
        required this.achievementsCount,
        required this.parentAchievementsCount,
        required this.twitchCount,
        required this.youtubeCount,
        required this.reviewsTextCount,
        required this.ratingsCount,
        required this.suggestionsCount,
        required this.alternativeNames,
        required this.metacriticUrl,
        required this.parentsCount,
        required this.additionsCount,
        required this.gameSeriesCount,
        required this.reviewsCount,
        required this.parentPlatforms,
        required this.platforms,
        required this.stores,
        required this.developers,
        required this.genres,
        required this.tags,
        required this.publishers,
        required this.esrbRating,
        required this.clip,
        required this.descriptionRaw,
    });

    
}

class AddedByStatus {
    final int yet;
    final int owned;
    final int beaten;
    final int toplay;
    final int dropped;
    final int playing;

    AddedByStatus({
        required this.yet,
        required this.owned,
        required this.beaten,
        required this.toplay,
        required this.dropped,
        required this.playing,
    });

}

class Developer {
    final int id;
    final String name;
    final int gamesCount;
    final String imageBackground;
    final String domain;
    final String language;

    Developer({
        required this.id,
        required this.name,
        required this.gamesCount,
        required this.imageBackground,
        required this.domain,
        required this.language,
    });

}


class EsrbRating {
    final int id;
    final String name;

    EsrbRating({
        required this.id,
        required this.name,
    });

}

class ParentPlatform {
    final EsrbRating platform;

    ParentPlatform({
        required this.platform,
    });
}

class PlatformElement {
    final PlatformPlatform platform;
    final DateTime releasedAt;
    final Requirements requirements;

    PlatformElement({
        required this.platform,
        required this.releasedAt,
        required this.requirements,
    });
}
class Requirements {
    final String minimum;
    final String recommended;

    Requirements({
        required this.minimum,
        required this.recommended,
    });
}

class PlatformPlatform {
    final int id;
    final String name;
    final dynamic image;
    final dynamic yearEnd;
    final int yearStart;
    final int gamesCount;
    final String imageBackground;

    PlatformPlatform({
        required this.id,
        required this.name,
        required this.image,
        required this.yearEnd,
        required this.yearStart,
        required this.gamesCount,
        required this.imageBackground,
    });
}

class Store {
    final int id;
    final String url;
    final Developer store;

    Store({
        required this.id,
        required this.url,
        required this.store,
    });

}

