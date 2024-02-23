import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:qrcode/home/homePage.dart';

class LoginAppPage extends StatefulWidget {
  const LoginAppPage({super.key});

  @override
  State<LoginAppPage> createState() => _LoginAppPage();
}

class _LoginAppPage extends State<LoginAppPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    });

    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        decoration: const BoxDecoration(color: Colors.deepPurpleAccent),
        child: Column(
          children: [
            SizedBox(
              width: size.width,
              height: size.height,
              child: const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.qr_code_outlined, size: 200, color: Colors.white,),
                Text('QRcode', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 50),),
                Text('storage', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white,fontSize: 30),),
                SizedBox(height: 200,),
              ],
            ),
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('version 1.0', style: TextStyle(color: Colors.white),),
              ] 
            )
          ],
        ),
      ) 
        );
  }
}