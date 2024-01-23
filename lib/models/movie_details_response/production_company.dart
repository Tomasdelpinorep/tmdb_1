class ProductionCompany {
	int? id;
	dynamic logoPath;
	String? name;
	String? originCountry;

	ProductionCompany({
		this.id, 
		this.logoPath, 
		this.name, 
		this.originCountry, 
	});

	factory ProductionCompany.fromJson(Map<String, dynamic> json) {
		return ProductionCompany(
			id: json['id'] as int?,
			logoPath: json['logo_path'] as dynamic,
			name: json['name'] as String?,
			originCountry: json['origin_country'] as String?,
		);
	}



	Map<String, dynamic> toJson() => {
				'id': id,
				'logo_path': logoPath,
				'name': name,
				'origin_country': originCountry,
			};
}
