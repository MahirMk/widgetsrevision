import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

containerWithRadius(context,IconData? iconName){
  return
  Container(
    height: 5.h,
    width: 5.h,
    decoration: BoxDecoration(
      color: Theme.of(context).backgroundColor,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(120),
        topRight: Radius.circular(120),
        bottomLeft: Radius.circular(120),
        bottomRight: Radius.circular(5.0),
      ),
    ),
    child: Icon(iconName,color: Theme.of(context).canvasColor),
  );
}