// ignore_for_file: prefer_const_constructors

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
      body: Stack(
        children: <Widget>[
          _featuredGamesWidget(),
          _gradientBoxWidget(),
          _topLayerWidget(),
        ],
      ),
    );
  }

  Widget _featuredGamesWidget() {
    return SizedBox(
      height: _deviceHeight * 0.50,
      width: _deviceWidth,
      child: PageView(
        scrollDirection: Axis.horizontal,
        children: featuredGames.map(
          (game) {
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

  Widget _gradientBoxWidget() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: _deviceHeight * 0.8,
        width: _deviceWidth,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Color.fromRGBO(35, 45, 59, 1.0), Colors.transparent],
              stops: [0.65, 1.0],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter),
        ),
      ),
    );
  }

  Widget _topLayerWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: _deviceWidth*0.05,vertical: _deviceHeight*0.005),
      child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        _topBarWidget(),
      ],
    ),
    );
  }

  Widget _topBarWidget() {
    return SizedBox(
      height: _deviceHeight * 0.10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.menu,
            color: Colors.white,
            size: 30,
          ),
          Row(
            children: <Widget>[
              Icon(
                Icons.search,
                color: Colors.white,
                size: 30,
              ),
              SizedBox(
                width: _deviceWidth * 0.03,
              ),
              Icon(
                Icons.notifications,
                color: Colors.white,
                size: 30,
              ),
            ],
          )
        ],
      ),
    );
  }
}
