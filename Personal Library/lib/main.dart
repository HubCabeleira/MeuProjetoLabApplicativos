import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_application_4/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PreviewPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class PreviewPage extends StatefulWidget {
  const PreviewPage({Key? key}) : super(key: key);

  _PreviewPageState createState() => _PreviewPageState();
}

class _PreviewPageState extends State<PreviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/inicial.jpg"),
          fit: BoxFit.cover,
        )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.orange,
                      fixedSize: const Size(75, 75),
                      shape: const CircleBorder()),
                  onPressed: null,
                  child: const Text('EXIT',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700))),
            ]),
            Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.orange,
                      fixedSize: const Size(75, 75),
                      shape: const CircleBorder()),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  child: const Text('NEXT',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700)))
            ])
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text("Personal Book"),
        backgroundColor: Colors.orange,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.orange,
              ),
              child: Text("ENTERPRISE\n Contact",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700)),
            ),
            ListTile(
              title: const Text('FACEBOOK '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('INSTAGRAN'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('TWITTER'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
