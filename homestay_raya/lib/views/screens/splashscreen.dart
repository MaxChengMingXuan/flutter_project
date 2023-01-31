//async: library for timer
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:homestay_raya/views/screens/mainscreen.dart';

import '../../models/user.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    User user = User(
        id: "0",
        email: "unregistered",
        name: "unregistered",
        address: "na",
        phone: "0123456789",
        regdate: "0",
        credit: '0');
    Timer(
        const Duration(seconds: 2),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (content) => MainScreen(user: user))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      colorFilter: ColorFilter.mode(
                          Color.fromARGB(135, 37, 37, 37), BlendMode.darken),
                      image: AssetImage('assets/images/homestayhigh.jpg'),
                      fit: BoxFit.cover))),
          Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: const [
                      Text(
                        "Homestay",
                        style: TextStyle(
                            fontFamily: 'Homestay',
                            fontSize: 80,
                            // fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                      Text(
                        "Raya",
                        style: TextStyle(
                            fontFamily: 'Homestay',
                            fontSize: 80,
                            // fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 70,
                    width: 70,
                    child: CircularProgressIndicator(
                        strokeWidth: 7,
                        color: Color.fromARGB(255, 226, 239, 240)),
                  ),
                  const Text(
                    "Book and Stay",
                    style: TextStyle(
                        fontFamily: 'Homestay',
                        fontSize: 20,
                        color: Color.fromARGB(255, 255, 255, 255)),
                  )
                ]),
          )
        ],
      ),
    );
  }
}
