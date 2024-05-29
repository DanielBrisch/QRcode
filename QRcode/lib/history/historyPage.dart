import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qrcode/appBar/mainAppBar.dart';
import 'package:qrcode/dataBaseHelper/dataBaseHelper.dart';
import 'package:qrcode/history/calendarDialog.dart';
import 'package:qrcode/history/containerHistoryQR.dart';
import 'package:qrcode/service/qrCodeService.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPage();
}

class _HistoryPage extends State<HistoryPage> {
  List<Map<String, dynamic>> _rows = [];

  @override
  void initState() {
    super.initState();
    _loadDataFromDatabase();
  }

  Future<void> _loadDataFromDatabase() async {
    List<Map<String, dynamic>> rows =
        await DatabaseHelper.instance.queryAllRowsOrderByDate('QRCODES');
    setState(() {
      _rows = rows;
    });
  }

  String? lastDate;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));

    return Scaffold(
      appBar: AppBar(
        title: const Text('History',
            style: TextStyle(fontWeight: FontWeight.bold)),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.info_outline, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.settings_outlined, color: Colors.white),
            onPressed: () {},
          ),
          const SizedBox(width: 30)
        ],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pushNamed(context, '/home');
            setState(() {
              QRService.allFalse();
            });
          },
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: SizedBox(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                  style: ButtonStyle(
                                    elevation: MaterialStateProperty.all(0),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                    ),
                                    backgroundColor: MaterialStateProperty.all<
                                            Color>(
                                        const Color.fromRGBO(240, 240, 240, 1)),
                                    fixedSize: MaterialStateProperty.all<Size>(
                                        const Size(170.0, 50.0)),
                                  ),
                                  onPressed: () {},
                                  child: const Center(
                                    child: Text('Scanned',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black)),
                                  )),
                              ElevatedButton(
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                    ),
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.deepPurple),
                                    fixedSize: MaterialStateProperty.all<Size>(
                                        const Size(170.0, 50.0)),
                                  ),
                                  onPressed: () {},
                                  child: const Center(
                                    child: Text('Created',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white)),
                                  ))
                            ],
                          ),
                          Padding(
                              padding: const EdgeInsets.only(top: 25),
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Search',
                                  hintStyle:
                                      const TextStyle(color: Colors.grey),
                                  prefixIcon: const Icon(Icons.search_outlined),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  filled: true,
                                  fillColor:
                                      const Color.fromRGBO(240, 240, 240, 1),
                                ),
                                onChanged: (value) {},
                              ))
                        ],
                      ),
                    ),
                  ),
                  logicDateWidgets(size).isNotEmpty
                      ? Column(
                          children: logicDateWidgets(size),
                        )
                      : const Padding(
                          padding: EdgeInsets.only(top: 30),
                          child: Center(
                            child: Text('Is empty'),
                          ),
                        )
                ],
              ),
            ),
          ),
          const Padding(
              padding: EdgeInsets.only(bottom: 18),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: MainAppBar(),
                ),
              )),
        ],
      ),
    );
  }

  List<Widget> logicDateWidgets(size) {
    List<Widget> widgets = [];
    bool firstLine = true;
    for (var row in _rows) {
      if (firstLine == true) {
        firstLine = false;
        lastDate = row['DATE'];
        widgets.add(Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('${row['DATE']}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.tune_outlined),
                        const SizedBox(width: 20),
                        IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return CalendarDialog(
                                    onSelectedDay: (DateTime selectedDay) {},
                                  );
                                },
                              );
                            },
                            icon: const Icon(Icons.calendar_month))
                      ],
                    )
                  ],
                ),
              ],
            )));
      }
      if (row['DATE'] != lastDate) {
        lastDate = row['DATE'];
        widgets.add(Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('${row['DATE']}',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20))
          ],
        ));
      }
      widgets.add(
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: ContainerHistoryQR(width: size.width, row: row),
        ),
      );
    }
    return widgets;
  }
}
