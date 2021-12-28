import 'package:flutter/material.dart';

import '../screen/splash/splash_screen.dart';
import '../size_mediaquery.dart';
import '../style.dart';

class NoAccountButton extends StatelessWidget {
  void Function()? onTab;
   NoAccountButton({Key? key,this.onTab}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Don't have an account?",
          style: TextStyle(fontSize: getProportionateScreenWidth(9)),
        ),
        InkWell(
          // onTap: onTab,
          onTap: (){

            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SplashScreen()));
          },
          child: Text("Sign Up",
            style: TextStyle(fontSize: getProportionateScreenWidth(9),color: kPrimaryColor),
          ),
        ),
      ],
    );
  }
}
