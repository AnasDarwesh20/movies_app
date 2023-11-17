import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie/core/error/failure.dart';
import 'package:movie/core/usecases/base_usecases.dart';
import 'package:movie/movies/domain/entity/recommendation.dart';
import 'package:movie/movies/domain/repository/base_movies_repository.dart';

class GetRecommendationUseCase extends BaseUseCases<List<Recommendation> , RecommendationParameters>
{

  final BaseMoviesRepository baseMoviesRepository ;

  GetRecommendationUseCase(this.baseMoviesRepository);
  @override
  Future<Either<Failure, List<Recommendation>>> call(RecommendationParameters parameters) async
  {
    return await baseMoviesRepository.getRecommendation(parameters);
  }

}

class RecommendationParameters extends Equatable
{
  final int movieId ;

  const RecommendationParameters(this.movieId);

  @override
  List<Object?> get props => [
    movieId
  ];


}