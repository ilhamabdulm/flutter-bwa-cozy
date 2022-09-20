import 'package:cozy_app/models/tip.dart';
import 'package:cozy_app/themes/typhography.dart';
import 'package:flutter/material.dart';

class TipsCard extends StatelessWidget {
  const TipsCard({super.key, required this.tip});

  final Tip tip;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          tip.imageUrl,
          width: 80,
          height: 80,
          fit: BoxFit.cover,
        ),
        const SizedBox(
          width: 16,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              tip.name,
              style: blackTextStyle.copyWith(fontSize: 18),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              tip.lastUpdated,
              style: greyTextStyle.copyWith(fontSize: 14),
            )
          ],
        ),
        const Spacer(),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.chevron_right_outlined,
              color: Color(0xffC9C9C9),
              size: 24,
            ))
      ],
    );
  }
}
