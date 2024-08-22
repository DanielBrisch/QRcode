import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qrcode/service/qr_code_service.dart';
import 'package:share/share.dart';

class ContainerHistoryQR extends StatefulWidget {
  final double? width;
  final Map<String, dynamic> row;

  const ContainerHistoryQR({super.key, required this.width, required this.row});

  @override
  State<ContainerHistoryQR> createState() => _ContainerHistoryQR();
}

class _ContainerHistoryQR extends State<ContainerHistoryQR> {
  @override
  void initState() {
    super.initState();
  }

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
            decoration: BoxDecoration(
              color: Color(int.parse(widget.row['COLOR'], radix: 16)),
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(18),
                  bottomLeft: Radius.circular(18)),
            ),
          ),
          Column(
            children: [QrImageView(data: '${widget.row['DATA']}', size: 140)],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Code type: ${QRService.type}'),
              Text('Element: ${QRService.element}'),
              Text('Date: ${widget.row['DATE']}'),
            ],
          ),
          IconButton(
              onPressed: () {
                Share.share('${widget.row['DATA']}');
              },
              icon: const Icon(Icons.arrow_forward_ios_outlined))
        ],
      ),
    );
  }
}
