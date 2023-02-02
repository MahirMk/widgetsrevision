import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

bottomSheet(context,Widget? call){
  return
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(30),),
    ),
    builder: (BuildContext context)
    {
      return SizedBox(height: 70.h, child:  call);
    },
  );
}
