import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPage();
}

class _SettingsPage extends State<SettingsPage> {
  bool continusScanCheck = false;
  bool duplicateBarCodesCheck = false;
  bool scansByHand = false;
  bool mute = false;
  bool vibration = false;
  bool copyToClipboard = false;

  double toConfirmScans = 1.0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Settings',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: size.width * 0.4,
                      height: size.height * 0.060,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'General',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.4,
                      height: size.height * 0.060,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromRGBO(220, 226, 232, 1.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Personal',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.060),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Scan management',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: size.height * 0.040),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Continus scan',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text('Adds scans only\nin history'),
                            ],
                          ),
                          Switch(
                            value: continusScanCheck,
                            onChanged: (value) {
                              setState(() {
                                continusScanCheck = value;
                              });
                            },
                            activeColor: Colors.purple,
                            inactiveThumbColor: Colors.grey,
                            activeTrackColor: Colors.purple[100],
                            inactiveTrackColor: Colors.grey[300],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: size.height * 0.040),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Duplicate barcodes',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text('Keep duplicates\nbar codes in the history'),
                            ],
                          ),
                          Switch(
                            value: scansByHand,
                            onChanged: (value) {
                              setState(() {
                                scansByHand = value;
                              });
                            },
                            activeColor: Colors.purple,
                            inactiveThumbColor: Colors.grey,
                            activeTrackColor: Colors.purple[100],
                            inactiveTrackColor: Colors.grey[300],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: size.height * 0.040),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'To confirm the scans by hand',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text('To avoid accident scans'),
                            ],
                          ),
                          Switch(
                            value: duplicateBarCodesCheck,
                            onChanged: (value) {
                              setState(() {
                                duplicateBarCodesCheck = value;
                              });
                            },
                            activeColor: Colors.purple,
                            inactiveThumbColor: Colors.grey,
                            activeTrackColor: Colors.purple[100],
                            inactiveTrackColor: Colors.grey[300],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: size.height * 0.030),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Mute',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Switch(
                          value: mute,
                          onChanged: (value) {
                            setState(() {
                              mute = value;
                            });
                          },
                          activeColor: Colors.purple,
                          inactiveThumbColor: Colors.grey,
                          activeTrackColor: Colors.purple[100],
                          inactiveTrackColor: Colors.grey[300],
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * 0.020),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Vibration',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Switch(
                          value: vibration,
                          onChanged: (value) {
                            setState(() {
                              vibration = value;
                            });
                          },
                          activeColor: Colors.purple,
                          inactiveThumbColor: Colors.grey,
                          activeTrackColor: Colors.purple[100],
                          inactiveTrackColor: Colors.grey[300],
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * 0.020),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Copy to clipboard',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Switch(
                          value: copyToClipboard,
                          onChanged: (value) {
                            setState(() {
                              copyToClipboard = value;
                            });
                          },
                          activeColor: Colors.purple,
                          inactiveThumbColor: Colors.grey,
                          activeTrackColor: Colors.purple[100],
                          inactiveTrackColor: Colors.grey[300],
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * 0.050),
                    const Text(
                      'Privacy',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: size.height * 0.020),
                    const Text(
                      'Privacy policy',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: size.height * 0.020),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Usage statics',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Send usage statics to\nimprove the app',
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
