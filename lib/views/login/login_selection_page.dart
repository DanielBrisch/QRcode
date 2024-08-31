import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qrcode/routes/routes.dart';
import 'package:qrcode/stores/login/login_selection_store.dart';
import 'package:qrcode/utils/color_utils.dart';
import 'package:qrcode/views/loading_page.dart';

class LoginSelectionPage extends StatefulWidget {
  const LoginSelectionPage({super.key});

  @override
  State<LoginSelectionPage> createState() => _LoginSelectionPageState();
}

class _LoginSelectionPageState extends State<LoginSelectionPage> {
  LoginSelectionStore store = LoginSelectionStore();

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: ColorUtils().purple,
    ));

    return Scaffold(
      backgroundColor: ColorUtils().white,
      body: ScopedBuilder<LoginSelectionStore, LoginSelectionState>(
        store: store,
        onLoading: (context) => LoadingPage(),
        onState: (context, state) {
          return SafeArea(
            child: Stack(
              children: [
                Container(
                  color: ColorUtils().faintGray,
                ),
                Container(
                  height: screenSize.height * 0.4,
                  decoration: BoxDecoration(
                    color: ColorUtils().purple,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                    20,
                    60,
                    20,
                    0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: ColorUtils().white,
                        ),
                        child: Icon(
                          Icons.qr_code_outlined,
                          color: ColorUtils().purple,
                          size: 80,
                        ),
                      ),
                      Text(
                        'QR Store',
                        style: GoogleFonts.roboto(
                          fontSize: screenSize.aspectRatio * 60,
                          fontWeight: FontWeight.w700,
                          color: ColorUtils().white,
                        ),
                      ),
                      SizedBox(
                        height: screenSize.height * 0.045,
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            top: 10, bottom: 10, left: 30, right: 30),
                        height: screenSize.height * 0.4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: ColorUtils().white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Text(
                                  'Bem vindo ao QR Store',
                                  style: GoogleFonts.roboto(
                                    fontSize: screenSize.aspectRatio * 45,
                                    fontWeight: FontWeight.w700,
                                    color: ColorUtils().gray,
                                  ),
                                ),
                                Text(
                                  'Crie e leia QR codes de forma rapida e facil',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.roboto(
                                    fontSize: screenSize.aspectRatio * 25,
                                    fontWeight: FontWeight.w700,
                                    color: ColorUtils().gray,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: double.maxFinite,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  alignment: Alignment.center,
                                  shape: WidgetStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  backgroundColor: WidgetStateProperty.all(
                                    ColorUtils().purple,
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.pushNamed(context, AppRoutes.home);
                                },
                                child: Text(
                                  'Entrar',
                                  style: GoogleFonts.roboto(
                                    fontSize: screenSize.aspectRatio * 40,
                                    fontWeight: FontWeight.w400,
                                    color: ColorUtils().white,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: double.maxFinite,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  alignment: Alignment.center,
                                  shape: WidgetStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      side: BorderSide(
                                        color: ColorUtils().purple,
                                        width: 2,
                                      ),
                                    ),
                                  ),
                                  backgroundColor: WidgetStateProperty.all(
                                    ColorUtils().white,
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.pushNamed(context, AppRoutes.home);
                                },
                                child: Text(
                                  'Cadastrar',
                                  style: GoogleFonts.roboto(
                                    fontSize: screenSize.aspectRatio * 40,
                                    fontWeight: FontWeight.w400,
                                    color: ColorUtils().purple,
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  child: Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10.0),
                                    child: Divider(
                                      color: Colors.grey,
                                      thickness: 1,
                                    ),
                                  ),
                                ),
                                Text(
                                  'Ou entre usando',
                                  style: GoogleFonts.roboto(
                                    fontSize: screenSize.aspectRatio * 30,
                                    fontWeight: FontWeight.w700,
                                    color: ColorUtils().gray,
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10.0),
                                    child: Divider(
                                      color: Colors.grey,
                                      thickness: 1,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                alignment: Alignment.center,
                                shape: WidgetStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    side: BorderSide(
                                      color: ColorUtils().purple,
                                      width: 2,
                                    ),
                                  ),
                                ),
                                backgroundColor: WidgetStateProperty.all(
                                  ColorUtils().white,
                                ),
                              ),
                              child: Image.network(
                                'https://cdn1.iconfinder.com/data/icons/google-s-logo/150/Google_Icons-09-512.png',
                                fit: BoxFit.contain,
                                width: screenSize.width * 0.08,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
