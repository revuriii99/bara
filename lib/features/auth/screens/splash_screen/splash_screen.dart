import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/config/app_routes.dart';
import 'widgets/eye_widget.dart';
import 'widgets/eye_closed_painter.dart';
import 'widgets/bara_text.dart';
import 'widgets/circle_reveal_clipper.dart';

const _kStarLook = 'assets/images/star_4.svg';
const _kStarSquint = 'assets/images/star_3.svg';
const _kLogo = 'assets/images/logo.svg';

const _kPrimaryBlue = Color(0xFF2163AE);

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    )..forward();

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed && mounted) {
        Navigator.pushReplacementNamed(context, AppRoutes.onboarding);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  double _segment(double start, double end) {
    final t = _controller.value;
    if (t <= start) return 0.0;
    if (t >= end) return 1.0;
    return (t - start) / (end - start);
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final maxRadius = screenSize.longestSide * 1.2;

    return Scaffold(
      backgroundColor: Colors.white,
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, _) {
          final pupilMove = Curves.easeInOut.transform(_segment(0.00, 0.30));
          final poseSwitch = _segment(0.30, 0.38);
          final eyesClose = _segment(0.38, 0.48);
          final wipeReveal = Curves.easeInCubic.transform(_segment(0.48, 0.62));
          final closedFadeOut = _segment(0.50, 0.58);
          final logoAppear = _segment(0.64, 0.70);
          final logoScale = Curves.elasticOut.transform(_segment(0.70, 0.92));
          final textFade = _segment(0.90, 1.00);

          final pupilDx = -1.0 + (pupilMove * 2.0);
          final pupilAlignment = Alignment(pupilDx, 0.0);

          final wipeCenter = Offset(screenSize.width / 2, screenSize.height * 0.42);

          return Stack(
            children: [
              Container(color: Colors.white),

              ClipPath(
                clipper: CircleRevealClipper(
                  center: wipeCenter,
                  progress: wipeReveal,
                  maxRadius: maxRadius,
                ),
                child: Container(color: _kPrimaryBlue),
              ),

              Positioned.fill(
                child: Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Opacity(
                        opacity: (1 - eyesClose) * (1 - closedFadeOut),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            EyeWidget(
                              size: 64,
                              pupilAsset: _kStarLook,
                              nextPupilAsset: _kStarSquint,
                              crossfade: poseSwitch,
                              pupilAlignment: pupilAlignment,
                              eyeColor: _kPrimaryBlue,
                            ),
                            const SizedBox(width: 28),
                            EyeWidget(
                              size: 64,
                              pupilAsset: _kStarLook,
                              nextPupilAsset: _kStarSquint,
                              crossfade: poseSwitch,
                              pupilAlignment: pupilAlignment,
                              mirror: false, 
                              eyeColor: _kPrimaryBlue,
                            ),
                          ],
                        ),
                      ),

                      Opacity(
                        opacity: eyesClose * (1 - closedFadeOut),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CustomPaint(
                              size: const Size(64, 28),
                              painter: EyeClosedPainter(
                                color: wipeReveal > 0 ? Colors.white : _kPrimaryBlue,
                              ),
                            ),
                            const SizedBox(width: 28),
                            CustomPaint(
                              size: const Size(64, 28),
                              painter: EyeClosedPainter(
                                color: wipeReveal > 0 ? Colors.white : _kPrimaryBlue,
                              ),
                            ),
                          ],
                        ),
                      ),

                      Opacity(
                        opacity: logoAppear,
                        child: Transform.scale(
                          scale: 0.15 + (logoScale * 0.85),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SvgPicture.asset(_kLogo, width: 120, height: 120),
                              const SizedBox(height: 12),
                              BaraText(opacity: textFade),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}