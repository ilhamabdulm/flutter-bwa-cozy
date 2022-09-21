import 'package:cozy_app/pages/home.dart';
import 'package:cozy_app/themes/typhography.dart';
import 'package:cozy_app/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(38),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image.asset('assets/images/cozy-error-404.png'),
            const SizedBox(
              height: 70,
            ),
            Text(
              'Where are you going?',
              style: blackTextStyle.copyWith(
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            Text(
              'Seems like the page that you were requested is already gone',
              style: greyTextStyle.copyWith(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 50,
            ),
            PrimaryButton(
                label: 'Back to Home',
                width: 210,
                action: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                })
          ]),
        ),
      ),
    );
  }
}
