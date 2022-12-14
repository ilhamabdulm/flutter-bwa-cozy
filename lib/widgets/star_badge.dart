import 'package:cozy_app/themes/typhography.dart';
import 'package:flutter/material.dart';

import 'package:cozy_app/themes/colors.dart';

class StarBadge extends StatelessWidget {
  const StarBadge({super.key, this.rating = 0});

  final int rating;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.rating != 0 ? 130 : 120,
      alignment: Alignment.topRight,
      child: Container(
        width: this.rating != 0 ? 70 : 50,
        height: 30,
        decoration: BoxDecoration(
            color: primaryPurple,
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25))),
        child: Center(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/icons/icon-star-orange.png',
                  width: 20,
                ),
                SizedBox(
                  width: this.rating != 0 ? 2 : 0,
                ),
                this.rating != 0
                    ? Text(
                        '$rating/5',
                        style: whiteTextStyle.copyWith(fontSize: 13),
                      )
                    : Container()
              ]),
        ),
      ),
    );
  }
}
