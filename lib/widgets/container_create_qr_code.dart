import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qrcode/utils/color_utils.dart';

class ContainerCreateQRcode extends StatefulWidget {
  const ContainerCreateQRcode({
    super.key,
  });

  @override
  State<ContainerCreateQRcode> createState() => _ContainerCreateQRcode();
}

class _ContainerCreateQRcode extends State<ContainerCreateQRcode> {
  TextEditingController? dixi = TextEditingController();

  TextEditingController qrTextController = TextEditingController();

  String formattedDate = DateFormat('dd/MM/yyyy').format(DateTime.now());

  Color color = ColorUtils().red;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 415,
        width: 320,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(15),
          ),
          color: ColorUtils().white,
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
                  color: color,
                  width: 5.0,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: QrImageView(
                  data: qrTextController.text,
                  version: QrVersions.auto,
                  size: 148),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: 280,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: ColorUtils().white,
                border: Border.all(
                  color: Colors.grey,
                  width: 2,
                ),
              ),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    qrTextController.text = value;
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
                        setState(() {
                          color = ColorUtils().red;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7),
                        ),
                        backgroundColor: ColorUtils().red,
                      ),
                      child: null,
                    ),
                  ),
                  SizedBox(
                      width: 30,
                      height: 30,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            color = ColorUtils().orange;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7),
                          ),
                          backgroundColor: ColorUtils().orange,
                        ),
                        child: null,
                      )),
                  SizedBox(
                      width: 30,
                      height: 30,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            color = ColorUtils().yellow;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7),
                          ),
                          backgroundColor: ColorUtils().yellow,
                        ),
                        child: null,
                      )),
                  SizedBox(
                      width: 30,
                      height: 30,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            color = ColorUtils().green;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7),
                          ),
                          backgroundColor: ColorUtils().green,
                        ),
                        child: null,
                      )),
                  SizedBox(
                      width: 30,
                      height: 30,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            color = ColorUtils().lightGreenAccent;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7),
                          ),
                          backgroundColor: ColorUtils().lightGreenAccent,
                        ),
                        child: null,
                      )),
                  SizedBox(
                    width: 30,
                    height: 30,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          color = ColorUtils().purple;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7),
                        ),
                        backgroundColor: ColorUtils().purple,
                      ),
                      child: null,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        WidgetStateProperty.all(Colors.transparent),
                    elevation: WidgetStateProperty.all(0),
                    shape: WidgetStateProperty.all(
                      const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/home');
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        WidgetStateProperty.all(Colors.transparent),
                    elevation: WidgetStateProperty.all(0),
                    shape: WidgetStateProperty.all(
                      const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                  ),
                  onPressed: () async {},
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Save',
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            )
          ],
        ));
  }

  Widget errorSave() {
    return AlertDialog(
      title: const Center(
        child: Icon(Icons.error_rounded, color: Colors.red),
      ),
      content: const Center(
        child: Text(
          'Please, enter a URL',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ),
      actions: [
        Center(
          child: TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              'Ok',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
        )
      ],
    );
  }
}
