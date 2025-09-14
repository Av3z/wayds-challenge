import 'package:equatable/equatable.dart';

class Character extends Equatable {
  final int id;
  final String name;
  final String status;
  final String species;
  final String gender;
  final String type;
  final String image;

  const Character({required this.id, required this.name, required this.status, required this.species, required this.gender, required this.type, required this.image});

  Character copyWith({int? id, String? name, String? status, String? species, String? gender, String? type, String? image}) {
    return Character(
      id: id ?? this.id,
      name: name ?? this.name,
      status: status ?? this.status,
      species: species ?? this.species,
      gender: gender ?? this.gender,
      type: type ?? this.type,
      image: image ?? this.image,
    );
  }

  factory Character.fromMap(Map<String, dynamic> map) {
    return Character(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      status: map['status'] ?? '',
      species: map['species'] ?? '',
      gender: map['gender'] ?? '',
      type: map['type'] ?? '',
      image: map['image'] ?? '',
    );
  }

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      id: json['id']?.toInt() ?? 0,
      name: json['name'] ?? '',
      status: json['status'] ?? '',
      species: json['species'] ?? '',
      gender: json['gender'] ?? '',
      type: json['type'] ?? '',
      image: json['image'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'status': status, 'species': species, 'gender': gender, 'type': type, 'image': image};
  }

  @override
  List<Object?> get props => [id, name, status, species, gender, type, image];
}
