import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
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

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: ColorUtils().purple,
      ),
    );

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
                                'Sing In',
                                style: GoogleFonts.roboto(
                                  fontSize: screenSize.aspectRatio * 60,
                                  fontWeight: FontWeight.w500,
                                  color: ColorUtils().white,
                                ),
                              ),
                              Text(
                                'Log in to discover and create incredible qr codes',
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
                              TextField(
                                controller: state.emailController,
                                decoration: InputDecoration(
                                  hintText: 'Email',
                                  hintStyle: TextStyle(
                                    color: ColorUtils().grey,
                                  ),
                                  prefixIcon: Icon(
                                    Icons.mail_rounded,
                                    color: ColorUtils().grey,
                                  ),
                                  filled: true,
                                  fillColor: ColorUtils().faintGray,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    borderSide: BorderSide.none,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                              TextField(
                                controller: state.passwordController,
                                decoration: InputDecoration(
                                  hintText: 'Password',
                                  hintStyle: TextStyle(
                                    color: ColorUtils().grey,
                                  ),
                                  prefixIcon: Icon(
                                    Icons.lock_outline_rounded,
                                    color: ColorUtils().grey,
                                  ),
                                  filled: true,
                                  fillColor: ColorUtils().faintGray,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    borderSide: BorderSide.none,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                              LoginButton(
                                buttonColor: ColorUtils().purple,
                                colorLabel: ColorUtils().white,
                                onPressed: () {
                                  context.go('/home');
                                },
                                label: 'Sing In',
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text('Forgot password?'),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                            top: 15,
                            bottom: 10,
                          ),
                          child: Row(
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
                                'Or connect using',
                                style: GoogleFonts.roboto(
                                  fontSize: screenSize.aspectRatio * 30,
                                  fontWeight: FontWeight.w700,
                                  color: ColorUtils().grey,
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
                        ),
                        Center(
                          child: ElevatedButton(
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
