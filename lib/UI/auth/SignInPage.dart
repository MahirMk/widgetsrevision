import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:widgetsrevision/UI/auth/SignUpPage.dart';
import 'package:widgetsrevision/resources/StyleResources.dart';
import 'package:widgetsrevision/widgets/ContainerWithRadius.dart';
import 'package:widgetsrevision/widgets/MyBottomSheet.dart';
import 'package:widgetsrevision/widgets/MyPrimaryButton.dart';

import '../../utils/constants.dart';
import '../../widgets/MyTextFormField.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  final _formKey = GlobalKey<FormState>();
  final _email = GlobalKey<FormFieldState>();
  final _psd = GlobalKey<FormFieldState>();

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  bool? check = true;
  bool? obscureText = true;

  void _toggle() {
    setState(() {
      obscureText = !obscureText!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
        key: _formKey,
        //autovalidateMode: AutovalidateMode.always,
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal : 2.6.w),
          child: Column(
            children: [
              SizedBox(height: 1.6.h),
              Text("Sign In",style: Theme.of(context).textTheme.bodyText1),
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
                  onClick: (){
                    _formKey.currentState!.validate();

                  },
                btnText: "Sign In",
              ),
              Row(
                children: [
                  Checkbox(
                      value: check,
                      onChanged: (val)
                      {
                        setState(() {
                          check = val;
                        });
                      }
                  ),
                  Text("Remember Me",style: Theme.of(context).textTheme.bodyText1,),
                  Padding(
                    padding: EdgeInsets.only(left: 17.3.w),
                    child: TextButton(
                      onPressed: (){},
                      child:  Text("Forgot Password?",style: Theme.of(context).textTheme.bodyText1,),
                    ),
                  ),
                ],
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
              SizedBox(height: 3.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have account yet ?",style: Theme.of(context).textTheme.bodyText1,),
                  TextButton(
                      onPressed: (){
                        Navigator.of(context).pop();
                        bottomSheet(context, const SignUpPage());
                      },
                      child: Text("Sign Up",style: TextStyle(color: Theme.of(context).primaryColor),)
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
