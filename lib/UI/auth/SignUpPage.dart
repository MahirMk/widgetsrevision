import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:widgetsrevision/UI/auth/SignInPage.dart';
import 'package:widgetsrevision/UI/other/HomePage.dart';

import '../../resources/StyleResources.dart';
import '../../utils/constants.dart';
import '../../widgets/ContainerWithRadius.dart';
import '../../widgets/MyBottomSheet.dart';
import '../../widgets/MyPrimaryButton.dart';
import '../../widgets/MyTextFormField.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  final _formKey = GlobalKey<FormState>();
  final _username = GlobalKey<FormFieldState>();
  final _call = GlobalKey<FormFieldState>();
  final _email = GlobalKey<FormFieldState>();
  final _psd = GlobalKey<FormFieldState>();

  TextEditingController user = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController phone = TextEditingController();

  bool? obscureText = true;

  void _toggle() {
    setState(() {
      obscureText = !obscureText!;
    });
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal : 2.5.w,vertical: 1.5.h),
            child: Column(
              children: [
                SizedBox(height: 1.6.h),
                Text("Sign Up",style: Theme.of(context).textTheme.bodyText1),
                Row(
                  children: [
                    containerWithRadius(context, Icons.person),
                     Expanded(
                      child: MyTextFormField(
                        myController: user,
                        myTextInputType: TextInputType.text,
                        myHintText: 'Name',
                        myLabel: "User Name",
                        textFieldKey: _username,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'This field is required';
                          }
                          return null;
                        },
                        onChanged : (value) {
                          setState(() {
                            _username.currentState!.validate();
                          });
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    containerWithRadius(context, Icons.call),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal : 0.5.w),
                        child: MyTextFormField(
                          myController: phone,
                          textFieldKey: _call,
                          myTextInputType: TextInputType.phone,
                          myHintText: 'Call',
                          myLabel: "Phone Number",
                          maxLength: 10,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'This field is required';
                            }
                            if (value.length < 10) {
                              return 'please enter valid phone number';
                            }
                            // if (!Constants.regPhone.hasMatch(value)) {
                            //   return "Please enter a valid phone number";
                            // }
                            return null;
                          },
                          onChanged : (value) {
                            setState(() {
                              _call.currentState!.validate();
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    containerWithRadius(context, Icons.person),
                    Expanded(
                      child: MyTextFormField(
                        myController: email,
                        myTextInputType: TextInputType.emailAddress,
                        myHintText: 'Email',
                        myLabel: "Email Address",
                        textFieldKey: _email,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'This field is required';
                          }
                          if (!Constants.regEmail.hasMatch(value)) {
                            return "Please enter a valid email address";
                          }
                          return null;
                        },
                        onChanged : (value) {
                          setState(() {
                            _email.currentState!.validate();
                          });
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    containerWithRadius(context, Icons.password),
                    Expanded(
                      child: MyTextFormField(
                        myController: password,
                        myTextInputType: TextInputType.emailAddress,
                        myHintText: 'Security',
                        myLabel: "Password",
                        textFieldKey: _psd,
                        obSecureText: obscureText,
                        validator: (value){
                          if (value == null || value.isEmpty) {
                            return 'Please enter Password';
                          }
                          if (value.length < 8) {
                            return 'Must be more than 8 character';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          _psd.currentState!.validate();

                        },
                        myIcon: IconButton(
                            onPressed: () {
                              _toggle();
                            },
                            icon: (obscureText! ? Icon(Icons.visibility,color: Theme.of(context).primaryColor,): Icon(Icons.visibility_off,color: Theme.of(context).primaryColor,))
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 2.h),
                MyPrimaryButton(
                  onClick: () async {

                    // Map<String,dynamic> allData = {
                    //   "User": user.text.toString(),
                    //   "Phone": phone.text.toString(),
                    //   "Email": email.text.toString(),
                    //   "Password": password.text.toString(),
                    // };

                    if(_formKey.currentState!.validate())
                    {
                     SharedPreferences prefs = await SharedPreferences.getInstance();
                     prefs.setBool('isLogin', true);

                      //prefs.setString("userData", jsonEncode(allData));

                      Navigator.pushAndRemoveUntil(context,
                          MaterialPageRoute(builder: (_) => HomePage()),(route)=> false);
                      //
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(builder: (context)=> HomePage())
                      // );
                    }
                    else
                    {
                      print("error");
                    }
                  },
                  btnText: "Sign Up",
                ),
                Column(
                  children: [
                    SizedBox(height: 1.h),
                    MyPrimaryButton(
                        myColor: StyleResources.blackColor,
                        myIcon: const Icon(Icons.apple),
                        onClick: (){},
                        btnText: "Sign In With Apple"
                    ),
                    SizedBox(height: 2.h),
                    Row(
                      children: [
                        Expanded(
                          child: MyPrimaryButton(
                            myColor: StyleResources.googleColor,
                            onClick: (){},
                            btnText: "GOOGLE",
                          ),
                        ),
                        const SizedBox(width: 6),
                        Expanded(
                          child: MyPrimaryButton(
                            myColor:  StyleResources.fbColor,
                            onClick: (){},
                            btnText: "FACEBOOK",
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 1.h),
                  ],
                ),
                SizedBox(height: 2.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("already have account yet ?",style: Theme.of(context).textTheme.bodyText1,),
                    TextButton(
                        onPressed: (){
                          Navigator.of(context).pop();
                          bottomSheet(context, const SignInPage());
                        },
                        child: Text("Sign In",style: TextStyle(color: Theme.of(context).primaryColor),)
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
