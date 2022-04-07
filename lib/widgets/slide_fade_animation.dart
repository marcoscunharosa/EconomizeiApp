import 'dart:async';

import 'package:flutter/material.dart';

class SlideFadeAnimation extends StatefulWidget {
  final int timeStart, duration;
  double dx, dy;
  final Widget child;
  SlideFadeAnimation(
      {Key? key,
      this.dx = 0,
      this.dy = 0,
      required this.timeStart,
      required this.duration,
      required this.child})
      : super(key: key);

  @override
  State<SlideFadeAnimation> createState() => _SlideFadeAnimationState();
}

class _SlideFadeAnimationState extends State<SlideFadeAnimation>
    with TickerProviderStateMixin {
  late final _controllerAnimation = AnimationController(
      vsync: this, duration: Duration(milliseconds: widget.duration));
  late final _animationFade =
      CurvedAnimation(parent: _controllerAnimation, curve: Curves.easeIn);

  late final _animationSlide = Tween<Offset>(
          begin: Offset(widget.dx, widget.dy), end: Offset.zero)
      .animate(
          CurvedAnimation(parent: _controllerAnimation, curve: Curves.easeIn));

  @override
  void dispose() {
    _controllerAnimation.dispose();
    super.dispose();
  }

  @override
  void initState() {
    Timer(Duration(milliseconds: widget.timeStart),
        () => _controllerAnimation.forward());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _controllerAnimation.reset();
    _controllerAnimation.forward();
    //_controllerAnimation.dispose();
    return SlideTransition(
      position: _animationSlide,
      child: FadeTransition(
        opacity: _animationFade,
        child: widget.child,
      ),
    );
  }
}
