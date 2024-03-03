import 'package:flutter/material.dart';
import 'package:qrcode/service/qrCodeService.dart';

class ContainerHistoryQR extends StatefulWidget {
  final double? width;

  const ContainerHistoryQR({super.key, required this.width});

  @override
  State<ContainerHistoryQR> createState() => _ContainerHistoryQR();
}

class _ContainerHistoryQR extends State<ContainerHistoryQR> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: widget.width,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 0.1),
          borderRadius: const BorderRadius.all(Radius.circular(18))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 15,
            decoration: const BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(18),
                  bottomLeft: Radius.circular(18)),
            ),
          ),
          const Icon(Icons.qr_code_scanner, size: 140),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Code type: ${QRService.type}'),
              Text('Element: ${QRService.element}'),
              Text('Date: ${QRService.date}'),
            ],
          ),
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.arrow_forward_ios_outlined))
        ],
      ),
    );
  }
}
