import 'package:get_it/get_it.dart';
import 'package:movie/movies/data/datasource/movie_remote_data_source.dart';
import 'package:movie/movies/data/repository/movies_repository.dart';
import 'package:movie/movies/domain/repository/base_movies_repository.dart';
import 'package:movie/movies/domain/usecases/get_movie_details.dart';
import 'package:movie/movies/domain/usecases/get_now_playing_movies.dart';
import 'package:movie/movies/domain/usecases/get_popular_movies.dart';
import 'package:movie/movies/domain/usecases/get_recommendation_use_case.dart';
import 'package:movie/movies/domain/usecases/get_top_rated_movies.dart';
import 'package:movie/movies/presentation/controllers/movies_bloc/movies_bloc.dart';
import 'package:movie/movies/presentation/controllers/movies_details_bloc/movie_details_bloc.dart';

final servicesLocator = GetIt.instance;

class ServiceLocator {
  void init() {
    ///block
    servicesLocator.registerFactory(() => MoviesBloc(
        servicesLocator(),
        servicesLocator(),
        servicesLocator(),
    )); //قي كل حالة run يتم تكوين object جديد

    servicesLocator.registerFactory(() => MovieDetailsBloc(servicesLocator() , servicesLocator()));

    ///repository
    servicesLocator.registerLazySingleton<BaseMoviesRepository>(() =>MoviesRepository(servicesLocator())); // يكون object في مكان واحد في ال memory

    ///use cases
    servicesLocator.registerLazySingleton(() => GetNowPlayingMoviesUseCase(servicesLocator()));
    servicesLocator.registerLazySingleton(() => GetPopularMoviesUseCase(servicesLocator()));
    servicesLocator.registerLazySingleton(() => GetTopRatedMoviesUseCase(servicesLocator()));
    servicesLocator.registerLazySingleton(() => GetMovieDetailsUseCase(servicesLocator()));
    servicesLocator.registerLazySingleton(() => GetRecommendationUseCase(servicesLocator()));

    ///DATA SOURCE
    servicesLocator.registerLazySingleton<BaseMovieRemoteDatasource>(
        () => MovieRemoteDataSource());
  }
}
