import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Image.asset(
              'assets/images/cozy-logo.png',
              width: 50,
            ),
            Text('Find Cozy House to Stay and Happy')
          ],
        ),
      ),
    );
  }
}
