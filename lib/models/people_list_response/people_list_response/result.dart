import 'known_for.dart';

class Person {
	bool? adult;
	int? gender;
	int? id;
	String? knownForDepartment;
	String? name;
	String? originalName;
	double? popularity;
	String? profilePath;
	List<KnownFor>? knownFor;

	Person({
		this.adult, 
		this.gender, 
		this.id, 
		this.knownForDepartment, 
		this.name, 
		this.originalName, 
		this.popularity, 
		this.profilePath, 
		this.knownFor, 
	});

	factory Person.fromJson(Map<String, dynamic> json) => Person(
				adult: json['adult'] as bool?,
				gender: json['gender'] as int?,
				id: json['id'] as int?,
				knownForDepartment: json['known_for_department'] as String?,
				name: json['name'] as String?,
				originalName: json['original_name'] as String?,
				popularity: (json['popularity'] as num?)?.toDouble(),
				profilePath: json['profile_path'] as String?,
				knownFor: (json['known_for'] as List<dynamic>?)
						?.map((e) => KnownFor.fromJson(e as Map<String, dynamic>))
						.toList(),
			);

	Map<String, dynamic> toJson() => {
				'adult': adult,
				'gender': gender,
				'id': id,
				'known_for_department': knownForDepartment,
				'name': name,
				'original_name': originalName,
				'popularity': popularity,
				'profile_path': profilePath,
				'known_for': knownFor?.map((e) => e.toJson()).toList(),
			};
}
