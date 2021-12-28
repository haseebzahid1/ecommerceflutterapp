import 'package:flutter/material.dart';
import 'package:sign_up_login_form/size_mediaquery.dart';

import '../../../component/no_account.dart';
import '../../form/components/form_button.dart';
import '../../form/components/inputfield.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(height: getProportionateScreenHeight(40),),
              Text("Forgot Password",
              style: TextStyle(
                fontSize: getProportionateScreenWidth(14),
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),),
              Text("Please enter your email and we will send \nyou a link to return to your account",textAlign: TextAlign.center,),
              ForgotPassForm(),
            ],
          ),
        ),
      ),
    );
  }
}


class ForgotPassForm extends StatefulWidget {
  const ForgotPassForm({Key? key}) : super(key: key);

  @override
  _ForgotPassFormState createState() => _ForgotPassFormState();
}

class _ForgotPassFormState extends State<ForgotPassForm> {
  String email = "";
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    onSaveUserEmail(String? value){
      // Username = value!;
      email = value ?? "";
    }
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.always,
      child: Column(
        children: [
          SizedBox(height: getProportionateScreenHeight(80),),
          InputField(
            labelText: "Email",
            suffixIcon: Icon(Icons.email),
            validate: validateUserEmail,
            onSaved: onSaveUserEmail,
            initialValue: "enter your email",
          ),
          SizedBox(height: getProportionateScreenHeight(80),),
          // SizedBox(height: SizeConfig.screenHeight! * 0.1,),
          FormButton(
            onTap: (){
              if(_formKey.currentState!.validate()){
                _formKey.currentState!.save();
                print("{$email}");
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("VaLIDATION PASSED"))
                );
              }else{
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("VALIDATION ERROR")));
              }
            },
            bgcolor: Colors.deepOrange.withOpacity(0.7), color: Colors.white,
            width: double.infinity, textButton: 'Continue',),
          SizedBox(height: getProportionateScreenHeight(80),),
             NoAccountButton(),
        ],
      ),
    );
  }
  String? validateUserEmail(String? value){
    if(value==null || value.isEmpty){
      return "please enter your user Email";
    }else if(value.length<=3 ){
      return "Email length must be 3 or greater";
    }else if(value.length>=18){
      return "Email length must be 18 character or less";
    }else{
      return null;
    }
  }
}
