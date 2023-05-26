import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movieticketbookingapp/constants.dart';
import 'package:movieticketbookingapp/screens/home/components/body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(),
      body: Body(),
    );
  }

  AppBar appBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset('assets/icons/menu.svg'),
        padding: const EdgeInsets.only(left: kDefaultPadding),
        onPressed: () {},
      ),
      actions: <Widget>[
        IconButton(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            onPressed: () {},
            icon: SvgPicture.asset('assets/icons/search.svg'))
      ],
    );
  }
}
