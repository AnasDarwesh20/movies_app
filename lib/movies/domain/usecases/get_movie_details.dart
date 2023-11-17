import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie/core/error/failure.dart';
import 'package:movie/core/usecases/base_usecases.dart';
import 'package:movie/movies/domain/entity/movie_details.dart';
import 'package:movie/movies/domain/repository/base_movies_repository.dart';

class GetMovieDetailsUseCase extends BaseUseCases<MovieDetails, MovieDetailsParameters> {
  final BaseMoviesRepository baseMoviesRepository;

  GetMovieDetailsUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, MovieDetails>> call(MovieDetailsParameters parameters) async {
    return await baseMoviesRepository.getMovieDetails(parameters);
  }
}

class MovieDetailsParameters extends Equatable {
  final int movieId;

  const MovieDetailsParameters({
    required this.movieId,
  });

  @override
  List<Object?> get props => [
    movieId
  ];
}
