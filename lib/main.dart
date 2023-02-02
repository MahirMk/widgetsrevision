import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:widgetsrevision/UI/pages/AuthenticationPage.dart';
import 'package:widgetsrevision/resources/StyleResources.dart';

import 'UI/other/HomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return GestureDetector(
              onTap: ()=> FocusManager.instance.primaryFocus?.unfocus(),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.purple,
              primaryColor: const Color(0xFF5C056C),
              canvasColor: Color(0xFFFFFFFF),
              backgroundColor:  Color(0xB66E0381),
              fontFamily: GoogleFonts.poppins().fontFamily,
              textTheme: const TextTheme(
                headline1: TextStyle(),
                headline2: TextStyle(),
                headline3: TextStyle(),
                headline4: TextStyle(),
                headline5: TextStyle(),
                headline6: TextStyle(),
                subtitle1: TextStyle(),
                subtitle2: TextStyle(),
                bodyText1: TextStyle(color: Color(0xFF5C056C)),
                bodyText2: TextStyle(),
                button: TextStyle(color: Color(0xFFFFFFFF)),
                caption: TextStyle(),
                overline: TextStyle(),
              ),
            ),
            home: const AuthenticationPage(),
          ),
        );
      },
      maxTabletWidth: 900, // Optional
    );
  }
}
