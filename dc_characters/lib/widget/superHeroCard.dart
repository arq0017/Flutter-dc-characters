import 'dart:ui';

import 'package:dc_characters/model/superheroes.dart';
import 'package:flutter/material.dart';

class SuperHeroCard extends StatelessWidget {
  final SuperHero? superHero;
  final double? factorChange;

  const SuperHeroCard(
      {Key? key, @required this.superHero, @required this.factorChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final separation = deviceSize.height * .24;
    return OverflowBox(
      alignment: Alignment.topCenter,
      maxHeight: deviceSize.height,
      child: Stack(
        children: [
          Positioned.fill(
            top: separation,
            child: Hero(
              tag: superHero!.charName + 'background',
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Color(superHero!.rawColor),
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
            ),
          ),
          //! DC image
          Positioned(
            left: 40,
            right: 40,
            top: separation * factorChange!.toDouble(),
            bottom: deviceSize.height * .4,
            child: Opacity(
              opacity: 1.0 - factorChange!.toDouble(),
              child: Transform.scale(
                  //! from Upper to lower range in lerpDouble
                  scale:
                      lerpDouble(1, 0.5, factorChange!.toDouble())!.toDouble(),
                  child: Hero(
                      tag: superHero!.pathImage,
                      child: Image.asset(superHero!.pathImage))),
            ),
          ),
          Positioned(
            left: 20,
            right: 30,
            top: deviceSize.height * .52,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Opacity(
                  opacity: .7,
                  child: FittedBox(
                    child: Hero(
                      tag: superHero!.charName,
                      child: Text(
                          superHero!.charName
                              .toString()
                              .replaceAll(' ', '\n')
                              .toUpperCase(),
                          style: Theme.of(context).textTheme.headline2),
                    ),
                  ),
                ),
                Opacity(
                  opacity: .5,
                  child: Hero(
                    tag: superHero!.charTitle,
                    child: Text(superHero!.charTitle.toString().toUpperCase(),
                        style: Theme.of(context).textTheme.headline3),
                  ),
                ),
                const SizedBox(height: 30),
                Text.rich(
                  TextSpan(
                    text: "Learn more",
                    style: Theme.of(context).textTheme.headline6,
                    children: [
                      WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: Icon(Icons.arrow_right_alt_rounded,
                            color: Colors.amber),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
