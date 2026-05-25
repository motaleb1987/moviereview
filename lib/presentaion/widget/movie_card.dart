import 'package:flutter/material.dart';
import 'package:moviereview/domain/entities/movie.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    super.key, required this.movie, required this.onTap,
  });

  final Movie movie;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 200,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Container(
                height: 200,
                width: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: NetworkImage(
                      'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
      
              SizedBox(width: 16),
              Expanded(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movie.title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                       movie.releaseDate,
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: .w600,
                          fontSize: 16,
                        ),
                      )
      
                    ]
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}