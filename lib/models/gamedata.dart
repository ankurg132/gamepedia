class GameData {
  late int? id;
  late String? title;
  late String? thumbnail;
  late String? shortDescription;
  late String? gameUrl;
  late String? genre;
  late String? platform;
  late String? publisher;
  late String? developer;
  late String? releaseDate;
  late String? freetogameProfileUrl;

  GameData(
      {this.id,
      this.title,
      this.thumbnail,
      this.shortDescription,
      this.gameUrl,
      this.genre,
      this.platform,
      this.publisher,
      this.developer,
      this.releaseDate,
      this.freetogameProfileUrl});

  GameData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    thumbnail = json['thumbnail'];
    shortDescription = json['short_description'];
    gameUrl = json['game_url'];
    genre = json['genre'];
    platform = json['platform'];
    publisher = json['publisher'];
    developer = json['developer'];
    releaseDate = json['release_date'];
    freetogameProfileUrl = json['freetogame_profile_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['thumbnail'] = this.thumbnail;
    data['short_description'] = this.shortDescription;
    data['game_url'] = this.gameUrl;
    data['genre'] = this.genre;
    data['platform'] = this.platform;
    data['publisher'] = this.publisher;
    data['developer'] = this.developer;
    data['release_date'] = this.releaseDate;
    data['freetogame_profile_url'] = this.freetogameProfileUrl;
    return data;
  }
}
