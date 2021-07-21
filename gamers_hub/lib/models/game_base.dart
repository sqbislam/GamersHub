import 'dart:convert';
import 'package:collection/collection.dart';

class GameBase {
  final String name;
  final ImageHolder image;
  final List<String> platform;
  final List<String> genres;
  final List<String> modes;
  final String publisher;
  final String developer;
  GameBase({
    required this.name,
    required this.image,
    required this.platform,
    required this.genres,
    required this.modes,
    required this.publisher,
    required this.developer,
  });

  GameBase copyWith({
    String? name,
    ImageHolder? image,
    List<String>? platform,
    List<String>? genres,
    List<String>? modes,
    String? publisher,
    String? developer,
  }) {
    return GameBase(
      name: name ?? this.name,
      image: image ?? this.image,
      platform: platform ?? this.platform,
      genres: genres ?? this.genres,
      modes: modes ?? this.modes,
      publisher: publisher ?? this.publisher,
      developer: developer ?? this.developer,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'image': image.toMap(),
      'platform': platform,
      'genres': genres,
      'modes': modes,
      'publisher': publisher,
      'developer': developer,
    };
  }

  factory GameBase.fromMap(Map<String, dynamic> map) {
    return GameBase(
      name: map['name'],
      image: ImageHolder.fromMap(map['image']),
      platform: List<String>.from(map['platform']),
      genres: List<String>.from(map['genres']),
      modes: List<String>.from(map['modes']),
      publisher: map['publisher'],
      developer: map['developer'],
    );
  }

  String toJson() => json.encode(toMap());

  factory GameBase.fromJson(String source) =>
      GameBase.fromMap(json.decode(source));

  @override
  String toString() {
    return 'GameBase(name: $name, image: $image, platform: $platform, genres: $genres, modes: $modes, publisher: $publisher, developer: $developer)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is GameBase &&
        other.name == name &&
        other.image == image &&
        listEquals(other.platform, platform) &&
        listEquals(other.genres, genres) &&
        listEquals(other.modes, modes) &&
        other.publisher == publisher &&
        other.developer == developer;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        image.hashCode ^
        platform.hashCode ^
        genres.hashCode ^
        modes.hashCode ^
        publisher.hashCode ^
        developer.hashCode;
  }
}

class ImageHolder {
  final String banner;
  final String logo;
  ImageHolder({
    required this.banner,
    required this.logo,
  });

  ImageHolder copyWith({
    String? banner,
    String? logo,
  }) {
    return ImageHolder(
      banner: banner ?? this.banner,
      logo: logo ?? this.logo,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'banner': banner,
      'logo': logo,
    };
  }

  factory ImageHolder.fromMap(Map<String, dynamic> map) {
    return ImageHolder(
      banner: map['banner'],
      logo: map['logo'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ImageHolder.fromJson(String source) =>
      ImageHolder.fromMap(json.decode(source));

  @override
  String toString() => 'Image(banner: $banner, logo: $logo)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ImageHolder && other.banner == banner && other.logo == logo;
  }

  @override
  int get hashCode => banner.hashCode ^ logo.hashCode;
}

List<GameBase> game_base_list = [
  GameBase(
      name: "Apex Legends",
      image: ImageHolder(
          banner: "assets/images/apex-legends.jpg",
          logo: "assets/images/apex-legends-logo.jpg"),
      platform: ["PC", "PS4", "Xbox", "Android", "IOS", "Nintendo"],
      modes: ["Multiplayer"],
      genres: ["Battle royale", "First-person shooter"],
      publisher: "Electronics Arts",
      developer: "Respawn Entertainment"),
  GameBase(
      name: "Valorant",
      image: ImageHolder(
          banner: "assets/images/valorant.jpg",
          logo: "assets/images/valorant-logo.jpg"),
      platform: ["PC"],
      genres: ["First Person Shooter"],
      modes: ["Multiplayer"],
      publisher: "Riot Games",
      developer: "Riot Games"),
  GameBase(
      name: "PlayerUnknown's Battlegrounds (PUBG)",
      image: ImageHolder(
          banner: "assets/images/pubg.jpg",
          logo: "assets/images/pubg-logo.jpg"),
      platform: ["PC", "Android", "iOS", "Xbox One", "PlayStation 4"],
      genres: ["Third Person Shooter", "Battle royale"],
      modes: ["Multiplayer"],
      publisher: "PUBG Corporation",
      developer: "PUBG Corporation"),
  GameBase(
      name: "Fortnite",
      image: ImageHolder(
          banner: "assets/images/fortnite.jpg",
          logo: "assets/images/fortnite-logo.jpg"),
      platform: [
        "PC",
        "Android",
        "iOS",
        "Xbox One",
        "PlayStation 4",
        "PlayStation 5"
      ],
      genres: ["Third Person Shooter", "Battle royale", "Sandbox"],
      modes: ["Multiplayer"],
      publisher: "Epic Games",
      developer: "Epic Games"),
  GameBase(
      name: "Fifa 20",
      image: ImageHolder(
          banner: "assets/images/fifa20.png",
          logo: "assets/images/fifa20-logo.png"),
      platform: ["PC", "Xbox One", "PlayStation 4", "Nintendo Switch"],
      genres: ["Sports", "Online gambling"],
      modes: ["Multiplayer", "Singleplayer"],
      publisher: "EA Sports",
      developer: "Electronic Arts"),
  GameBase(
      name: "Apex Legends",
      image: ImageHolder(
          banner: "assets/images/apex-legends.jpg",
          logo: "assets/images/apex-legends-logo.jpg"),
      platform: ["PC", "PS4", "Xbox", "Android", "IOS", "Nintendo"],
      modes: ["Multiplayer"],
      genres: ["Battle royale", "First-person shooter"],
      publisher: "Electronics Arts",
      developer: "Respawn Entertainment"),
  GameBase(
      name: "Valorant",
      image: ImageHolder(
          banner: "assets/images/valorant.jpg",
          logo: "assets/images/valorant-logo.jpg"),
      platform: ["PC"],
      genres: ["First Person Shooter"],
      modes: ["Multiplayer"],
      publisher: "Riot Games",
      developer: "Riot Games"),
  GameBase(
      name: "PlayerUnknown's Battlegrounds (PUBG)",
      image: ImageHolder(
          banner: "assets/images/pubg.jpg",
          logo: "assets/images/pubg-logo.jpg"),
      platform: ["PC", "Android", "iOS", "Xbox One", "PlayStation 4"],
      genres: ["Third Person Shooter", "Battle royale"],
      modes: ["Multiplayer"],
      publisher: "PUBG Corporation",
      developer: "PUBG Corporation"),
  GameBase(
      name: "Fortnite",
      image: ImageHolder(
          banner: "assets/images/fortnite.jpg",
          logo: "assets/images/fortnite-logo.jpg"),
      platform: [
        "PC",
        "Android",
        "iOS",
        "Xbox One",
        "PlayStation 4",
        "PlayStation 5"
      ],
      genres: ["Third Person Shooter", "Battle royale", "Sandbox"],
      modes: ["Multiplayer"],
      publisher: "Epic Games",
      developer: "Epic Games"),
  GameBase(
      name: "Fifa 20",
      image: ImageHolder(
          banner: "assets/images/fifa20.png",
          logo: "assets/images/fifa20-logo.png"),
      platform: ["PC", "Xbox One", "PlayStation 4", "Nintendo Switch"],
      genres: ["Sports", "Online gambling"],
      modes: ["Multiplayer", "Singleplayer"],
      publisher: "EA Sports",
      developer: "Electronic Arts"),
];
