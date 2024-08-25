import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:qrcode/routes/routes.dart';
import 'package:qrcode/stores/home_store.dart';
import 'package:qrcode/utils/color_utils.dart';
import 'package:qrcode/views/loading_page.dart';
import 'package:qrcode/widgets/button_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final HomeStore store = context.read<HomeStore>();
    Size size = MediaQuery.of(context).size;

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));

    final List<ContainerButton> listaDeContainer = [
      ContainerButton(
        onPressed: () => Navigator.pushNamed(context, AppRoutes.create),
        colorCircle: ColorUtils().purple,
        icon: Icon(
          Icons.add_circle_outline,
          color: ColorUtils().white,
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
        icon: Icon(Icons.qr_code_scanner_outlined,
            color: ColorUtils().white, size: 35),
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
        icon: Icon(Icons.mail_outlined, color: ColorUtils().white, size: 40),
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
        icon: Icon(
          Icons.print_outlined,
          color: ColorUtils().white,
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

    return Scaffold(
      backgroundColor: ColorUtils().faintGray,
      body: ScopedBuilder<HomeStore, HomeState>(
        store: store,
        onLoading: (context) => LoadingPage(),
        onState: (_, state) {
          return SafeArea(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    ColorUtils().faintGray,
                    ColorUtils().white,
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
                    Row(
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
                                child: CircleAvatar(
                                  radius: 35,
                                  backgroundImage:
                                      AssetImage('${state.user!.image}'),
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
                                  state.user!.firstName,
                                  style: GoogleFonts.roboto(
                                    fontSize: size.aspectRatio * 35,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  state.user!.lastName,
                                  style: GoogleFonts.roboto(
                                    fontSize: size.aspectRatio * 35,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  state.user!.position,
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
                          decoration: BoxDecoration(
                            color: ColorUtils().white,
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
                        child: Text(
                          'HISTORY',
                          style: TextStyle(
                            color: ColorUtils().white,
                            fontSize: 18,
                          ),
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
            ),
          );
        },
      ),
    );
  }
}
