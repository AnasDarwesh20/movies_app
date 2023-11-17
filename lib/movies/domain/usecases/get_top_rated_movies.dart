import 'package:dartz/dartz.dart';
import 'package:movie/core/usecases/base_usecases.dart';
import 'package:movie/movies/domain/entity/movie.dart';
import 'package:movie/movies/domain/repository/base_movies_repository.dart';

import '../../../core/error/failure.dart';

class GetTopRatedMoviesUseCase extends BaseUseCases<List<Movie> , NoParameters>
{
  final BaseMoviesRepository baseMoviesRepository;

  GetTopRatedMoviesUseCase(this.baseMoviesRepository);

  @override
  Future< Either< Failure , List<Movie>>>call(NoParameters parameters) async
  {
    return await baseMoviesRepository.getTopRatedMovies() ;
  }
}
