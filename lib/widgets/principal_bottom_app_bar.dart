import 'package:flutter/material.dart';
import 'package:qrcode/utils/color_utils.dart';

class PrincipalBottomAppBar extends StatefulWidget {
  const PrincipalBottomAppBar({super.key});

  @override
  State<PrincipalBottomAppBar> createState() => _PrincipalBottomAppBar();
}

class _PrincipalBottomAppBar extends State<PrincipalBottomAppBar> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: ColorUtils().faintGray,
      shape: const CircularNotchedRectangle(),
      child: Material(
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.history),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.add_circle_outline),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.qr_code_scanner_outlined),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.mail_outlined),
            ),
          ],
        ),
      ),
    );
  }
}
