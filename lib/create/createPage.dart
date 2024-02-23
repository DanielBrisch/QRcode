import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qrcode/create/ContainerCreateQRcode.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePage();
}

class _CreatePage extends State<CreatePage> {
  @override
  Widget build(BuildContext context) {

     SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));

    Size size = MediaQuery.of(context).size;

    return 
      Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: const Text('Create', style: TextStyle(color: Colors.white),),
          leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white), // Define a cor do ícone de voltar como preto
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        ),
      body: SingleChildScrollView(
        child: SizedBox(
        child: Stack(
        children: [
          Column(
            children: [
              Container(
                height: size.height / 2.3,
                color: Colors.deepPurple,
              ),
              Container(
                height: size.height / 2.3,
                color: Colors.white,
              ),
            ],
          ),
          Positioned(
            top: size.height * 0.03, 
            left: size.width * 0.1,
            right: size.width * 0.1,
            child: ContainerCreateQRcode(),
          ),
            ]
          ),
      ),
      )
      ); 
      
      
  }
}
