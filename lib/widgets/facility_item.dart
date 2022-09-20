import 'package:cozy_app/themes/typhography.dart';
import 'package:flutter/material.dart';

class FacilityItem extends StatelessWidget {
  const FacilityItem(
      {super.key,
      required this.count,
      required this.label,
      required this.image});

  final int count;
  final String label;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          image,
          width: 32,
        ),
        const SizedBox(
          height: 8,
        ),
        Text.rich(TextSpan(
            text: '$count',
            style: purpleTextStyle.copyWith(fontSize: 14),
            children: [
              TextSpan(
                text: ' $label',
                style: greyTextStyle.copyWith(fontSize: 14),
              )
            ]))
      ],
    );
  }
}
