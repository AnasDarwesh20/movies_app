import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/network/api_constants.dart';
import 'package:movie/core/utils/enums.dart';
import 'package:movie/movies/presentation/controllers/movies_bloc/movies_bloc.dart';
import 'package:movie/movies/presentation/controllers/movies_bloc/movies_states.dart';
import 'package:movie/movies/presentation/screens/movie_detail_screen.dart';
import 'package:shimmer/shimmer.dart';

class PopularComponent extends StatelessWidget {
  const PopularComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc , MoviesStates>(
        buildWhen: (previous , current) => previous.popularStates != current.popularStates  ,
        builder: (context , state)
        {
          print('popular component build') ;
          switch(state.popularStates)
        {
          case RequestState.loading :
            print('loading');
            return SizedBox(
                height: 400, child: Center(child: CircularProgressIndicator()));
          case RequestState.loaded :
            return FadeIn(
            duration: const Duration(milliseconds: 500),
            child: SizedBox(
              height: 170.0,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                itemCount: state.popularMovies.length,
                itemBuilder: (context, index) {
                  final movie = state.popularMovies[index];
                  return Container(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => MovieDetailScreen(id: state.popularMovies[index].id))) ;
                      },
                      child: ClipRRect(
                        borderRadius:
                        const BorderRadius.all(Radius.circular(8.0)),
                        child: CachedNetworkImage(
                          width: 120.0,
                          fit: BoxFit.cover,
                          imageUrl:
                          ApiConstance.imageUrl(movie.backdropPath!),
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
                  );
                },
              ),
            ),
          ) ;
          case RequestState.error :
            return SizedBox(
                height: 400,
                child: Center(child: Text(state.popularMessage)));
        }
      },
    );
  }
}
