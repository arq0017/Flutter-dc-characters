import 'package:dc_characters/model/superheroes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SuperHeroDetailPage extends StatefulWidget {
  final SuperHero? superhero;
  const SuperHeroDetailPage({
    Key? key,
    @required this.superhero,
  }) : super(key: key);

  @override
  _SuperHeroDetailPageState createState() => _SuperHeroDetailPageState();
}

class _SuperHeroDetailPageState extends State<SuperHeroDetailPage>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  var _colorGradientValue;
  var _whiteGradientValue;

  bool? _changeToBlack;
  bool? _enableInfoItems;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _colorGradientValue = Tween(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller!,
        curve: Interval(0.0, 1.0, curve: Curves.fastOutSlowIn),
      ),
    );

    _whiteGradientValue = Tween(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller!,
        curve: Interval(0.1, 1.0, curve: Curves.fastOutSlowIn),
      ),
    );

    _changeToBlack = false;
    _enableInfoItems = false;

    Future.delayed(const Duration(milliseconds: 300), () {
      _controller!.forward();
      Future.delayed(const Duration(milliseconds: 600), () {
        setState(() {
          _changeToBlack = true;
          _enableInfoItems = true;
        });
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return Material(
      child: Stack(
        children: [
          //! Animated Background
          Positioned.fill(
            child: Hero(
              tag: widget.superhero!.charName + 'background',
              child: AnimatedBuilder(
                animation: _controller!,
                builder: (_, __) => DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(widget.superhero!.rawColor), Colors.black],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [
                        _colorGradientValue.value,
                        _whiteGradientValue.value
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

          //! Items Background
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SafeArea(
                  child: Hero(
                    tag: widget.superhero!.pathImage,
                    child: Image.asset(widget.superhero!.pathImage,
                        height: deviceSize.height * .45,
                        width: deviceSize.width),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.bottomLeft,
                        heightFactor: 1,
                        child: Opacity(
                          opacity: .7,
                          child: FittedBox(
                            child: Hero(
                              tag: widget.superhero!.charName,
                              child: AnimatedDefaultTextStyle(
                                duration: kThemeAnimationDuration,
                                style: textTheme.headline2!.copyWith(
                                  color: _changeToBlack!
                                      ? Colors.white
                                      : Colors.black87,
                                ),
                                child: Text(
                                  widget.superhero!.charName
                                      .toString()
                                      .replaceAll(' ', '\n')
                                      .toUpperCase(),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Opacity(
                        opacity: .5,
                        child: Hero(
                          tag: widget.superhero!.charTitle,
                          child: AnimatedDefaultTextStyle(
                            duration: kThemeAnimationDuration,
                            style: textTheme.headline3!.copyWith(
                              color: _changeToBlack!
                                  ? Colors.white
                                  : Colors.black54,
                            ),
                            child: Text(
                              widget.superhero!.charTitle
                                  .toString()
                                  .toUpperCase(),
                            ),
                          ),
                        ),
                      ),
                      const Divider(height: 30, color: Colors.white38),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 600),
                        curve: Curves.elasticOut,
                        transform: Matrix4.translationValues(
                            0, _enableInfoItems! ? 0 : 50, 0),
                        child: AnimatedOpacity(
                          duration: const Duration(milliseconds: 400),
                          opacity: _enableInfoItems! ? 1.0 : 0.0,
                          child: Text(
                            widget.superhero!.description,
                            style: GoogleFonts.spartan(
                              color: Colors.white60,
                              height: 1.5,
                            ),
                            maxLines: 5,
                            textAlign: TextAlign.justify,
                            overflow: TextOverflow.fade,
                          ),
                        ),
                      ),
                      const Divider(height: 20, color: Colors.white38),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.elasticOut,
                        transform: Matrix4.translationValues(
                            0, _enableInfoItems! ? 0 : 50, 0),
                        child: AnimatedOpacity(
                          opacity: _enableInfoItems! ? 1.0 : 0.0,
                          duration: const Duration(milliseconds: 300),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('comics', style: textTheme.headline6),
                              TweenAnimationBuilder<double>(
                                tween: Tween(
                                  begin: 0.0,
                                  end: _enableInfoItems! ? 1.0 : 0.0,
                                ),
                                curve: Curves.fastLinearToSlowEaseIn,
                                duration: const Duration(microseconds: 400),
                                builder: (context, value, child) =>
                                    Transform.scale(
                                  scale: value,
                                  child: child,
                                ),
                                child: Image.asset(
                                  'assets/dc.png',
                                  height: 35,
                                  width: 35,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 240,
                        child: ListView.builder(
                          itemCount: widget.superhero!.comics.length,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 10,
                          ),
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            final comic = widget.superhero!.comics[index];
                            return TweenAnimationBuilder<double>(
                              tween: Tween(
                                begin: 0.0,
                                end: _enableInfoItems! ? 1.0 : 0.0,
                              ),
                              curve: Curves.elasticInOut,
                              duration:
                                  Duration(milliseconds: 800 + (300 * index)),
                              builder: (context, value, child) =>
                                  Transform.translate(
                                      offset: Offset(0, 20 * value),
                                      child: Opacity(
                                          opacity: value.clamp(0.0, 1.0),
                                          child: child)),
                              child: Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(comic.toString()),
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),

          //! Back button
          Positioned(
            left: 20,
            top: 0,
            child: SafeArea(
              child: IconButton(
                  onPressed: () async {
                    setState(() {
                      _enableInfoItems = false;
                    });
                    setState(() {
                      _changeToBlack = false ; 
                    });
                    await _controller!.reverse();
                    Navigator.pop(context);
                  },
                  color: Colors.white,
                  icon: Icon(Icons.arrow_back_ios_new_rounded)),
            ),
          )
        ],
      ),
    );
  }
}
