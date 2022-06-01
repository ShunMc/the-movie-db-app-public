import 'package:flutter/material.dart';
import 'package:the_movie_db_app/data/model/movie_details.dart';
import 'package:the_movie_db_app/ui/components/movie_detail_view.dart';

class MovieDetailsPage extends StatelessWidget {
  const MovieDetailsPage({Key? key, required this.details}) : super(key: key);

  final MovieDetails details;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: SafeArea(child: MovieDetailView(details)),
      ),
    );
  }
}
