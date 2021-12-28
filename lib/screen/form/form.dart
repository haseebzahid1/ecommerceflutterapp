import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../size_mediaquery.dart';
import '../../style.dart';
import '../forgot_password/forgetpasswordscreen.dart';
import '../login_success/login_success_screen.dart';
import 'components/form_button.dart';
import 'components/inputFieldSuffixIcon.dart';
import 'components/inputfield.dart';



class SignForm extends StatefulWidget {

   SignForm({Key? key,}) : super(key: key);

  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  bool isHiddenPasswrod = true;
  String email = "";
  String password = "";
  String confirmPassword = "";
  final _formKey = GlobalKey<FormState>();
  bool remember = false;
  @override
  Widget build(BuildContext context) {
    onSaveUserEmail(String? value){
      // Username = value!;
      email = value ?? "";
    }
    onSavedpassword (String? value){
      setState(() {
        password != value;
      });
    }
    onSavedConfirmPassword(String? value){
      setState(() {
        // confirmPassword = value ?? "";
        confirmPassword != value;
      });
    }
    onChangedPassword(String value){
      setState(() {
        password = value;
      });
    }
    onChangedConfirmPassword(String value){
      setState(() {
        confirmPassword = value;
      });
    }
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.always,
      child: Column(
        children: [
          InputField(
            labelText: "Email",
            suffixIcon: Icon(Icons.email),
            validate: validateUserEmail,
            onSaved: onSaveUserEmail,
            initialValue: "enter your email",
          ),
          const SizedBox(height: 30,),
          InputFieldSuffixIcon(
            labelText: "Password",
            isPassword: true,
            onSaved: onSavedpassword,
            onChanged: onChangedPassword,
            validate: validatePassword,
            initialValue: "123456",
          ),
          SizedBox(height: 30,),
          InputFieldSuffixIcon(
            labelText: "Confirm Password",
            isPassword: true,
            onSaved: onSavedConfirmPassword,
            onChanged: onChangedConfirmPassword,
            validate: validateConfirmPassword,
            initialValue: "123456",
          ),

          const SizedBox(height: 15,),
          Row(
            children: [
              Checkbox(
                  value: remember,
                  activeColor: kPrimaryColor,
                  onChanged: (bool? value){
                    setState(() {
                      remember != value;
                    });
                  }
              ),
              Text("remember me"),
              Spacer(),
              InkWell(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ForgotPasswordScreen()));
                },
                  child: Text("Forgot Password",style: TextStyle(decoration: TextDecoration.underline)
                    ,)),
            ],
          ),
          const SizedBox(height: 15,),
          FormButton(
            onTap: (){
              if(_formKey.currentState!.validate()){
                _formKey.currentState!.save();
                print("{$email,$password,$confirmPassword}");
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("VaLIDATION PASSED"))
                );
              }else{
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("VALIDATION ERROR")));
              }
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginSuccessScreen()));
            },
            bgcolor: Colors.deepOrange.withOpacity(0.7), color: Colors.white,
            width: double.infinity, textButton: 'Continue',),
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
  String? validatePassword(String? value){
    if (value == null || value.isEmpty) {
      return 'Password cannot be empty';
    }else if(value.length>=8){
      return "Passwrod length must be 8 character or less";
    } else {
      return null;

    }

  }
  String? validateConfirmPassword(String? value){
    if(value==null  || value==""){
      return "Confirm password is required";
    }
    else if(value.length>=8){
      return "password must 8 charactor long";
    }
    else if(password != confirmPassword){
      return "password not match";
    }
    return null;
  }
}
