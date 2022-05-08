import 'package:code_capsule_background/config/color.dart';
import 'package:flutter/material.dart';

class AnimatedLine extends AnimatedWidget {
  final PageController pageController;
  final double initY;
  final double firstX;
  final double secondX;
  final double thiredX;

  const AnimatedLine(
      {Key? key,
      required this.thiredX,
      required this.secondX,
      required this.firstX,
      required this.initY,
      required this.pageController})
      : super(key: key, listenable: pageController);

  @override
  Widget build(BuildContext context) {

    return Positioned(
        top: initY,
        left: (thiredX - firstX) * (pageController.page!/2),
        child: Container(
          height: 6,
          width: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
              color: KColor.primaryColor),
        ),
    );
  }


}
