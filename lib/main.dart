import 'package:webart_assignment/routes/app_routes.dart';
import 'package:webart_assignment/routes/app_pages.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'EzeDetect',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          color: Colors.transparent,
          elevation: 0,
        ),
        primarySwatch: Colors.grey,
        textTheme: TextTheme(
          bodyLarge: GoogleFonts.openSans(
            color: Colors.black87,
            fontSize: 16,
          ),
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.grey,
        textTheme: TextTheme(
          bodyLarge: GoogleFonts.openSans(
            color: Colors.black87,
            fontSize: 16,
          ),
        ),
      ),
      themeMode: ThemeMode.system,
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: child!,
        );
      },
      initialRoute: Routes.SPLASH_SCREEN,
      getPages: AppPages.routes,
    );
  }
}
