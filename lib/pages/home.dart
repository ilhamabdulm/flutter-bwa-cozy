import 'dart:developer';

import 'package:cozy_app/data/dummy.dart';
import 'package:cozy_app/models/space.dart';
import 'package:cozy_app/providers/space_providers.dart';
import 'package:cozy_app/themes/typhography.dart';
import 'package:cozy_app/widgets/bottom_navbar_item.dart';
import 'package:cozy_app/widgets/city_card.dart';
import 'package:cozy_app/widgets/space_card.dart';
import 'package:cozy_app/widgets/tips_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var spaceProvider = Provider.of<SpaceProvider>(context);

    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: ListView(
          children: [
            const SizedBox(
              height: 24,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Explore Now',
                  style: blackTextStyle.copyWith(fontSize: 24),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  'Mencari kosan yang cozy',
                  style: greyTextStyle.copyWith(fontSize: 16),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Popular Cities',
                  style: regularTextStyle,
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  height: 150,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: ((context, index) => const SizedBox(
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
            const SizedBox(
              height: 30,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Recommended Space',
                  style: regularTextStyle,
                ),
                const SizedBox(
                  height: 16,
                ),
                FutureBuilder(
                    future: spaceProvider.getRecommendedSpaces(),
                    builder: ((context, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.hasData) {
                          List<Space> data = snapshot.data;

                          return Column(
                            children: List.generate(
                                data.length,
                                (index) => Column(
                                      children: [
                                        SpaceCard(
                                          space: data[index],
                                        ),
                                        const SizedBox(
                                          height: 30,
                                        )
                                      ],
                                    )),
                          );
                        } else {
                          return Text('error');
                        }
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    })),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tips & Guidance',
                  style: regularTextStyle,
                ),
                const SizedBox(
                  height: 16,
                ),
                Column(
                  children: List.generate(
                      listOfTip.length,
                      (index) => Column(
                            children: [
                              TipsCard(
                                tip: listOfTip[index],
                              ),
                              const SizedBox(
                                height: 30,
                              )
                            ],
                          )),
                )
              ],
            ),
            const SizedBox(
              height: 74,
            )
          ],
        ),
      )),
      floatingActionButton: Container(
        height: 65,
        width: MediaQuery.of(context).size.width - (2 * 24),
        decoration: BoxDecoration(
            color: Color(0xffF6F7F8), borderRadius: BorderRadius.circular(23)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomNavbarItem(
                icon: 'assets/icons/icon-home-active.png', isActive: true),
            BottomNavbarItem(
                icon: 'assets/icons/icon-mail.png', isActive: false),
            BottomNavbarItem(
                icon: 'assets/icons/icon-card.png', isActive: false),
            BottomNavbarItem(
                icon: 'assets/icons/icon-love.png', isActive: false)
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
