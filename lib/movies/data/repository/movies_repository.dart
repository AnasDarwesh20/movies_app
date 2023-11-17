import 'package:dartz/dartz.dart';
import 'package:movie/core/error/exceptions.dart';
import 'package:movie/core/error/failure.dart';
import 'package:movie/movies/domain/entity/movie.dart';
import 'package:movie/movies/domain/entity/movie_details.dart';
import 'package:movie/movies/domain/entity/recommendation.dart';
import 'package:movie/movies/domain/repository/base_movies_repository.dart';
import 'package:movie/movies/domain/usecases/get_movie_details.dart';
import 'package:movie/movies/domain/usecases/get_recommendation_use_case.dart';
import '../datasource/movie_remote_data_source.dart';

class MoviesRepository extends BaseMoviesRepository
{

  final BaseMovieRemoteDatasource baseMovieRemoteDatasource ;

  MoviesRepository(this.baseMovieRemoteDatasource);


  @override      //fail       //success
  Future< Either< Failure , List<Movie>>> getNowPlayingMovies() async
  {
    final result = await baseMovieRemoteDatasource.getNowPlayingMovies();
    try{
      return Right(result);
    } on ServerException catch(failure) {
      print(failure.errorMessageModel) ;
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async
  {
    final result = await baseMovieRemoteDatasource.getPopularMovies() ;

    try{
      return Right(result);
    } on ServerException catch(failure) {
      print(failure.errorMessageModel) ;
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async
  {
    final result = await baseMovieRemoteDatasource.getTopRatedMovies() ;

    try{
      return Right(result);
    } on ServerException catch(failure) {
      print(failure.errorMessageModel) ;
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MovieDetails>> getMovieDetails(MovieDetailsParameters parameters) async
  {
    final result = await baseMovieRemoteDatasource.getMovieDetails(parameters) ;

    try {
      return Right(result);
    } on ServerException catch(failure) {
      return  Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Recommendation>>> getRecommendation(RecommendationParameters parameters) async
  {
  final result = await baseMovieRemoteDatasource.getRecommendation(parameters) ;

  try {
  return await Right(result);
  } on ServerException catch(failure)
  {
    print(failure.errorMessageModel) ;
    return  Left(ServerFailure(failure.errorMessageModel.statusMessage));
  }
  }


}