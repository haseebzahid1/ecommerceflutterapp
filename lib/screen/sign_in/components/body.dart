import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sign_up_login_form/size_mediaquery.dart';

import '../../../component/no_account.dart';
import '../../../style.dart';
import '../../form/components/social_icon.dart';
import '../../form/form.dart';
import '../../splash/splash_screen.dart';
import '../bodySignInScreen.dart';
class BodySignInScreen extends StatelessWidget {
  const BodySignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            width: double.infinity,
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 10,),
                  Text("Welcome Back",
                  style:TextStyle(
                    color: Colors.black,
                    fontSize: getProportionateScreenWidth(20),
                    fontWeight: FontWeight.bold,
                  ) ,),
                  Text("Sign in with your email and password \nor continue with social media",textAlign: TextAlign.center,),
                  SizedBox(height: SizeConfig.screenHeight! * 0.06,),
                  SignForm(),
                  SizedBox(height: 25,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialIcon(svgImage: 'assets/icons/google-icon.svg',onTap: (){},),
                        SocialIcon(svgImage: 'assets/icons/facebook-2.svg',onTap: (){},),
                      SocialIcon(svgImage: 'assets/icons/twitter.svg',onTap: (){},),
                    ],
                    
                  ),
                  SizedBox(height: 5,),
                  NoAccountButton(),
                ],
              ),
            ),
          ),
        ),
    );
  }
}

