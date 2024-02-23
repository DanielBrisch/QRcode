import 'package:flutter/material.dart';

class ContainerCreateQRcode extends StatelessWidget {
  // final VoidCallback? onPressed;
  // final Icon? icon;
  // final Text? label;
  // final double borderRadius;
  // final Color colorButton;
  // final Color? colorCircle;

  const ContainerCreateQRcode(
      {super.key,
      });

  @override
  Widget build(BuildContext context) {
  return Container(
    height: 455,
    width: 320,
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(15)),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 0,
          blurRadius: 5,
          offset: const Offset(0, 9),
        ),
      ],
    ),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 170,
            height: 175,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.red,
                  width: 4.0,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

}
