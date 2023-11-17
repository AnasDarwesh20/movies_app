import 'package:movie/movies/data/models/genres_model.dart';
import 'package:movie/movies/domain/entity/movie_details.dart';

class MovieDetailsModel extends MovieDetails
{
  const MovieDetailsModel({
    required super.backdropPath,
    required super.genres,
    required super.id,
    required super.overview,
    required super.releaseDate,
    required super.runtime,
    required super.title,
    required super.voteAverage,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailsModel(
      backdropPath: json['backdrop_path'] ??
          "https://commons.wikimedia.org/wiki/File:Image_not_available.png",
      genres: List<GenresModel>.from(
        json['genres'].map((e) => GenresModel.fromJson(e)),
      ),
      id: json['id'],
      overview: json['overview'],
      releaseDate: json['release_date'],
      runtime: json['runtime'],
      title: json['title'],
      voteAverage: json['vote_average'],
    );
  }
}