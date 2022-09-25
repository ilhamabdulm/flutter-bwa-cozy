import 'dart:developer';

import 'package:cozy_app/models/space.dart';
import 'package:cozy_app/pages/error.dart';
import 'package:cozy_app/themes/colors.dart';
import 'package:cozy_app/themes/typhography.dart';
import 'package:cozy_app/widgets/facility_item.dart';
import 'package:cozy_app/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class DetailPage extends StatelessWidget {
  final Space space;

  DetailPage({required this.space});

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  Future<void> _launchInWebViewOrVC(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.inAppWebView,
    )) {
      log('LOST AREA');
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryWhite,
      body: SafeArea(
          bottom: false,
          child: Stack(
            children: [
              Image.network(
                space.imageUrl,
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
                                    space.name,
                                    style:
                                        blackTextStyle.copyWith(fontSize: 22),
                                  ),
                                  Text.rich(TextSpan(
                                      text: '\$${space.price}',
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
                                              color: index < space.rating
                                                  ? Color(0xffFF9376)
                                                  : Color(0xff989BA1),
                                            ),
                                            index < space.rating
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
                                      count: space.numberOfKitchens,
                                      label: 'Kitchens',
                                      image: 'assets/icons/icon-kitchen.png'),
                                  FacilityItem(
                                      count: space.numberOfBedrooms,
                                      label: 'Bedrooms',
                                      image: 'assets/icons/icon-bedroom.png'),
                                  FacilityItem(
                                      count: space.numberOfCupboards,
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
                                  itemCount: space.photos.length,
                                  itemBuilder: (context, index) {
                                    return ClipRRect(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(12)),
                                      child: Image.network(
                                        space.photos[index],
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
                                      Text(space.address,
                                          style: greyTextStyle.copyWith(
                                              fontSize: 14)),
                                      Text('${space.city}, ${space.country}',
                                          style: greyTextStyle.copyWith(
                                              fontSize: 14))
                                    ],
                                  ),
                                  IconButton(
                                      onPressed: () async {
                                        String url = space.mapUrl;
                                        await canLaunch(url)
                                            ? launch(url)
                                            : Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: ((context) =>
                                                        ErrorPage())));
                                      },
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
                              PrimaryButton(
                                  label: 'Book Now',
                                  width: MediaQuery.of(context).size.width -
                                      (2 * 24),
                                  action: () {
                                    _makePhoneCall(space.phone);
                                  })
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
