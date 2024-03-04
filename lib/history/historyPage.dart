import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qrcode/dataBaseHelper/dataBaseHelper.dart';
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
        await DatabaseHelper.instance.queryAllRows('QRCODES');
    setState(() {
      _rows = rows;
    });
  }

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
            icon: const Icon(
              Icons.info_outline,
              color: Colors.white,
            ),
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
      body: SingleChildScrollView(
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
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              backgroundColor: MaterialStateProperty.all<Color>(
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
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              backgroundColor: MaterialStateProperty.all<Color>(
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
                            hintStyle: const TextStyle(color: Colors.grey),
                            prefixIcon: const Icon(Icons.search_outlined),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            filled: true,
                            fillColor: const Color.fromRGBO(240, 240, 240, 1),
                          ),
                          onChanged: (value) {},
                        ))
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('15 april, wad',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  Row(
                    children: [
                      Icon(Icons.tune_outlined),
                      SizedBox(width: 20),
                      Icon(Icons.calendar_month_outlined)
                    ],
                  )
                ],
              ),
            ),
            for (var row in _rows)
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: ContainerHistoryQR(width: size.width, row: row),
              )
          ],
        ),
      )),
    );
  }
}
