import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qrcode/dataBase/dataBase.dart';
import 'package:qrcode/service/qrCodeService.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePage();
}

class _ProfilePage extends State<ProfilePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController positionController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  List<Map<String, dynamic>> _rows = [];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Personal',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
            padding: const EdgeInsets.all(25),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: size.width * 0.4,
                    height: size.height * 0.060,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: QRService.pageSelected
                            ? Colors.deepPurple
                            : const Color.fromRGBO(220, 226, 232, 1.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        if (ModalRoute.of(context)!.settings.name !=
                            '/settings') {
                          Navigator.of(context).pop();
                          Navigator.pushNamed(context, '/settings');
                          setState(() {
                            QRService.pageSelected = true;
                          });
                        }
                      },
                      child: Text(
                        'General',
                        style: TextStyle(
                          color: QRService.pageSelected
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.4,
                    height: size.height * 0.060,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: !QRService.pageSelected
                            ? Colors.deepPurple
                            : const Color.fromRGBO(220, 226, 232, 1.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        if (ModalRoute.of(context)!.settings.name !=
                            '/profile') {
                          Navigator.of(context).pop();
                          Navigator.pushNamed(context, '/profile');
                          setState(() {
                            QRService.pageSelected = false;
                          });
                        }
                      },
                      child: Text(
                        'Personal',
                        style: TextStyle(
                          color: !QRService.pageSelected
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.080),
              Padding(
                padding: EdgeInsets.only(
                    right: size.width * 0.180, left: size.width * 0.180),
                child: Column(
                  children: [
                    SizedBox(
                      width: size.width * 0.5,
                      height: size.height * 0.2,
                      child: const CircleAvatar(
                        radius: 35,
                        backgroundImage:
                            AssetImage('lib/assets/img/happyguy.png'),
                      ),
                    ),
                    SizedBox(height: size.height * 0.030),
                    const Text(
                      'Change your profile photo',
                      style: TextStyle(
                        color: Colors.deepPurple,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.030),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    'Name',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter your name',
                      hintStyle:
                          TextStyle(color: Colors.purple.withOpacity(0.5)),
                    ),
                    onEditingComplete: () {
                      saveNameUserProfile();
                    },
                  ),
                  SizedBox(height: size.height * 0.030),
                  const Text(
                    'LastNasme',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  TextField(
                    controller: lastNameController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter your last name',
                      hintStyle:
                          TextStyle(color: Colors.purple.withOpacity(0.5)),
                    ),
                    onEditingComplete: () {
                      saveLastNameUserProfile();
                    },
                  ),
                  SizedBox(height: size.height * 0.030),
                  const Text(
                    'Position',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  TextField(
                    controller: positionController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter your position',
                      hintStyle:
                          TextStyle(color: Colors.purple.withOpacity(0.5)),
                    ),
                    onEditingComplete: () {
                      savePositionUserProfile();
                    },
                  ),
                  SizedBox(height: size.height * 0.030),
                  const Text(
                    'Email',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter your email',
                      hintStyle:
                          TextStyle(color: Colors.purple.withOpacity(0.5)),
                    ),
                    onEditingComplete: () {
                      saveEmailUserProfile();
                    },
                  ),
                  SizedBox(height: size.height * 0.030),
                  GestureDetector(
                    onTap: () {
                      confirmLogOutDialog(context);
                    },
                    child: const Text(
                      'Log out',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.030),
                  const Text(
                    'Delete an account',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                ],
              )
            ])));
  }

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

  void confirmLogOutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Center(
            child: Text("Really? 😰😰"),
          ),
          content: const Text("Are you sure you want to quit?",
              style: TextStyle(fontSize: 20)),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    "No",
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    "Yes",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )
          ],
        );
      },
    );
  }

  void saveNameUserProfile() async {
    await DatabaseHelper.instance.insert({
      'NAME': nameController.text,
    }, 'USER');
  }

  void saveLastNameUserProfile() async {
    await DatabaseHelper.instance.insert({
      'LASTNAME': lastNameController.text,
    }, 'USER');
  }

  void savePositionUserProfile() async {
    await DatabaseHelper.instance.insert({
      'POSITION': positionController.text,
    }, 'USER');
  }

  void saveEmailUserProfile() async {
    await DatabaseHelper.instance.insert({
      'EMAIL': emailController.text,
    }, 'USER');
  }

  @override
  void dispose() {
    saveNameUserProfile();
    super.dispose();
  }
}
