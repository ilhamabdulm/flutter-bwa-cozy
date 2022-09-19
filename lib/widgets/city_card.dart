import 'package:cozy_app/models/city.dart';
import 'package:cozy_app/themes/colors.dart';
import 'package:cozy_app/themes/typhography.dart';
import 'package:cozy_app/widgets/star_badge.dart';
import 'package:flutter/material.dart';

class CityCard extends StatelessWidget {
  const CityCard({super.key, required this.city});

  final City city;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Container(
        height: 150,
        color: Color(0xffF6F7F8),
        child: Column(
          children: [
            Expanded(
              child: Stack(children: [
                Image.asset(
                  city.image,
                  width: 120,
                  height: 102,
                  fit: BoxFit.cover,
                ),
                city.isPopular ? StarBadge() : Container(),
              ]),
            ),
            SizedBox(
              height: 11,
            ),
            Text(
              city.name,
              style: blackTextStyle.copyWith(fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}
