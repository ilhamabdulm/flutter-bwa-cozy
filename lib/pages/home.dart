import 'package:cozy_app/data/dummy.dart';
import 'package:cozy_app/models/city.dart';
import 'package:cozy_app/themes/typhography.dart';
import 'package:cozy_app/widgets/city_card.dart';
import 'package:cozy_app/widgets/space_card.dart';
import 'package:cozy_app/widgets/star_badge.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(24),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Explore Now',
                  style: blackTextStyle.copyWith(fontSize: 24),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  'Mencari kosan yang cozy',
                  style: greyTextStyle.copyWith(fontSize: 16),
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Popular Cities',
                  style: regularTextStyle,
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  height: 150,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: ((context, index) => SizedBox(
                          width: 20,
                        )),
                    itemCount: listOfCity.length,
                    itemBuilder: (BuildContext context, index) {
                      return CityCard(city: listOfCity[index]);
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Recommended Space',
                  style: regularTextStyle,
                ),
                SizedBox(
                  height: 16,
                ),
                Column(
                  children: List.generate(
                      listOfSpace.length,
                      (index) => Column(
                            children: [
                              SpaceCard(
                                space: listOfSpace[index],
                              ),
                              SizedBox(
                                height: 30,
                              )
                            ],
                          )),
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
