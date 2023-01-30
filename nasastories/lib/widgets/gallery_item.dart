import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'custom_image.dart';

class PopularItem extends StatelessWidget {
  PopularItem(
      {Key? key,
      required this.image_url,
      this.sub_title,
      this.onTap,
      this.raduis = 20})
      : super(key: key);
  final double raduis;
  final GestureTapCallback? onTap;
  final String image_url;
  final String? sub_title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 200,
        height: 350,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(raduis)),
        child: Stack(
          children: [
            Container(
              child: CustomImage(
                image_url,
                radius: raduis,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(raduis),
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black.withOpacity(.5),
                        Colors.white.withOpacity(.01),
                      ])),
            ),
            Positioned(
              bottom: 12,
              left: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      width: 200,
                      child: Text(
                        sub_title!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      )),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      //SvgPicture.asset("assets/icons/tag-dollar.svg", width: 17, height: 17, color: Colors.white,),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "NASA/Keegan Barber",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
