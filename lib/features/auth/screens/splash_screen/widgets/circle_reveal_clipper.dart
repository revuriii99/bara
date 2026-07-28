import 'package:flutter/material.dart';

class CircleRevealClipper extends CustomClipper<Path> {
  final Offset center;
  final double progress; // 0 - 1
  final double maxRadius;

  CircleRevealClipper({
    required this.center,
    required this.progress,
    required this.maxRadius,
  });

  @override
  Path getClip(Size size) {
    final radius = maxRadius * progress;
    return Path()
      ..addOval(Rect.fromCircle(center: center, radius: radius));
  }

  @override
  bool shouldReclip(covariant CircleRevealClipper oldClipper) =>
      oldClipper.progress != progress || oldClipper.center != center;
}