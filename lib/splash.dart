

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/gen/assets.gen.dart';
import 'package:flutter_application_1/home.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/onboarding.dart';

class SpslashScreen extends StatefulWidget {
  const SpslashScreen({Key? key}) : super(key: key);

  @override
  State<SpslashScreen> createState() => _SpslashScreenState();
}

class _SpslashScreenState extends State<SpslashScreen> {
  @override
  void initState() {
   Future.delayed(Duration(seconds: 2)).then((value) {
     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {

       return MAinScreen();
     }));

   });
    super.initState();
  }
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
              child: Assets.img.background.spalsh.image(fit: BoxFit.cover)
              
              ),
              Center(
                child: Assets.img.icons.logo.svg(width: 100)

              )
        ],
      ),
    );
  }
}
