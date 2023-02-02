import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MyPrimaryButton extends StatelessWidget {

  final VoidCallback? onClick;
  final String? btnText;
  final Widget? myIcon;
  final Color? myColor;

  const MyPrimaryButton(
      {super.key, required this.onClick, this.btnText, this.myIcon, this.myColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 92.w,
      height: 5.h,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: myColor??Theme.of(context).primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(60),
          ),
        ),
        onPressed: onClick,
        icon: myIcon ?? const SizedBox.shrink(),
        label: Text(btnText!, style: Theme.of(context).textTheme.button),
      ),
    );
  }
}
