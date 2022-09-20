import 'dart:developer';

import 'package:cozy_app/themes/colors.dart';
import 'package:cozy_app/themes/typhography.dart';
import 'package:cozy_app/widgets/facility_item.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatelessWidget {
  final List listofImage = [
    'assets/images/cozy-detail-photo-1.png',
    'assets/images/cozy-detail-photo-2.png',
    'assets/images/cozy-detail-photo-3.png',
    'assets/images/cozy-detail-photo-1.png',
    'assets/images/cozy-detail-photo-3.png',
    'assets/images/cozy-detail-photo-2.png',
  ];

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryWhite,
      body: SafeArea(
          bottom: false,
          child: Stack(
            children: [
              Image.asset(
                'assets/images/cozy-detail-space.png',
                width: MediaQuery.of(context).size.width,
                height: 350,
                fit: BoxFit.cover,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          log('message');
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              color: primaryWhite, shape: BoxShape.circle),
                          child: const Icon(
                            Icons.chevron_left_outlined,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (() {
                        log('message');
                      }),
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            color: primaryWhite, shape: BoxShape.circle),
                        child: const Icon(
                          Icons.favorite_border_outlined,
                          size: 20,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 328),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: primaryWhite,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(24))),
                  child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 30),
                        child: Column(children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Kuretakeso Hott',
                                    style:
                                        blackTextStyle.copyWith(fontSize: 22),
                                  ),
                                  Text.rich(TextSpan(
                                      text: '\$50',
                                      style: purpleTextStyle.copyWith(
                                          fontSize: 16),
                                      children: [
                                        TextSpan(
                                          text: ' / month',
                                          style: greyTextStyle.copyWith(
                                              fontSize: 16),
                                        )
                                      ])),
                                ],
                              ),
                              Row(
                                children: List.generate(
                                    5,
                                    (index) => Row(
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: index < 4
                                                  ? Color(0xffFF9376)
                                                  : Color(0xff989BA1),
                                            ),
                                            index < 4
                                                ? const SizedBox(
                                                    width: 1,
                                                  )
                                                : Container()
                                          ],
                                        )),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Main Facilities',
                                style: blackTextStyle.copyWith(fontSize: 16),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  FacilityItem(
                                      count: 2,
                                      label: 'Kitchens',
                                      image: 'assets/icons/icon-kitchen.png'),
                                  FacilityItem(
                                      count: 3,
                                      label: 'Bedrooms',
                                      image: 'assets/icons/icon-bedroom.png'),
                                  FacilityItem(
                                      count: 1,
                                      label: 'Big Lemari',
                                      image: 'assets/icons/icon-cupboard.png')
                                ],
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Photos',
                                style: blackTextStyle.copyWith(fontSize: 16),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Container(
                                height: 90,
                                child: ListView.separated(
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(
                                    width: 18,
                                  ),
                                  itemCount: listofImage.length,
                                  itemBuilder: (context, index) {
                                    return ClipRRect(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(12)),
                                      child: Image.asset(
                                        listofImage[index],
                                        width: 110,
                                        height: 88,
                                        fit: BoxFit.cover,
                                      ),
                                    );
                                  },
                                  scrollDirection: Axis.horizontal,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Location',
                                style: blackTextStyle.copyWith(fontSize: 16),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Jln. Kappan Sukses No. 20',
                                          style: greyTextStyle.copyWith(
                                              fontSize: 14)),
                                      Text('Palembang',
                                          style: greyTextStyle.copyWith(
                                              fontSize: 14))
                                    ],
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.pin_drop,
                                        color: Colors.grey,
                                        size: 24,
                                      ))
                                ],
                              ),
                              const SizedBox(
                                height: 24,
                              ),
                              Container(
                                height: 50,
                                width: MediaQuery.of(context).size.width -
                                    (2 * 24),
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: primaryPurple,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(18))),
                                    onPressed: () {
                                      _makePhoneCall('6281385784854');
                                    },
                                    child: Text(
                                      'Book Now',
                                      style:
                                          whiteTextStyle.copyWith(fontSize: 18),
                                    )),
                              ),
                            ],
                          ),
                        ]),
                      ),
                    ],
                  )),
            ],
          )),
    );
  }
}
