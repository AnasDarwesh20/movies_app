import 'package:dio/dio.dart';
import 'package:movie/core/error/exceptions.dart';
import 'package:movie/core/network/api_constants.dart';
import 'package:movie/core/network/error_message_model.dart';
import 'package:movie/movies/data/models/movie_details_model.dart';
import 'package:movie/movies/data/models/recommendation_model.dart';
import 'package:movie/movies/domain/usecases/get_movie_details.dart';
import 'package:movie/movies/domain/usecases/get_recommendation_use_case.dart';
import '../models/movie_model.dart';

abstract class BaseMovieRemoteDatasource {
  Future<List<MovieModel>> getNowPlayingMovies();

  Future<List<MovieModel>> getPopularMovies();

  Future<List<MovieModel>> getTopRatedMovies();

  Future<MovieDetailsModel> getMovieDetails(MovieDetailsParameters parameters);
  
  Future<List<RecommendationModel>> getRecommendation(RecommendationParameters parameters);
}

class MovieRemoteDataSource extends BaseMovieRemoteDatasource {
  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await Dio().get(ApiConstance.nowPlayingMoviesPath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data["results"] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await Dio().get(ApiConstance.popularMoviePath);

    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data["results"] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final response = await Dio().get(ApiConstance.topRatedPath);

    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data["results"] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(MovieDetailsParameters parameters) async
  {
    final response = await Dio().get(ApiConstance.movieDetailsPath(parameters.movieId)) ;

    if(response.statusCode == 200){
      return MovieDetailsModel.fromJson(response.data) ;
    } else
    {
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data)) ;
    }
  }

  @override
  Future<List<RecommendationModel>> getRecommendation(RecommendationParameters parameters) async
  {

    final response = await Dio().get(ApiConstance.recommendationPath(parameters.movieId));

    if (response.statusCode == 200) {
      return await List<RecommendationModel>.from((response.data["results"] as List)
          .map((e) => RecommendationModel.fromJson(e)));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
