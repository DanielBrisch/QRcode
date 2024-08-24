import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qrcode/routes/routes.dart';
import 'package:qrcode/stores/home_store.dart';
import 'package:qrcode/utils/color_utils.dart';
import 'package:qrcode/widgets/button_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    HomeStore store = HomeStore();
    Size size = MediaQuery.of(context).size;

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));

    final List<ContainerButton> listaDeContainer = [
      ContainerButton(
        onPressed: () => Navigator.pushNamed(context, AppRoutes.create),
        colorCircle: ColorUtils().purple,
        icon: const Icon(
          Icons.add_circle_outline,
          color: Colors.white,
          size: 35,
        ),
        label: const Text(
          'CREATE',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      ContainerButton(
        onPressed: () => Navigator.pushNamed(context, AppRoutes.scan),
        icon: const Icon(Icons.qr_code_scanner_outlined,
            color: Colors.white, size: 35),
        colorCircle: Colors.redAccent,
        label: const Text(
          'SCAN',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      ContainerButton(
        onPressed: () => Navigator.pushNamed(context, AppRoutes.send),
        icon: const Icon(Icons.mail_outlined, color: Colors.white, size: 40),
        colorCircle: Colors.yellow,
        label: const Text(
          'SEND',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      ContainerButton(
        onPressed: () {},
        icon: const Icon(
          Icons.print_outlined,
          color: Colors.white,
          size: 40,
        ),
        colorCircle: Colors.green,
        label: const Text(
          'PRINT',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      )
    ];

    Size screenSize = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: ScopedBuilder<HomeStore, HomeState>(
          store: store,
          onState: (_, state) {
            return Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromRGBO(220, 226, 232, 1.0),
                    Colors.white,
                  ],
                ),
              ),
              child: Container(
                padding: const EdgeInsets.only(
                  left: 25,
                  right: 25,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 30),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () => Navigator.pushNamed(
                                    context, AppRoutes.profile),
                                child: Container(
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: ColorUtils().purple,
                                      width: 4.0,
                                    ),
                                  ),
                                  child: const CircleAvatar(
                                    radius: 35,
                                    backgroundImage:
                                        AssetImage('lib/assets/happyguy.png'),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Daniel',
                                    style: GoogleFonts.roboto(
                                      fontSize: size.aspectRatio * 35,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Text(
                                    'Cibolli',
                                    style: GoogleFonts.roboto(
                                      fontSize: size.aspectRatio * 35,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Text(
                                    'Mobile developer',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey[700],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Container(
                            height: size.height * 0.05,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(8),
                                right: Radius.circular(8),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.info_outline),
                                  onPressed: () => Navigator.pushNamed(
                                      context, AppRoutes.info),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.settings_outlined),
                                  onPressed: () => Navigator.pushNamed(
                                      context, AppRoutes.settings),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: screenSize.height * 0.02,
                    ),
                    Text(
                      'Welcome',
                      style: GoogleFonts.roboto(
                          fontSize: size.aspectRatio * 80, color: Colors.black),
                    ),
                    Text(
                      'to QRcode App',
                      style: GoogleFonts.roboto(
                          fontSize: size.aspectRatio * 80, color: Colors.black),
                    ),
                    Expanded(
                      child: GridView.count(
                        physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.all(0),
                        crossAxisCount: 2,
                        children: List.generate(
                          listaDeContainer.length,
                          (index) {
                            return Container(
                              padding: const EdgeInsets.only(
                                top: 10,
                                left: 10,
                                right: 10,
                              ),
                              child: listaDeContainer[index],
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      width: screenSize.width * 1,
                      child: FloatingActionButton(
                        onPressed: () =>
                            Navigator.pushNamed(context, AppRoutes.history),
                        backgroundColor: ColorUtils().purple,
                        child: const Text(
                          'HISTORY',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: screenSize.height * 0.015,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('2023 QRcode Limited All rights reserved',
                                style: TextStyle(color: Colors.grey)),
                            Text('Terms and Canditions',
                                style: TextStyle(color: Colors.blueGrey))
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: screenSize.height * 0.02,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
