// ignore_for_file: deprecated_member_use, prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:minerva_frontend/screens/home/homepage.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key,this.title}) : super(key: key);

  final String title;

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  bool _isVisible = false;

  _SplashScreenState(){
    Timer(const Duration(milliseconds: 2000), (){
      setState(() {
       Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const HomePage()), (route) => false);
      });
    });

    Timer(
      const Duration(milliseconds: 10),(){
        setState(() {
          _isVisible = true; // Now it is showing fade effect and navigating to Login page
        });
      }
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        decoration:  BoxDecoration(
          gradient:  LinearGradient(
            colors: [Theme.of(context).accentColor, Theme.of(context).primaryColor],
            begin: const FractionalOffset(0, 0),
            end: const FractionalOffset(1.0, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp,
          ),
        ),
        child: AnimatedOpacity(
          opacity: _isVisible ? 1.0 : 0,
          duration: const Duration(milliseconds: 1200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  height: 120.0,
                  width: 140.0,
                  child: Center(
                    child: Image.asset("assets/logo.jpg",fit: BoxFit.cover,),
                  ),
                  decoration: BoxDecoration(
                    // shape: BoxShape.circle,
                    color: Colors.white,
                    borderRadius : BorderRadius.circular(05),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 2.0,
                        offset: const Offset(5.0, 3.0),
                        spreadRadius: 2.0,
                      )
                    ]
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              const Text("Minerva Flutter Test",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w900),)
            ],
          ),
        ),
      
      ),
    );
  }
}