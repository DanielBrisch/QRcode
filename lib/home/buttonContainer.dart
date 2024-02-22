import 'package:flutter/material.dart';

class ContainerButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Icon? icon;
  final Text? label;
  final double borderRadius;
  final Color colorButton;
  final Color? colorCircle;

  const ContainerButton(
      {super.key,
      this.onPressed,
      this.icon,
      this.label,
      this.borderRadius = 8.0,
      this.colorButton = Colors.white,
      this.colorCircle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 160,
        width: 150,
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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40), color: colorCircle),
              child: icon!,
            ),
            const SizedBox(height: 20),
            label!,
          ],
        ),
      ),
    );
  }
}
