import 'dart:math';
import 'package:flutter/material.dart';

class CardSliverAppBar extends StatefulWidget {
  final double? height;
  final Image? background;
  final double appBarHeight = 60;
  final Text? title;
  final Text? titleDescription;
  final bool? backButton;
  final List<Color>? backButtonColors;
  final Widget? action;
  final Widget? body;
  final ImageProvider? card;

  const CardSliverAppBar(
      {required this.height,
      required this.background,
      required this.title,
      required this.body,
      this.titleDescription,
      this.backButton = false,
      this.backButtonColors,
      this.action,
      this.card,
      Key? key})
      : assert(height != null && height > 0),
        assert(background != null),
        assert(title != null),
        assert(body != null),
        super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CardSliverAppBarState createState() => _CardSliverAppBarState();
}

class _CardSliverAppBarState extends State<CardSliverAppBar>
    with SingleTickerProviderStateMixin {
  ScrollController? _scrollController;
  AnimationController? _animationController;
  Animation<double>? _fadeTransition;
  Animatable<Color?>? _animatedBackButtonColors;
  Animation<double>? _rotateCard;

  double _scale = 0.0;
  double _offset = 0.0;

  @override
  void dispose() {
    _scrollController?.dispose();
    _animationController?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    _fadeTransition = Tween(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _animationController!,
        curve: const Interval(0.4, 1.0, curve: Curves.easeIn),
      ),
    )..addListener(() {
        setState(() {});
      });
    if (widget.card != null) {
      _rotateCard = Tween(begin: 0.0, end: 0.4).animate(
          CurvedAnimation(curve: Curves.linear, parent: _animationController!))
        ..addListener(() {
          setState(() {});
        });
    }
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {});
      });
  }

  void _animationValue(double scale) {
    _animationController!.value = scale;
  }

  //gets
  get _backButtonColors => widget.backButtonColors;
  get _card => widget.card;
  get _action => widget.action;
  get _backButton => widget.backButton;
  get _height => widget.height;
  get _body => widget.body;
  get _appBarHeight => widget.appBarHeight;
  get _background => widget.background;
  get _titleDescription => widget.titleDescription;
  get _title => widget.title;

  @override
  Widget build(BuildContext context) {
    if (_scrollController!.hasClients) {
      _scale =
          _scrollController!.offset / (widget.height! - widget.appBarHeight);
      if (_scale > 1) {
        _scale = 1.0;
      }
      _offset = _scrollController!.offset;
    }
    _animationValue(_scale);
    _scale = 1.0 - _scale;

    if (_backButtonColors != null && _backButtonColors.length >= 2) {
      _animatedBackButtonColors = TweenSequence<Color?>([
        TweenSequenceItem(
          weight: 1.0,
          tween: ColorTween(
            begin: _backButtonColors[0],
            end: _backButtonColors[1],
          ),
        )
      ]);
    }

    List<Widget> stackOrder = [];
    if (_scale >= 0.5) {
      stackOrder.add(_bodyContainer());
      stackOrder.add(_backgroundConstructor());
      stackOrder.add(_shadowConstructor());
      stackOrder.add(_titleConstructor());
      if (_card != null) stackOrder.add(_cardConstructor());
      if (_action != null) stackOrder.add(_actionConstructor());
      if (_backButton != null && _backButton) {
        stackOrder.add(_backButtonConstructor());
      }
    } else {
      stackOrder.add(_backgroundConstructor());
      if (_card != null) stackOrder.add(_cardConstructor());
      stackOrder.add(_bodyContainer());
      stackOrder.add(_shadowConstructor());
      stackOrder.add(_titleConstructor());
      if (_action != null) stackOrder.add(_actionConstructor());
      if (_backButton != null && _backButton) {
        stackOrder.add(_backButtonConstructor());
      }
    }

    return SafeArea(
      child: ListView(
        controller: _scrollController,
        primary: false,
        children: <Widget>[
          Stack(
            key: const Key("widget_stack"),
            children: stackOrder,
          )
        ],
      ),
    );
  }

  Widget _backButtonConstructor() {
    return Positioned(
      top: _offset + 7,
      left: 5,
      child: Column(
        children: <Widget>[
          IconButton(
            icon: const Icon(Icons.arrow_back),
            color: _animatedBackButtonColors != null
                ? _animatedBackButtonColors!.evaluate(
                    AlwaysStoppedAnimation(_animationController!.value))
                : Colors.white,
            iconSize: 25,
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );
  }

  Widget _bodyContainer() {
    return Container(
      key: const Key("widget_body"),
      margin: EdgeInsets.only(top: _height),
      child: _body,
    );
  }

  double _getRotationAnimationValue(double animValue) {
    animValue = animValue * 5;
    final double value = -pow(animValue, 2) + (2 * animValue);
    return value;
  }

  double _getCardTopMargin() {
    final double value = _scale <= 0.5
        ? widget.height! - ((widget.appBarHeight * 3.6) * _scale)
        : widget.height! - (widget.appBarHeight * 1.8);
    return value;
  }

  Widget _cardConstructor() {
    return Positioned(
      key: const Key("widget_card"),
      top: _getCardTopMargin(),
      left: 20,
      child: Transform.rotate(
        angle: _getRotationAnimationValue(_rotateCard!.value),
        origin: const Offset(50, -70),
        child: SizedBox(
          width: _appBarHeight * 1.67,
          height: _appBarHeight * 2.3,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              image: DecorationImage(image: _card, fit: BoxFit.cover),
            ),
          ),
        ),
      ),
    );
  }

  Widget _backgroundConstructor() {
    return Container(
      key: const Key("widget_background"),
      height: _height,
      width: MediaQuery.of(context).size.width,
      color: Colors.black,
      child: FadeTransition(
        opacity: _fadeTransition!,
        child: _background,
      ),
    );
  }

  Widget _shadowConstructor() {
    return Positioned(
      key: const Key("widget_appbar_shadow"),
      top: _scale == 0.0 ? _offset + _appBarHeight : _height,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 0.5,
        decoration: const BoxDecoration(color: Colors.transparent, boxShadow: [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 1.0,
          )
        ]),
      ),
    );
  }

  Widget _titleConstructor() {
    return Positioned(
      key: const Key("widget_title"),
      top: _scale == 0.0 ? _offset : widget.height! - widget.appBarHeight,
      child: ClipPath(
        clipper: _MyCliperChanfro(_animationController!.value),
        child: Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(
              left: _scale >= 0.12
                  ? 40 + ((MediaQuery.of(context).size.width / 4) * _scale)
                  : 50),
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          height: _appBarHeight,
          child: _titleDescriptionHandler(),
        ),
      ),
    );
  }

  Widget _titleDescriptionHandler() {
    if (_titleDescription != null) {
      var titleContainer = Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(bottom: (25 * _scale)),
        child: _title,
      );

      var titleDescriptionContainer = Opacity(
        opacity: _scale <= 0.7 ? _scale / 0.7 : 1.0,
        child: Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(top: (25 * _scale)),
          child: _titleDescription,
        ),
      );

      return Stack(
        alignment: Alignment.centerLeft,
        children: <Widget>[
          titleDescriptionContainer,
          titleContainer,
        ],
      );
    } else {
      return _title;
    }
  }

  Widget _actionConstructor() {
    return Positioned(
      key: const Key("widget_action"),
      top: _height - _appBarHeight - 25,
      right: 10,
      child: Transform.scale(
        scale: _scale >= 0.5 ? 1.0 : (_scale / 0.5),
        child: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(50)),
              boxShadow: [BoxShadow(color: Colors.black54, blurRadius: 3.0)]),
          child: _action,
        ),
      ),
    );
  }
}

class _MyCliperChanfro extends CustomClipper<Path> {
  double scale;

  _MyCliperChanfro(this.scale);

  @override
  Path getClip(Size size) {
    Path path = Path();
    scale = 1.0 - scale;
    if (scale >= 0.5) {
      path.lineTo(0, 30);
      path.lineTo(50, 0);
    } else {
      path.lineTo(0, (scale / 0.5) * 30);
      path.lineTo((scale / 0.5) * 50, 0);
    }
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
