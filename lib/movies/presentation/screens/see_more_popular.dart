import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie/core/network/api_constants.dart';
import 'package:movie/core/serveices/servecies_locator.dart';
import 'package:movie/core/style/app_colors.dart';
import 'package:movie/core/utils/components.dart';
import 'package:movie/movies/presentation/controllers/movies_bloc/movies_bloc.dart';
import 'package:movie/movies/presentation/controllers/movies_bloc/movies_states.dart';
import 'package:movie/movies/presentation/controllers/popular_movies_bloc/popular_movies_bloc.dart';
import 'package:shimmer/shimmer.dart';

class SeeMorePopular extends StatelessWidget {
  const SeeMorePopular({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          PopularMoviesBloc(servicesLocator())..add(GetPopularMoviesEvent()),
      child: Scaffold(
        appBar: AppComponents.defaultAppBar(
          context: context,
          backgroundColor: Colors.black,
          title: Text(
            'Popular Movies',
            style: GoogleFonts.poppins(
              fontSize: 19,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.15,
              color: Colors.white,
            ),
          ),
          titleSpacing: 200,
        ),
        body: const PopularMovies(),
      ),
    );
  }
}

class PopularMovies extends StatelessWidget {
  const PopularMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularMoviesBloc, PopularMoviesState>(
      builder: (context, state) {
        return ListView.builder(
          itemBuilder: (context , index) => popularMoviesItem(index),
          itemCount: 2,
        );
      },
    );
  }

  Widget popularMoviesItem(index) =>
      BlocBuilder<PopularMoviesBloc, PopularMoviesState>(
        builder: (context, state) {
          return Container(
            color: AppColors.primaryColor,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: InkWell(
                        onTap: () {
                          /// ToDo : navigate to movie details
                        },
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8.0)),
                          child: CachedNetworkImage(
                            width: 120.0,
                            fit: BoxFit.cover,
                            imageUrl: ApiConstance.imageUrl(
                                state.morePopularMovies[index].backdropPath),
                            placeholder: (context, url) => Shimmer.fromColors(
                              baseColor: Colors.grey[850]!,
                              highlightColor: Colors.grey[800]!,
                              child: Container(
                                height: 170.0,
                                width: 120.0,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Demon Slayer',
                        maxLines: 2,
                        style: GoogleFonts.poppins(
                          fontSize: 19,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.15,
                          color: Colors.white,
                          height: 1.8,
                        ).copyWith(
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 2.0,
                              horizontal: 8.0,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.red.shade400,
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            child: const Text(
                              '2020',

                              ///state.movieDetails!.releaseDate.split('-')[0],
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Row(
                            children: const [
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 20.0,
                              ),
                              SizedBox(width: 4.0),
                              Text(
                                '4.2',

                                ///(state.movieDetails!.voteAverage / 2).toStringAsFixed(1),
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 1.2,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        'rghwerughweruighwoeriughwerughweirughweorughwerughweriughwsdsdfsdfsdfsdfsd',
                        maxLines: 2,
                        style: GoogleFonts.poppins(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.15,
                          color: Colors.white,
                          height: 1.8,
                        ).copyWith(
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      );
}
