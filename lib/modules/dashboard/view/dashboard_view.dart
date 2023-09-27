import 'package:google_fonts/google_fonts.dart';
import 'package:webart_assignment/routes/app_routes.dart';
import '../controllers/dashboard_controller.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashBoardView extends GetView<DashBoardController> {
  const DashBoardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/dashboard.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FittedBox(
                  child: Text(
                    'Hey There,',
                    style: GoogleFonts.fredoka(
                      fontSize: 70.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                FittedBox(
                  child: Text(
                    controller.name.value,
                    style: GoogleFonts.fredoka(
                      fontSize: 70.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    final box = GetStorage();
                    box.erase();
                    Get.offAllNamed(Routes.LOGIN);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent),
                  icon: const Icon(
                    Icons.logout,
                    color: Colors.black87,
                    size: 70.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
