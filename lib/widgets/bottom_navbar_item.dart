import 'package:cozy_app/themes/colors.dart';
import 'package:flutter/material.dart';

class BottomNavbarItem extends StatelessWidget {
  const BottomNavbarItem(
      {super.key, required this.icon, required this.isActive});

  final String icon;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() {}),
      child: Column(
        children: [
          const Spacer(),
          Image.asset(
            icon,
            width: 26,
          ),
          const Spacer(),
          isActive
              ? Container(
                  width: 30,
                  height: 2,
                  decoration: BoxDecoration(
                      color: primaryPurple,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(1000))),
                )
              : Container()
        ],
      ),
    );
  }
}
