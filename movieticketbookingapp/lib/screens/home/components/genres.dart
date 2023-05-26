import 'package:flutter/material.dart';

import '../../../components/genre_card.dart';
import '../../../constants.dart';

class Genres extends StatelessWidget {
  const Genres({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> genres = [
      'Action',
      'Crime',
      'Comedy',
      'Drama',
      'Horror',
      'Animation'
    ];
    return Container(
      height: 36,
      margin: const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: genres.length,
          itemBuilder: (context, index) => GenreCard(
                genre: genres[index],
              )),
    );
  }
}
