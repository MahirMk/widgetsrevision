import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:widgetsrevision/UI/auth/SignInPage.dart';
import 'package:widgetsrevision/UI/auth/SignUpPage.dart';
import 'package:widgetsrevision/widgets/MyBottomSheet.dart';

import '../../widgets/MyPrimaryButton.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({Key? key}) : super(key: key);

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient:  LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops:  const [0.1, 0.4],
              colors: [
                Theme.of(context).primaryColor,
                Theme.of(context).canvasColor,
              ],
            ),
          ),
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 15.h),
                Image.asset('img/revision.png',width: 180,),
                SizedBox(height: 26.h),
                MyPrimaryButton(
                  onClick: (){
                    bottomSheet(context,const SignInPage());
                  },
                  btnText: "SIGN IN",
                ),
                SizedBox(height: 2.5.h),
                MyPrimaryButton(
                  onClick: (){
                    bottomSheet(context,const SignUpPage());
                  },
                  btnText: "SIGN UP",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
