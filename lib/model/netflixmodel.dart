class Netflixmodel {
  String? backdroppath;
  int? id;
  String? title;
  String? orginaltitle;
  String? overview;
  String? posterpath;
  String? mediatype;
  bool? adult;
  String? orginallanguage;
  double? popularity;
  String? releaseDate;
  bool? video;
  double? voteaverage;
  int? votecount;

  Netflixmodel(
      {required this.backdroppath,
      required this.id,
      required this.title,
      required this.orginaltitle,
      required this.overview,
      required this.posterpath,
      required this.mediatype,
      required this.adult,
      required this.orginallanguage,
      required this.popularity,
      required this.releaseDate,
      required this.video,
      required this.voteaverage,
      required this.votecount});

  factory Netflixmodel.fromJson(Map<String, dynamic> json) {
    return Netflixmodel(
        backdroppath: json["backdrop_path"],
        id: json['id'],
        title: json['title'],
        orginaltitle: json['original_title'],
        overview: json['overview'],
        posterpath: json['poster_path'],
        mediatype: json['media_type'],
        adult: json['adult'],
        orginallanguage: json['original_language'],
        popularity: json['popularity'],
        releaseDate: json['release_date'],
        video: json['video'],
        voteaverage: json['vote_average'],
        votecount: json['vote_count']);
  }
}
