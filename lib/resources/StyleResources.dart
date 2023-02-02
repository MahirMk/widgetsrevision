import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class StyleResources {
  static Color fbColor = const Color(0xFF3B5998);
  static Color googleColor = const Color(0xFFEA4335);
  static Color blackColor = const Color(0xFF000000);
  static Color errorColor =  Colors.red;
  static TextStyle purpleTxtDarkColor = TextStyle(color: Colors.purple.shade900);


  static outLineBorder(context,[Color? myColor])
  {
    return
    OutlineInputBorder(
        borderSide:  BorderSide(color: myColor??Theme.of(context).primaryColor),
        borderRadius: BorderRadius.circular(20.0)
    );
  }

  static InputDecoration textFieldInputDecoration(context,String? myLabel , Widget? myIcon,String? myHintText) {
    return
    InputDecoration(
        errorBorder: outLineBorder(context,StyleResources.errorColor),
        focusedErrorBorder: outLineBorder(context,StyleResources.errorColor),
        disabledBorder: outLineBorder(context,Theme.of(context).disabledColor),
        enabledBorder: outLineBorder(context),
        focusedBorder:  outLineBorder(context),
        labelText: myLabel,
        labelStyle: TextStyle(color: Theme.of(context).primaryColor),
        suffixIcon: myIcon,
        hintText: myHintText,
        hintStyle: TextStyle(wordSpacing: 1.w),
    );
  }
}