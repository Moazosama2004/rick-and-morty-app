import 'location.dart';
import 'origin.dart';

class CharacterModel {
	int? id;
	String? name;
	String? status;
	String? species;
	String? type;
	String? gender;
	Origin? origin;
	Location? location;
	String? image;
	String? url;
	DateTime? created;

	CharacterModel({
		this.id, 
		this.name, 
		this.status, 
		this.species, 
		this.type, 
		this.gender, 
		this.origin, 
		this.location, 
		this.image, 
		this.url, 
		this.created, 
	});

	factory CharacterModel.fromJson(Map<String, dynamic> json) => CharacterModel(
				id: json['id'] as int?,
				name: json['name'] as String?,
				status: json['status'] as String?,
				species: json['species'] as String?,
				type: json['type'] as String?,
				gender: json['gender'] as String?,
				origin: json['origin'] == null
						? null
						: Origin.fromJson(json['origin'] as Map<String, dynamic>),
				location: json['location'] == null
						? null
						: Location.fromJson(json['location'] as Map<String, dynamic>),
				image: json['image'] as String?,
				url: json['url'] as String?,
				created: json['created'] == null
						? null
						: DateTime.parse(json['created'] as String),
			);
}
