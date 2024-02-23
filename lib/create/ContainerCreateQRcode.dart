import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ContainerCreateQRcode extends StatelessWidget {
  // final VoidCallback? onPressed;
  // final Icon? icon;
  // final Text? label;
  // final double borderRadius;
  // final Color colorButton;
  // final Color? colorCircle;

  ContainerCreateQRcode(
      {super.key,
      });

  TextEditingController? Dixi = TextEditingController();


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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 40,
          ),
          Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.red,
                  width: 4.0,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: Container(
                width: 155,
                alignment: Alignment.center,
                child: Image.asset('lib/assets/img/qrcode.png')
              ),
            ),
            const SizedBox(height: 20,),
            Container(
              width: 280,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              border: Border.all(
                color: Colors.grey,
                width: 2,
              ),
            ),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Dixi',
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 15.0),
              ),
              controller: Dixi,
            ),
          ),
          const Row(
            children: [

            ],
          )
        ]),            
      );
  }
}
