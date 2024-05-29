import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPage();
}

class _InfoPage extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Help and feedback',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          padding:
              EdgeInsets.only(left: size.width * 0.2, top: size.height * 0.050),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.qr_code_2_outlined,
                    size: 35,
                    color: Colors.deepPurple,
                  ),
                  SizedBox(
                    width: size.width * 0.03,
                  ),
                  const Text(
                    'Supported codes',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.queue,
                    size: 35,
                    color: Colors.deepPurple,
                  ),
                  SizedBox(
                    width: size.width * 0.03,
                  ),
                  const Text(
                    'Tips for scanning',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.warning_amber_rounded,
                    size: 35,
                    color: Colors.deepPurple,
                  ),
                  SizedBox(
                    width: size.width * 0.03,
                  ),
                  const Text(
                    '"Scanning dont work"',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.cloud_circle_outlined,
                    size: 35,
                    color: Colors.deepPurple,
                  ),
                  SizedBox(
                    width: size.width * 0.03,
                  ),
                  const Text(
                    'FAQ',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.forward_to_inbox,
                    size: 35,
                    color: Colors.deepPurple,
                  ),
                  SizedBox(
                    width: size.width * 0.03,
                  ),
                  const Text(
                    'Tell ys about it',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
