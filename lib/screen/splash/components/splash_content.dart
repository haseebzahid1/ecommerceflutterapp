import 'package:flutter/material.dart';
import '../../../size_mediaquery.dart';
import '../../../style.dart';


class SplashContent extends StatelessWidget {
  final String text, image;
  const SplashContent({Key? key, required this.text, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Text("TOKOTO",
          style:TextStyle(fontSize: getProportionateScreenWidth(30),color: kPrimaryColor,fontWeight: FontWeight.bold) ,
        ),
        Text(text,textAlign: TextAlign.center,),
        const Spacer(flex: 2,),
        Image.asset(image,
          height: getProportionateScreenHeight(265),
          // height: 300,
          width: double.infinity,
        ),
      ],
    );
  }
}
