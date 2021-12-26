import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../size_mediaquery.dart';
import '../../../style.dart';



class SignForm extends StatefulWidget {
  String? initialValue;
  String? hintText;
  String? labelText;
  Widget? prefixIcon;
  bool isPassword;
  void Function(String)? onChanged;
  void Function(String?)? onSaved;
  String? Function(String?)? validate;
   SignForm({Key? key,
     this.initialValue,
     required this.isPassword,
     this.prefixIcon,
     this.labelText,
     this.hintText,
   }) : super(key: key);

  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            validator: ,
            decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.always,
              labelText: "Email",
              hintText: "Enter your emial",
              suffixIcon: Padding(
                padding:  EdgeInsets.fromLTRB(
                  0,
                  getProportionateScreenWidth(8),
                  getProportionateScreenWidth(5),
                  getProportionateScreenWidth(8),
                ),
                child: SvgPicture.asset("assets/icons/Mail.svg"),
              ),
              contentPadding:  const EdgeInsets.symmetric(
                horizontal: 42,
                vertical: 20,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(28),
                borderSide: BorderSide(color: kTextColor,width: 2),
                gapPadding: 10,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(28),
                borderSide: BorderSide(color: kTextColor,width: 2),
                gapPadding: 10,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(28),
                borderSide: BorderSide(color: kTextColor,width: 2),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
