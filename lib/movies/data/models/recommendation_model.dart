import 'package:movie/movies/domain/entity/recommendation.dart';

class RecommendationModel extends Recommendation {
  const RecommendationModel({
    super.backdropPath,
    required super.movieId,
  });

  factory RecommendationModel.fromJson(Map<String, dynamic> json) =>
      RecommendationModel(
        backdropPath: json['backdrop_path'] ?? 'https://img.freepik.com/free-icon/image_318-149882.jpg?t=st=1692302977~exp=1692303577~hmac=f2ac00cc53ad8161163be2ef92f9919be8e31e4ffe9ccfc3c294f4d79ac4168c',
        movieId:json['id'],
      );
}
