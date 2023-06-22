import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:my_to_do_app/constant/color.dart';

import '../onbordeing/on_onborading_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  bool isComplate = false;
  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              "assets/animated/splash.json",
              controller: _controller,
              animate: true,
              onLoaded: (compa) {
                _controller
                  ..duration = compa.duration
                  ..forward().then((value) {
                    setState(() {
                      isComplate = true;
                    });
                  });
              },
            ),
            isComplate ? _buildTextAnimation() : const SizedBox(),
          ],
        ),
      ),
    );
  }

  Widget _buildTextAnimation() {
    return DefaultTextStyle(
      style: const TextStyle(
          fontSize: 35.0,
          fontFamily: 'Bobbers',
          color: kPrimaryColor,
          fontWeight: FontWeight.w900),
      child: AnimatedTextKit(
        isRepeatingAnimation: false,
        repeatForever: false,
        animatedTexts: [
          TypewriterAnimatedText(
            'TO DO',
            curve: Curves.easeIn,
            speed: const Duration(milliseconds: 140),
            cursor: '|',
          )
        ],
        onFinished: () {
          Future.delayed(const Duration(milliseconds: 700)).then((value) {
            Get.to(const OnBoradingScreen(),curve: Curves.easeInOut,transition: Transition.fadeIn);
          });
        },
      ),
    );
  }
}
