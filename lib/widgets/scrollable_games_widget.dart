// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, unused_field

import 'package:flutter/material.dart';
import 'package:gamify_app/data.dart';

class ScrollableGamesWidget extends StatelessWidget {
  final double _height;
  final double _width;
  final bool _showTitle;
  final List<Game> _gamesData;

  ScrollableGamesWidget(
      this._height, this._width, this._showTitle, this._gamesData);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _height,
      width: _width,
      child: ListView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: _gamesData.map((_game) {
          return Container(
            height: _height,
            width: _width*0.30,
            padding: EdgeInsets.only(right: _width*0.03),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: _height * 0.70,
                  width: _width * 0.30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(_game.coverImage.url),
                    ),
                  ),
                ),
                _showTitle?Text(
                  _game.title,
                  maxLines: 2,
                  textAlign:TextAlign.center ,
                  style: TextStyle(color: Colors.white,fontSize: _height*0.08),
                ):Container(),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
