import 'package:flutter/material.dart';
import 'package:interview_task/screens/welcome/onboarding/pages/onboarding_page.dart';
import 'package:interview_task/theme/theme.dart';


class SplashScreen extends StatefulWidget {
  static String id = 'splash_screen';

  @override
  Splash createState() => Splash();
}

class Splash extends State<SplashScreen> with SingleTickerProviderStateMixin {
  Animation<double> animation;

  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    final CurvedAnimation curve =
        CurvedAnimation(parent: controller, curve: Curves.ease);
    animation = Tween(begin: 1.0, end: 0.2).animate(curve);
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed)
        controller.reverse();
      else if (status == AnimationStatus.dismissed) controller.forward();
    });
    controller.forward().then((value) => {
          Future.delayed(const Duration(seconds: 3), () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => OnboardingScreen()),
            );
          })
        });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: bgColorScreen,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: FadeTransition(
          opacity: animation,
          child: Image.asset('assets/images/logo.png'),
        ));
  }
}
