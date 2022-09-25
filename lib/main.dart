import 'package:cozy_app/providers/space_providers.dart';
import 'package:flutter/material.dart';

import 'package:cozy_app/pages/splash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => SpaceProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              primarySwatch: Colors.blue,
              textTheme:
                  GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)),
          home: SplashScreen(),
        ));
  }
}
