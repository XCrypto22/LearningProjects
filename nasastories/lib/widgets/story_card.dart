//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/theme.dart';
import 'custom_image.dart';

class SettingItem extends StatelessWidget {
  final String title;
  final String? image;
  final Color? leadingIconColor;
  final GestureTapCallback? onTap;
  const SettingItem(
      {Key? key,
      required this.title,
      this.image,
      this.onTap,
      this.leadingIconColor = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(left: 15, right: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: cardColor,
          boxShadow: [
            BoxShadow(
              color: shadowColor.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.only(top: 8, bottom: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: image != null
                ? [
                    Container(
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: primary,
                          ),
                          shape: BoxShape.circle),
                      child: CustomImage(
                        image!,
                        width: 100,
                        height: 100,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Text(
                        title,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: labelColor,
                      size: 14,
                    )
                  ]
                : [
                    Expanded(
                      child: Text(
                        title,
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: labelColor,
                      size: 14,
                    )
                  ],
          ),
        ),
      ),
    );
  }
}
