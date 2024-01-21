import 'package:flutter/material.dart';
import '../data.dart';

class HomePage extends StatefulWidget {
  // @override
  // State<StatefulWidget> createState() {
  //   return _HomePageState();
  // }
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _deviceHeight;
  var _deviceWidth;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(children: <Widget>[
        _featuredGamesWidget(),
      ]),
    );
  }

  Widget _featuredGamesWidget() {
    return SizedBox(
      height: _deviceHeight * 0.50,
      width: _deviceWidth,
      child: PageView(
        scrollDirection: Axis.horizontal,
        children: featuredGames.map((game) {
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  game.coverImage.url,
                ),
              ),
            ),
          );
        },
        ).toList(),
      ),
    );
  }
}
