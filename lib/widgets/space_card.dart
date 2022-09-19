import 'package:cozy_app/models/space.dart';
import 'package:cozy_app/themes/typhography.dart';
import 'package:cozy_app/widgets/star_badge.dart';
import 'package:flutter/material.dart';

class SpaceCard extends StatelessWidget {
  const SpaceCard({super.key, required this.space});

  final Space space;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(18)),
          child: Stack(
            children: [
              Image.asset(
                space.image,
                width: 130,
                height: 110,
                fit: BoxFit.cover,
              ),
              StarBadge(
                rating: space.rating,
              )
            ],
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              space.name,
              style: blackTextStyle.copyWith(fontSize: 18),
            ),
            Text.rich(TextSpan(
                text: '\$${space.price}',
                style: purpleTextStyle.copyWith(fontSize: 16),
                children: [
                  TextSpan(
                    text: ' / month',
                    style: greyTextStyle.copyWith(fontSize: 16),
                  )
                ])),
            SizedBox(
              height: 16,
            ),
            Text(
              space.location,
              style: greyTextStyle.copyWith(fontSize: 14),
            )
          ],
        )
      ],
    );
  }
}
