import 'package:flutter/material.dart';
import 'package:qrcode/utils/color_utils.dart';

class ContainerOptionButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Icon icon;
  final String label;
  final Color colorCircle;
  final double borderRadius = 20;
  final Color colorButton = Colors.white;

  const ContainerOptionButton({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.label,
    required this.colorCircle,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: colorButton,
          borderRadius: BorderRadius.circular(borderRadius),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 0,
              blurRadius: 5,
              offset: const Offset(0, 9),
            ),
          ],
        ),
        child: Container(
          padding: EdgeInsets.only(
            left: 15,
            right: 15,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: colorCircle,
                    ),
                    child: icon,
                  ),
                  const SizedBox(width: 15),
                  Text(
                    label,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Icon(
                Icons.keyboard_arrow_right_outlined,
                color: ColorUtils().purple,
                size: size.aspectRatio * 50,
              )
            ],
          ),
        ),
      ),
    );
  }
}
