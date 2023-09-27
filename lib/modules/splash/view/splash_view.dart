import 'package:google_fonts/google_fonts.dart';
import '../controllers/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreenView extends GetView<SplashController> {
  const SplashScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    return GetBuilder(
      init: SplashController(),
      builder: (SplashController controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/splash.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Text(
                '\nWEBART',
                style: GoogleFonts.fredoka(
                  fontSize: 70.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
