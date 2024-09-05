import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qrcode/routes/routes.dart';
import 'package:qrcode/stores/login/sing_in_store.dart';
import 'package:qrcode/utils/color_utils.dart';
import 'package:qrcode/views/loading_page.dart';
import 'package:qrcode/widgets/login_button.dart';

class SingInPage extends StatefulWidget {
  const SingInPage({super.key});

  @override
  State<SingInPage> createState() => _SingInPageState();
}

class _SingInPageState extends State<SingInPage> {
  SingInStore store = SingInStore();

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 30.0,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: ColorUtils().purple,
      ),
      body: ScopedBuilder<SingInStore, SingInState>(
        store: store,
        onLoading: (context) => LoadingPage(),
        onState: (context, state) {
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
              child: Stack(
                children: [
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
                      0,
                      20,
                      0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                            bottom: 40,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Login',
                                style: GoogleFonts.roboto(
                                  fontSize: screenSize.aspectRatio * 60,
                                  fontWeight: FontWeight.w500,
                                  color: ColorUtils().white,
                                ),
                              ),
                              Text(
                                'Logue para descobrir e criar qr codes incriveis',
                                style: GoogleFonts.roboto(
                                  fontSize: screenSize.aspectRatio * 30,
                                  fontWeight: FontWeight.w500,
                                  color: ColorUtils().white,
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                            top: 10,
                            bottom: 10,
                            left: 30,
                            right: 30,
                          ),
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
                              LoginButton(
                                buttonColor: ColorUtils().purple,
                                colorLabel: ColorUtils().white,
                                onPressed: () {
                                  Navigator.pushNamed(
                                    context,
                                    AppRoutes.home,
                                  );
                                },
                                label: 'Entrar',
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
