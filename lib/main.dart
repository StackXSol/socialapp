import 'package:flutter/material.dart';
import 'package:socialapp/screens/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      //   textTheme: TextTheme(bodyText2: TextStyle(color: Colors.white)),
      // ),
      routes: {
        '/login': (context) => const LogIn(),
        // '/signup': (context) => const SignUp(),
      },
      initialRoute: '/login',
    );
  }
}
