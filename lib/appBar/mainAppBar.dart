import 'package:flutter/material.dart';

class MainAppBar extends StatefulWidget {
  const MainAppBar({super.key});

  @override
  State<MainAppBar> createState() => _MainAppBar();
}

class _MainAppBar extends State<MainAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.all(Radius.circular(17))
      ),
      width: MediaQuery.of(context).size.width * 0.80,
      height: MediaQuery.of(context).size.height * 0.089,
      child:  Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          height: 57,
          width: MediaQuery.of(context).size.width * 0.25,
          child: ElevatedButton(
          onPressed: () {
            
          },
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.transparent), 
              elevation: MaterialStateProperty.all(0), 
              shape: MaterialStateProperty.all(
                const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)), // Borda sem curvatura
                ),
              ),
              side: MaterialStateProperty.all(BorderSide.none), // Sem borda
            ),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add_circle_outline, size: 26.0, color: Colors.black),
              SizedBox(height: 8.0),
              Text('Create', style: TextStyle(fontSize: 16.0)),
            ],
          ),
        ),
        ),
        SizedBox(
          height: 57,
          width: 96,
          child: ElevatedButton(
          onPressed: () {
            
          },
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.transparent), 
              elevation: MaterialStateProperty.all(0), 
              shape: MaterialStateProperty.all(
                const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)), // Borda sem curvatura
                ),
              ),
              side: MaterialStateProperty.all(BorderSide.none), // Sem borda
            ),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add_circle_outline, size: 26.0, color: Colors.black),
              SizedBox(height: 8.0),
              Text('Create', style: TextStyle(fontSize: 16.0)),
            ],
          ),
        ),
        ),
      ],
      )
    );
  }
  }