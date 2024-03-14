// ignore_for_file: public_member_api_docs, sort_constructors_first
class Movies {
  Movies({
    required this.averageRating,
    required this.backdropPath,
    required this.description,
    required this.id,
    required this.iso_3166_1,
    required this.iso_639_1,
    required this.name,
    required this.page,
    required this.posterPath,
    required this.public,
    required this.listMovies,
    required this.revenue,
    required this.runtime,
    required this.sortBy,
    required this.totalPages,
    required this.totalResults,
  });

  late final int averageRating;
  late final String backdropPath;
  late final String description;
  late final int id;
  late final String iso_3166_1;
  late final String iso_639_1;
  late final String name;
  late final int page;
  late final String posterPath;
  late final bool public;
  late final List<Movie> listMovies;
  late final int revenue;
  late final int runtime;
  late final String sortBy;
  late final int totalPages;
  late final int totalResults;

  Movies.fromJson(Map<String, dynamic> json) {
    averageRating = json['averageRating'] ?? 0;
    backdropPath = json['backdropPath'] ?? "";
    description = json['description'] ?? "";
    id = json['id'] ?? 0;
    iso_3166_1 = json['iso_3166_1'] ?? "";
    iso_639_1 = json['iso_639_1'] ?? "";
    name = json['name'] ?? "";
    page = json['page'] ?? 0;
    posterPath = json['posterPath'] ?? "";
    public = json['public'] ?? false;
    listMovies = (json['results'] != null)
        ? List.from(json['results']).map((e) => Movie.fromJson(e)).toList()
        : [];
    revenue = json['revenue'] ?? 0;
    runtime = json['runtime'] ?? 0;
    sortBy = json['sortBy'] ?? "";
    totalPages = json['totalPages'] ?? 0;
    totalResults = json['totalResults'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data["average_rating"] = averageRating;
    data["backdrop_path"] = backdropPath;
    data["description"] = description;
    data["id"] = id;
    data["iso_3166_1"] = iso_3166_1;
    data["iso_639_1"] = iso_639_1;
    data["name"] = name;
    data["page"] = page;
    data["poster_path"] = posterPath;
    data["public"] = public;
    data['results'] = listMovies.map((e) => e.toJson()).toList();
    data["revenue"] = revenue;
    data["runtime"] = runtime;
    data["sort_by"] = sortBy;
    data["total_pages"] = totalPages;
    data["total_results"] = totalResults;
    return data;
  }

  @override
  String toString() {
    return 'Movies(averageRating: $averageRating, backdropPath: $backdropPath, description: $description, id: $id, iso_3166_1: $iso_3166_1, iso_639_1: $iso_639_1, name: $name, page: $page, posterPath: $posterPath, public: $public, listMovies: $listMovies, revenue: $revenue, runtime: $runtime, sortBy: $sortBy, totalPages: $totalPages, totalResults: $totalResults)';
  }

  @override
  bool operator ==(covariant Movies other) {
    if (identical(this, other)) return true;

    return 
      other.averageRating == averageRating &&
      other.backdropPath == backdropPath &&
      other.description == description &&
      other.id == id &&
      other.iso_3166_1 == iso_3166_1 &&
      other.iso_639_1 == iso_639_1 &&
      other.name == name &&
      other.page == page &&
      other.posterPath == posterPath &&
      other.public == public &&
      other.listMovies == listMovies &&
      other.revenue == revenue &&
      other.runtime == runtime &&
      other.sortBy == sortBy &&
      other.totalPages == totalPages &&
      other.totalResults == totalResults;
  }

  @override
  int get hashCode {
    return averageRating.hashCode ^
      backdropPath.hashCode ^
      description.hashCode ^
      id.hashCode ^
      iso_3166_1.hashCode ^
      iso_639_1.hashCode ^
      name.hashCode ^
      page.hashCode ^
      posterPath.hashCode ^
      public.hashCode ^
      listMovies.hashCode ^
      revenue.hashCode ^
      runtime.hashCode ^
      sortBy.hashCode ^
      totalPages.hashCode ^
      totalResults.hashCode;
  }

  Movies copyWith({
    int? averageRating,
    String? backdropPath,
    String? description,
    int? id,
    String? iso_3166_1,
    String? iso_639_1,
    String? name,
    int? page,
    String? posterPath,
    bool? public,
    List<Movie>? listMovies,
    int? revenue,
    int? runtime,
    String? sortBy,
    int? totalPages,
    int? totalResults,
  }) {
    return Movies(
      averageRating: averageRating ?? this.averageRating,
      backdropPath: backdropPath ?? this.backdropPath,
      description: description ?? this.description,
      id: id ?? this.id,
      iso_3166_1: iso_3166_1 ?? this.iso_3166_1,
      iso_639_1: iso_639_1 ?? this.iso_639_1,
      name: name ?? this.name,
      page: page ?? this.page,
      posterPath: posterPath ?? this.posterPath,
      public: public ?? this.public,
      listMovies: listMovies ?? this.listMovies,
      revenue: revenue ?? this.revenue,
      runtime: runtime ?? this.runtime,
      sortBy: sortBy ?? this.sortBy,
      totalPages: totalPages ?? this.totalPages,
      totalResults: totalResults ?? this.totalResults,
    );
  }
}

class Movie {
  Movie({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.mediaType,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  late final bool adult;
  late final String backdropPath;
  late final List<int> genreIds;
  late final int id;
  late final String mediaType;
  late final String originalLanguage;
  late final String originalTitle;
  late final String overview;
  late final double popularity;
  late final String posterPath;
  late final String releaseDate;
  late final String title;
  late final bool video;
  late final double voteAverage;
  late final int voteCount;

  Movie.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    genreIds = List<int>.from(json['genre_ids']);
    id = json['id'];
    mediaType = json['media_type'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['adult'] = adult;
    data['backdrop_path'] = backdropPath;
    data['genre_ids'] = genreIds;
    data['id'] = id;
    data['media_type'] = mediaType;
    data['original_language'] = originalLanguage;
    data['original_title'] = originalTitle;
    data['overview'] = overview;
    data['popularity'] = popularity;
    data['poster_path'] = posterPath;
    data['release_date'] = releaseDate;
    data['title'] = title;
    data['video'] = video;
    data['vote_average'] = voteAverage;
    data['vote_count'] = voteCount;
    return data;
  }

  @override
  String toString() {
    return 'Movie(adult: $adult, backdropPath: $backdropPath, genreIds: $genreIds, id: $id, mediaType: $mediaType, originalLanguage: $originalLanguage, originalTitle: $originalTitle, overview: $overview, popularity: $popularity, posterPath: $posterPath, releaseDate: $releaseDate, title: $title, video: $video, voteAverage: $voteAverage, voteCount: $voteCount)';
  }

  @override
  bool operator ==(covariant Movie other) {
    if (identical(this, other)) return true;
  
    return 
      other.adult == adult &&
      other.backdropPath == backdropPath &&
      other.genreIds == genreIds &&
      other.id == id &&
      other.mediaType == mediaType &&
      other.originalLanguage == originalLanguage &&
      other.originalTitle == originalTitle &&
      other.overview == overview &&
      other.popularity == popularity &&
      other.posterPath == posterPath &&
      other.releaseDate == releaseDate &&
      other.title == title &&
      other.video == video &&
      other.voteAverage == voteAverage &&
      other.voteCount == voteCount;
  }

  @override
  int get hashCode {
    return adult.hashCode ^
      backdropPath.hashCode ^
      genreIds.hashCode ^
      id.hashCode ^
      mediaType.hashCode ^
      originalLanguage.hashCode ^
      originalTitle.hashCode ^
      overview.hashCode ^
      popularity.hashCode ^
      posterPath.hashCode ^
      releaseDate.hashCode ^
      title.hashCode ^
      video.hashCode ^
      voteAverage.hashCode ^
      voteCount.hashCode;
  }

  Movie copyWith({
    bool? adult,
    String? backdropPath,
    List<int>? genreIds,
    int? id,
    String? mediaType,
    String? originalLanguage,
    String? originalTitle,
    String? overview,
    double? popularity,
    String? posterPath,
    String? releaseDate,
    String? title,
    bool? video,
    double? voteAverage,
    int? voteCount,
  }) {
    return Movie(
      adult: adult ?? this.adult,
      backdropPath: backdropPath ?? this.backdropPath,
      genreIds: genreIds ?? this.genreIds,
      id: id ?? this.id,
      mediaType: mediaType ?? this.mediaType,
      originalLanguage: originalLanguage ?? this.originalLanguage,
      originalTitle: originalTitle ?? this.originalTitle,
      overview: overview ?? this.overview,
      popularity: popularity ?? this.popularity,
      posterPath: posterPath ?? this.posterPath,
      releaseDate: releaseDate ?? this.releaseDate,
      title: title ?? this.title,
      video: video ?? this.video,
      voteAverage: voteAverage ?? this.voteAverage,
      voteCount: voteCount ?? this.voteCount,
    );
  }
}


