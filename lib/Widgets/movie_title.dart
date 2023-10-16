import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:movie/models/movie.dart';

class MovieTitle extends StatelessWidget {
  final GetIt _getIt = GetIt.instance;

  final double? height;
  final double? width;
  final Movie? movie;

  MovieTitle({this.movie, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _moviePosterWidget(movie!.posterUrl()),
          _movieInfoWidget(),
        ],
      ),
    );
  }

  Widget _movieInfoWidget() {
    return SizedBox(
      height: height,
      width: width! * 0.67,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: width! * 0.50,
                child: Text(
                  movie!.name!,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Color.fromARGB(255, 224, 240, 2),
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              ),
              Text(
                movie!.rating.toString(),
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontStyle: FontStyle.normal,
                  color: Color.fromARGB(255, 202, 8, 8),
                  fontSize: 22,
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, height! * 0.02, 0, 0),
            child: Text(
              '${movie!.language!.toUpperCase()} | R: ${movie!.isAdult} | ${movie!.releaseDate}',
              style: const TextStyle(color: Colors.white, fontSize: 10),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, height! * 0.07, 0, 0),
            child: Text(
              movie!.description!,
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: Colors.white70, fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }

  // ignore: no_leading_underscores_for_local_identifiers
  Widget _moviePosterWidget(String _imageURL) {
    return Container(
      height: height,
      width: width! * 0.35,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(_imageURL),
        ),
      ),
    );
  }
}
