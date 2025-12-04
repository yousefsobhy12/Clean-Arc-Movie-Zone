import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_zone/common/widgets/movie/movie_card.dart';
import 'package:movie_zone/common/widgets/tv/tv_card.dart';
import 'package:movie_zone/presentation/search/cubits/search/search_cubit.dart';

class SearchContent extends StatelessWidget {
  const SearchContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is MoviesLoaded) {
          if (state.movies.isEmpty) {
            return const Center(child: Text('No movies found'));
          }
          return GridView.builder(
            shrinkWrap: true,
            itemCount: state.movies.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.6,
            ),
            itemBuilder: (context, index) {
              return MovieCard(movieEntity: state.movies[index]);
            },
          );
        }
        if (state is TVShowsLoaded) {
          if (state.tvShows.isEmpty) {
            return const Center(child: Text('No TV shows found'));
          }
          return GridView.builder(
            shrinkWrap: true,
            itemCount: state.tvShows.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.6,
            ),
            itemBuilder: (context, index) {
              return TvCard(tvEntity: state.tvShows[index]);
            },
          );
        }
        if (state is SearchFailure) {
          return Center(child: Text(state.errorMessage));
        }
        return const Center(child: Text('Search for movies or TV shows'));
      },
    );
  }
}
