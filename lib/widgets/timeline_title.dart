import 'package:economizei_app/widgets/slide_fade_animation.dart';
import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';

class TimelineTitle extends StatefulWidget {
  final String title;
  final int currentIndex;
  final int numberOfIndexes;
  const TimelineTitle({
    required this.title,
    required this.currentIndex,
    required this.numberOfIndexes,
    Key? key,
  }) : super(key: key);

  @override
  State<TimelineTitle> createState() => _TimelineTitleState();
}

class _TimelineTitleState extends State<TimelineTitle> {
  // late final _controllerAnimation =
  //     AnimationController(vsync: this, duration: const Duration(milliseconds: 1500))
  //       ..repeat();
  // late final _animationFade =
  //     CurvedAnimation(parent: _controllerAnimation, curve: Curves.easeIn);

  // late final _animationSlide =
  //     Tween<Offset>(begin: const Offset(0, -1), end: Offset.zero).animate(
  //         CurvedAnimation(parent: _controllerAnimation, curve: Curves.easeIn));
  Widget getTitle() {
    return SlideFadeAnimation(
        dx: 0,
        dy: -1,
        timeStart: 0,
        duration: 1000,
        child: Text(
          widget.title,
          style: const TextStyle(
            color: Color(0xFFEE0F55),
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ));
    
  }

  @override
  Widget build(BuildContext context) {
    //_controllerAnimation.forward();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 40,
          margin: const EdgeInsets.fromLTRB(20, 50, 20, 20),
          child: Timeline.tileBuilder(
            theme: TimelineThemeData(
                direction: Axis.horizontal,
                color: const Color(0xFFEE0F55),
                connectorTheme:
                    const ConnectorThemeData(color: Color(0xFFC4C4C4))),
            builder: TimelineTileBuilder.connected(
              connectionDirection: ConnectionDirection.before,
              itemExtentBuilder: (_, __) =>
                  (MediaQuery.of(context).size.width - 40) /
                  widget.numberOfIndexes,
              indicatorBuilder: (_, index) {
                if (index == widget.currentIndex) {
                  return Stack(
                    alignment: AlignmentDirectional.center,
                    children: const [
                      DotIndicator(size: 32, color: Color(0xFFEE0F55)),
                      DotIndicator(size: 16, color: Colors.white),
                    ],
                  );
                } else if (index < widget.currentIndex) {
                  return const DotIndicator(
                    color: Color(0xFFEE0F55),
                    size: 14,
                  );
                } else {
                  return const DotIndicator(
                    color: Color(0xFFC4C4C4),
                    size: 14,
                  );
                }
              },
              connectorBuilder: (_, index, type) {
                if (index <= widget.currentIndex) {
                  return const SolidLineConnector(
                    color: Color(0xFFEE0F55),
                  );
                }
                return const SolidLineConnector(
                  color: Color(0xFFC4C4C4),
                );
              },
              itemCount: widget.numberOfIndexes,
            ),
          ),
        ),
        Container(
            padding: const EdgeInsets.fromLTRB(30, 0, 30, 20), child: getTitle()
            // SlideTransition(
            //   position: _animationSlide,
            //   child: FadeTransition(
            //     opacity: _animationFade,
            //     child: Text(
            //       widget.title,
            //       style: const TextStyle(
            //         color: Color(0xFFEE0F55),
            //         fontSize: 24,
            //         fontWeight: FontWeight.bold,
            //       ),
            //       textAlign: TextAlign.center,
            //     ),
            //   ),
            // ),
            )
      ],
    );
  }
}
