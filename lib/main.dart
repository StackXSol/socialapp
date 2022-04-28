import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:socialapp/backend-data.dart';
import 'package:socialapp/screens/contact_list.dart';
import 'package:socialapp/screens/homepage.dart';
import 'package:socialapp/screens/login.dart';
import 'package:socialapp/screens/navbar.dart';
import 'package:socialapp/screens/profile.dart';
import 'package:socialapp/screens/recent_chats.dart';
import 'package:socialapp/screens/register.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

late current_user appuser;

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(bodyText2: TextStyle(color: Colors.grey)),
      ),
      routes: {
        '/login': (context) => const LogIn(),
        '/register': (context) => const Register(),
        '/homepage': (context) => const HomePage(),
        '/navbar': (context) => const MainNav(),
        '/recentchats': (context) => const RecentChats(),
        '/contactlist': (context) => const ContactList(),
        '/profile': (context) => const Profile(),
      },
      initialRoute: '/navbar',
    );
  }
}
