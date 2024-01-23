import 'result.dart';

class PeopleListResponse {
	int? page;
	List<Person>? results;
	int? totalPages;
	int? totalResults;

	PeopleListResponse({
		this.page, 
		this.results, 
		this.totalPages, 
		this.totalResults, 
	});

	factory PeopleListResponse.fromJson(Map<String, dynamic> json) {
		return PeopleListResponse(
			page: json['page'] as int?,
			results: (json['results'] as List<dynamic>?)
						?.map((e) => Person.fromJson(e as Map<String, dynamic>))
						.toList(),
			totalPages: json['total_pages'] as int?,
			totalResults: json['total_results'] as int?,
		);
	}



	Map<String, dynamic> toJson() => {
				'page': page,
				'results': results?.map((e) => e.toJson()).toList(),
				'total_pages': totalPages,
				'total_results': totalResults,
			};
}
