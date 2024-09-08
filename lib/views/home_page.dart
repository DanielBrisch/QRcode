import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:qrcode/stores/home_store.dart';
import 'package:qrcode/utils/color_utils.dart';
import 'package:qrcode/views/loading_page.dart';
import 'package:qrcode/widgets/button_options_container.dart';
import 'package:qrcode/widgets/principal_bottom_app_bar.dart';

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

    final List<ContainerOptionButton> listaDeContainer = [
      ContainerOptionButton(
        onPressed: () => context.go('/history'),
        colorCircle: ColorUtils().purple,
        icon: Icon(
          Icons.history,
          color: ColorUtils().white,
          size: 30,
        ),
        label: 'HISTORY',
      ),
      ContainerOptionButton(
          onPressed: () => context.go('/create'),
          colorCircle: Colors.blue,
          icon: Icon(
            Icons.add_circle_outline,
            color: ColorUtils().white,
            size: 30,
          ),
          label: 'CREATE'),
      ContainerOptionButton(
        onPressed: () => context.go('/scan'),
        icon: Icon(
          Icons.qr_code_scanner_outlined,
          color: ColorUtils().white,
          size: 30,
        ),
        colorCircle: Colors.redAccent,
        label: 'SCAN',
      ),
      ContainerOptionButton(
        onPressed: () => context.go('/send'),
        icon: Icon(
          Icons.mail_outlined,
          color: ColorUtils().white,
          size: 30,
        ),
        colorCircle: ColorUtils().orange,
        label: 'SEND',
      ),
      ContainerOptionButton(
        onPressed: () {},
        icon: Icon(
          Icons.print_outlined,
          color: ColorUtils().white,
          size: 30,
        ),
        colorCircle: Colors.green,
        label: 'PRINT',
      )
    ];

    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: ColorUtils().white,
      body: ScopedBuilder<HomeStore, HomeState>(
        store: store,
        onLoading: (context) => LoadingPage(),
        onState: (_, state) {
          return SafeArea(
            child: Container(
              height: double.maxFinite,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    ColorUtils().white,
                    ColorUtils().faintGray,
                  ],
                ),
              ),
              child: Container(
                padding: const EdgeInsets.only(
                  left: 25,
                  right: 25,
                ),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () => context.go('/profile'),
                              child: Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: ColorUtils().purple,
                                    width: 4.0,
                                  ),
                                ),
                                child: CircleAvatar(
                                  radius: 35,
                                  backgroundImage: AssetImage(
                                    '${state.user!.image}',
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Hello, ',
                                  style: GoogleFonts.roboto(
                                    fontSize: size.aspectRatio * 40,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  state.user!.firstName,
                                  style: GoogleFonts.roboto(
                                    fontSize: size.aspectRatio * 40,
                                    fontWeight: FontWeight.w700,
                                    color: ColorUtils().purple,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.info_outline),
                              onPressed: () => context.go('/info'),
                            ),
                            IconButton(
                              icon: const Icon(Icons.settings_outlined),
                              onPressed: () => context.go('/settings'),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: screenSize.height * 0.02,
                    ),
                    Text(
                      'Welcome to QRcode App',
                      style: GoogleFonts.roboto(
                          fontSize: size.aspectRatio * 50,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    ),
                    Expanded(
                      child: GridView.count(
                        physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.all(0),
                        crossAxisCount: 1,
                        childAspectRatio: 4,
                        children: List.generate(
                          listaDeContainer.length,
                          (index) {
                            return Container(
                              padding: const EdgeInsets.only(
                                top: 10,
                              ),
                              child: listaDeContainer[index],
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: PrincipalBottomAppBar(),
    );
  }
}
