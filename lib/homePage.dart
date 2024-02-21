import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          height: size.height,
          decoration: const BoxDecoration(color: Colors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Container(
                        height: 70, // Altura igual ao raio do borderRadius
                        width: 70, // Largura igual ao raio do borderRadius
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        child: Image.asset('lib/assets/img/happyguy.png',
                            fit: BoxFit.cover),
                      ),
                    ),
                  ],
                ),
              ),
              // Expanded(
              //   //child: YourContentWidget(), // Adicione o conteúdo da sua tela aqui
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
