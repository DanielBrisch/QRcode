import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ContainerCreateQRcode extends StatefulWidget {
  // final VoidCallback? onPressed;
  // final Icon? icon;
  // final Text? label;
  // final double borderRadius;
  // final Color colorButton;
  // final Color? colorCircle;

  const ContainerCreateQRcode({
    super.key,
  });

  @override
  State<ContainerCreateQRcode> createState() => _ContainerCreateQRcode();
}

class _ContainerCreateQRcode extends State<ContainerCreateQRcode> {
  TextEditingController? dixi = TextEditingController();

  String qrText = '';

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 415,
        width: 320,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 0,
              blurRadius: 5,
              offset: const Offset(0, 9),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.redAccent.shade200,
                  width: 5.0,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: QrImageView(
                  data: qrText, version: QrVersions.auto, size: 148),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: 280,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                border: Border.all(
                  color: Colors.grey,
                  width: 2,
                ),
              ),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    qrText = value;
                  });
                },
                decoration: const InputDecoration(
                  hintText: 'Dixi',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 15.0),
                ),
                controller: dixi,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
                width: 230,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          width: 30,
                          height: 30,
                          child: ElevatedButton(
                            onPressed: () {
                              // Adicione sua função de callback aqui
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7),
                              ),
                              backgroundColor: Colors.redAccent.shade200,
                            ),
                            child: null,
                          )),
                      SizedBox(
                          width: 30,
                          height: 30,
                          child: ElevatedButton(
                            onPressed: () {
                              // Adicione sua função de callback aqui
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7),
                              ),
                              backgroundColor: Colors.orange,
                            ),
                            child: null,
                          )),
                      SizedBox(
                          width: 30,
                          height: 30,
                          child: ElevatedButton(
                            onPressed: () {
                              // Adicione sua função de callback aqui
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7),
                              ),
                              backgroundColor: Colors.yellow,
                            ),
                            child: null,
                          )),
                      SizedBox(
                          width: 30,
                          height: 30,
                          child: ElevatedButton(
                            onPressed: () {
                              // Adicione sua função de callback aqui
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7),
                              ),
                              backgroundColor: Colors.green,
                            ),
                            child: null,
                          )),
                      SizedBox(
                          width: 30,
                          height: 30,
                          child: ElevatedButton(
                            onPressed: () {
                              // Adicione sua função de callback aqui
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7),
                              ),
                              backgroundColor: Colors.lightGreenAccent,
                            ),
                            child: null,
                          )),
                      SizedBox(
                          width: 30,
                          height: 30,
                          child: ElevatedButton(
                            onPressed: () {
                              // Adicione sua função de callback aqui
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7),
                              ),
                              backgroundColor: Colors.deepPurpleAccent,
                            ),
                            child: null,
                          ))
                    ])),
            const SizedBox(height: 45),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    // Lógica para o botão "Cancel"
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Cancel',
                      style: TextStyle(color: Colors.red, fontSize: 20
                          // Não incluir o sublinhado
                          ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Lógica para o botão "Save"
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Save',
                      style: TextStyle(color: Colors.green, fontSize: 20
                          // Não incluir o sublinhado
                          ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
