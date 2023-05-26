import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movieticketbookingapp/constants.dart';

import 'catagories.dart';
import 'genres.dart';
import 'movies.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Categorylist(),
        const Genres(),
        MovieCarousel(),
      ],
    );
  }
}
