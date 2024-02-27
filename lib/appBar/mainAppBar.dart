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
      width: 310,
      height: 80,
      child:  Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: () {
            // Adicione aqui a lógica para a ação do botão
          },
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add_circle_outline, size: 32.0, color: Colors.black),
              SizedBox(height: 8.0),
              Text('Adicionar', style: TextStyle(fontSize: 16.0)),
            ],
          ),
        ),
        IconButton(onPressed: () {
          
        }, 
        icon: const Icon(Icons.add_circle_outline, color: Colors.black,))
      ],
      )
    );
  }
  }