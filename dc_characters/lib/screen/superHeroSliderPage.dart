import 'dart:math';

import 'package:dc_characters/model/superheroes.dart';
import 'package:dc_characters/screen/superHeroDetailPage.dart';
import 'package:dc_characters/widget/superHeroCard.dart';
import 'package:flutter/material.dart';

class SuperheroSliderPage extends StatefulWidget {
  const SuperheroSliderPage({Key? key}) : super(key: key);

  @override
  _SuperheroSliderPageState createState() => _SuperheroSliderPageState();
}

class _SuperheroSliderPageState extends State<SuperheroSliderPage> {
  PageController? _pageController;
  int? _index;
  int? _auxIndex;
  // _percent for
  double? _percent;
  double? _auxPercent;
  bool? _isScrolling;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    _index = 0;
    _auxIndex = (_index! + 1);
    _percent = 0.0;
    _auxPercent = 1.0 - _percent!;
    _isScrolling = false;
    _pageController!.addListener(_pageListener);
    super.initState();
  }

  @override
  void dispose() {
    _pageController!.removeListener(_pageListener);
    super.dispose();
  }

  void _pageListener() {
    _index = _pageController!.page!.floor();
    _auxIndex = _index! + 1;
    _percent = (_pageController!.page! - _index!).abs();
    _auxPercent = 1.0 - _percent!;
    _isScrolling = (_pageController!.page! % 1.0) != 0;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final heroes = SuperHero.dcCharacters;
    final angleRotate = (pi * -.5);
    return Scaffold(
      appBar: AppBar(
        title: Text('DC Comics',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          color: Colors.white,
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {},
        ),
      ),
      body: Stack(children: [
        //! SuperHero Cards
        AnimatedPositioned(
          duration: kThemeAnimationDuration,
          top: 0,
          bottom: 0,
          right: _isScrolling! ? 10 : 0,
          left: _isScrolling! ? 10 : 0,
          child: Stack(children: [
            //? Back card
            Transform.translate(
              offset: Offset(0, 50 * _auxPercent!.toDouble()),
              child: SuperHeroCard(
                superHero: heroes[_auxIndex!.clamp(0, heroes.length - 1)],
                factorChange: _auxPercent,
              ),
            ),

            //? Front card
            Transform.translate(
              offset: Offset(
                  -780 * _percent!.toDouble(), 100 * _percent!.toDouble()),
              child: Transform.rotate(
                angle: angleRotate * _percent!.toDouble(),
                child: SuperHeroCard(
                  superHero: heroes[_index!],
                  factorChange: _percent,
                ),
              ),
            )
          ]),
        ),
        //! Void page view - just for using pagecontroller
        PageView.builder(
          controller: _pageController,
          itemCount: heroes.length,
          itemBuilder: (context, index) {
            return InkWell(
                onTap: () => _openDetail(context, heroes[index]),
                child: const SizedBox());
          },
        )
      ]),
    );
  }

  _openDetail(BuildContext context, SuperHero hero) {
    Navigator.push(
        context,
        PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) {
              return FadeTransition(opacity: animation , child : SuperHeroDetailPage(
                superhero : hero ,
              )) ; 
            }));
  }
}
