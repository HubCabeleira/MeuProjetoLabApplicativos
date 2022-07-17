import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
              TextButton(style: TextButton.styleFrom(backgroundColor: Colors.orange, fixedSize: const Size(75, 75), shape: const CircleBorder()), onPressed: null, child: Text('EXIT', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700))),
            ]),
            Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              TextButton(style: TextButton.styleFrom(backgroundColor: Colors.orange, fixedSize: const Size(75, 75), shape: const CircleBorder()), onPressed: null, child: Text('NEXT', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700)))
            ])
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("Personal Book"),
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
              child: const Text("ENTERPRISE\n Contact", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700)),
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
