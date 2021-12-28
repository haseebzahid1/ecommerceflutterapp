import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../size_mediaquery.dart';
class SocialIcon extends StatelessWidget {
  final String svgImage;
  void Function()? onTap;
   SocialIcon({Key? key, required this.svgImage,this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   InkWell(
      onTap:onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(0)),
        padding: EdgeInsets.all(getProportionateScreenWidth(4)),
        width: getProportionateScreenWidth(40),
        height: getProportionateScreenHeight(40),
        decoration:BoxDecoration(
          color: Color(0xfff5f6f9),
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(svgImage),
      ),
    );
  }
}
