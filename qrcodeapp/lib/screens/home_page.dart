import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 45, left: 20, right: 20),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: size.width * 0.2,
                    height: size.height * 0.1,
                    child: const CircleAvatar(
                      backgroundImage: AssetImage('./lib/assets/person.jpg'),
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.04,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Daniel \nBrisch',
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      Text('Mobile Developer'),
                      Column(children: [])
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: size.height * 0.05, left: size.width * 0.12),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.info_outline)),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.settings)),
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
