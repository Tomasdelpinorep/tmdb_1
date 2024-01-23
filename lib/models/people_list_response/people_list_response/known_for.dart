class KnownFor {
	bool? adult;
	String? backdropPath;
	int? id;
	String? name;
	String? originalLanguage;
	String? originalName;
	String? overview;
	String? posterPath;
	String? mediaType;
	List<dynamic>? genreIds;
	double? popularity;
	String? firstAirDate;
	double? voteAverage;
	int? voteCount;
	List<dynamic>? originCountry;

	KnownFor({
		this.adult, 
		this.backdropPath, 
		this.id, 
		this.name, 
		this.originalLanguage, 
		this.originalName, 
		this.overview, 
		this.posterPath, 
		this.mediaType, 
		this.genreIds, 
		this.popularity, 
		this.firstAirDate, 
		this.voteAverage, 
		this.voteCount, 
		this.originCountry, 
	});

	factory KnownFor.fromJson(Map<String, dynamic> json) => KnownFor(
				adult: json['adult'] as bool?,
				backdropPath: json['backdrop_path'] as String?,
				id: json['id'] as int?,
				name: json['name'] as String?,
				originalLanguage: json['original_language'] as String?,
				originalName: json['original_name'] as String?,
				overview: json['overview'] as String?,
				posterPath: json['poster_path'] as String?,
				mediaType: json['media_type'] as String?,
				genreIds: json['genre_ids'] as List<dynamic>?,
				popularity: (json['popularity'] as num?)?.toDouble(),
				firstAirDate: json['first_air_date'] as String?,
				voteAverage: json['vote_average'] as double?,
				voteCount: json['vote_count'] as int?,
				originCountry: json['origin_country'] as List<dynamic>?,
			);

	Map<String, dynamic> toJson() => {
				'adult': adult,
				'backdrop_path': backdropPath,
				'id': id,
				'name': name,
				'original_language': originalLanguage,
				'original_name': originalName,
				'overview': overview,
				'poster_path': posterPath,
				'media_type': mediaType,
				'genre_ids': genreIds,
				'popularity': popularity,
				'first_air_date': firstAirDate,
				'vote_average': voteAverage,
				'vote_count': voteCount,
				'origin_country': originCountry,
			};
}
