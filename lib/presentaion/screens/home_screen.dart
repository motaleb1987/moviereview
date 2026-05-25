import 'package:flutter/material.dart';
import 'package:moviereview/core/app_colors.dart';
import 'package:provider/provider.dart';
import '../provider/movie_provider.dart';
import '../widget/movie_card.dart';
import '../widget/movie_details.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => Provider.of<MovieProvider>(
        context,
        listen: false,
      ).fetchTrendingMovies(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text(
          'Home',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Consumer<MovieProvider>(
        builder: (context, movieProvider, child) {
          if (movieProvider.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );

          }
          return ListView.builder(
            itemCount: movieProvider.trendingMovies.length,
            itemBuilder: (context, index) {
              return MovieCard(
                movie: movieProvider.trendingMovies[index],
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MovieDetails(
                        movie: movieProvider.trendingMovies[index],
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
