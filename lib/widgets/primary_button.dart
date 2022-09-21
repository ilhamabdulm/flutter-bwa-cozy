import 'dart:developer';

import 'package:cozy_app/themes/colors.dart';
import 'package:cozy_app/themes/typhography.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
      {super.key,
      required this.label,
      required this.width,
      required this.action});

  final VoidCallback action;
  final String label;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: width,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: primaryPurple,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18))),
          onPressed: action,
          child: Text(
            label,
            style: whiteTextStyle.copyWith(fontSize: 18),
          )),
    );
  }
}
