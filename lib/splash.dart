import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:world_times/constants/colors.dart';
import 'package:world_times/view/home/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState(){
    super.initState();

    Future.delayed(const Duration(seconds: 2)).then((value){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        toolbarHeight: 0,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: dark
        ),
      ),
      backgroundColor: dark,
      body: Center(
        child: Image.asset("images/DOP.png"),
      ),
    );
  }
}
