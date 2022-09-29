import 'package:flutter/material.dart';
import 'package:flutter_application_18/util/firebase_auth_app_navigator.dart';
import 'package:flutter_application_18/pages/books_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/imagens/inicial.jpg"),
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
                  onPressed: () {
                    FirebaseAuthAppNavigator.goToLogin(context);
                  },
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
                    //Navigator.push(context,MaterialPageRoute(builder: (context) => BooksPage()));
                    FirebaseAuthAppNavigator.goToBooks(context);
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
