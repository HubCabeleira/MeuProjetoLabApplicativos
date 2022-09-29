import 'package:flutter/material.dart';
import 'package:flutter_application_18/pages/login_page.dart';
import 'package:flutter_application_18/pages/home_page.dart';
import 'package:flutter_application_18/pages/books_page.dart';

class FirebaseAuthAppRoutes {
  var routes = <String, WidgetBuilder>{
    "/login": (BuilContext) => LoginPage(),
    "/home": (BuilContext) => HomePage(),
    "/book": (BuilContext) => BooksPage(),
  };
}
