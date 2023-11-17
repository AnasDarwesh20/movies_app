import 'package:dartz/dartz.dart';
import 'package:movie/movies/domain/entity/movie_details.dart';
import 'package:movie/movies/domain/entity/recommendation.dart';
import 'package:movie/movies/domain/usecases/get_movie_details.dart';
import 'package:movie/movies/domain/usecases/get_recommendation_use_case.dart';
import '../../../core/error/failure.dart';
import '../entity/movie.dart';

abstract class BaseMoviesRepository
{
  Future< Either< Failure , List<Movie>>>  getNowPlayingMovies() ;
  Future< Either< Failure , List<Movie>>>  getPopularMovies() ;
  Future< Either< Failure , List<Movie>>>  getTopRatedMovies() ;
  Future<Either< Failure , MovieDetails>> getMovieDetails(MovieDetailsParameters parameters) ;
  Future<Either< Failure , List<Recommendation>>> getRecommendation(RecommendationParameters parameters) ;
}