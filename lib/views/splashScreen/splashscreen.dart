import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:newsappp/utils/animation_constant.dart';
import 'package:newsappp/views/bottomnavigationbar/bottomnavigationbar.dart';


class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    
    super.initState();
       Future.delayed( Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>Bottomnavigationbar1() ),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 110,),
          Container(
            height: 350,
            width: 350,
            child: Lottie.asset(AnimationConstant.newsAnimation
            ),
            
          ),
          Center(
            child: Text("NEWS Today",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 40,
            ),),
          ),
        ],
      ) ,
    );
  }
}