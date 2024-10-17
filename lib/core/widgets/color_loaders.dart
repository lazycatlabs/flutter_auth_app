import 'dart:math';

import "package:flutter/material.dart";
import 'package:flutter_auth_app/core/core.dart';

class ColorLoader extends StatefulWidget {
  final double radius;
  final double dotRadius;

  const ColorLoader({this.radius = 30.0, this.dotRadius = 6.0});

  @override
  _ColorLoaderState createState() => _ColorLoaderState();
}

class _ColorLoaderState extends State<ColorLoader>
    with SingleTickerProviderStateMixin {
  late Animation<double> animationRotation;
  late Animation<double> animationRadiusIn;
  late Animation<double> animationRadiusOut;
  late AnimationController controller;

  double? radius;
  double? dotRadius;

  @override
  void initState() {
    super.initState();

    radius = widget.radius;
    dotRadius = widget.dotRadius;

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    );

    animationRotation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.0, 1.0),
      ),
    );

    animationRadiusIn = Tween(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.75, 1.0, curve: Curves.elasticIn),
      ),
    );

    animationRadiusOut = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.0, 0.25, curve: Curves.elasticOut),
      ),
    );

    controller.addListener(() {
      setState(() {
        if (controller.value >= 0.75 && controller.value <= 1.0) {
          radius = widget.radius * animationRadiusIn.value;
        } else if (controller.value >= 0.0 && controller.value <= 0.25) {
          radius = widget.radius * animationRadiusOut.value;
        }
      });
    });

    // controller.addStatusListener((status) {});

    controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.0,
      height: 100.0,
      //color: Colors.black12,
      child: Center(
        child: RotationTransition(
          turns: animationRotation,
          child: Center(
            child: Stack(
              children: <Widget>[
                Transform.translate(
                  offset: Offset.zero,
                  child: Dot(
                    radius: radius,
                    color: Colors.black26,
                  ),
                ),
                Transform.translate(
                  offset: Offset(
                    radius! * cos(0.0),
                    radius! * sin(0.0),
                  ),
                  child: Dot(
                    radius: dotRadius,
                    color: Palette.primary,
                  ),
                ),
                Transform.translate(
                  offset: Offset(
                    radius! * cos(0.0 + 1 * pi / 4),
                    radius! * sin(0.0 + 1 * pi / 4),
                  ),
                  child: Dot(
                    radius: dotRadius,
                    color: Palette.secondary,
                  ),
                ),
                Transform.translate(
                  offset: Offset(
                    radius! * cos(0.0 + 2 * pi / 4),
                    radius! * sin(0.0 + 2 * pi / 4),
                  ),
                  child: Dot(
                    radius: dotRadius,
                    color: Theme.of(context).extension<LzyctColors>()!.red,
                  ),
                ),
                Transform.translate(
                  offset: Offset(
                    radius! * cos(0.0 + 3 * pi / 4),
                    radius! * sin(0.0 + 3 * pi / 4),
                  ),
                  child: Dot(
                    radius: dotRadius,
                    color: Theme.of(context).extension<LzyctColors>()!.yellow,
                  ),
                ),
                Transform.translate(
                  offset: Offset(
                    radius! * cos(0.0 + 4 * pi / 4),
                    radius! * sin(0.0 + 4 * pi / 4),
                  ),
                  child: Dot(
                    radius: dotRadius,
                    color: Theme.of(context).extension<LzyctColors>()!.green,
                  ),
                ),
                Transform.translate(
                  offset: Offset(
                    radius! * cos(0.0 + 5 * pi / 4),
                    radius! * sin(0.0 + 5 * pi / 4),
                  ),
                  child: Dot(
                    radius: dotRadius,
                    color: Theme.of(context).extension<LzyctColors>()!.flamingo,
                  ),
                ),
                Transform.translate(
                  offset: Offset(
                    radius! * cos(0.0 + 6 * pi / 4),
                    radius! * sin(0.0 + 6 * pi / 4),
                  ),
                  child: Dot(
                    radius: dotRadius,
                    color: Theme.of(context).extension<LzyctColors>()!.lavender,
                  ),
                ),
                Transform.translate(
                  offset: Offset(
                    radius! * cos(0.0 + 7 * pi / 4),
                    radius! * sin(0.0 + 7 * pi / 4),
                  ),
                  child: Dot(
                    radius: dotRadius,
                    color: Theme.of(context).extension<LzyctColors>()!.pink,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class Dot extends StatelessWidget {
  final double? radius;
  final Color? color;

  const Dot({this.radius, this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: radius,
        height: radius,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      ),
    );
  }
}
