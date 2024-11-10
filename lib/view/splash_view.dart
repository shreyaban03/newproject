import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/view_model/splash_view_model.dart';
import 'package:get/get.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with TickerProviderStateMixin {
  final splashVM = Get.put(SplashViewModel());
  
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    
    
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);

    
    _controller = AnimationController(
      duration: const Duration(seconds: 2), 
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    
    _controller.forward();

  
    splashVM.loadView();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset("assets/images/music.png", width: media.width * 0.5),
            SizedBox(height: 20),
        
            FadeTransition(
              opacity: _fadeAnimation,
              child: Text(
                'Melodify',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
