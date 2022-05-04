import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:socialapp/screens/login.dart';
import 'package:socialapp/screens/navbar.dart';
import 'package:socialapp/screens/register.dart';

import 'backend-data.dart';
import 'main.dart';

class loadingpage extends StatefulWidget {
  const loadingpage({Key? key}) : super(key: key);

  @override
  State<loadingpage> createState() => _loadingpageState();
}

class _loadingpageState extends State<loadingpage> {
  @override
  void initState() {
    check_auth();

    super.initState();
  }

  Future<void> check_auth() async {
    FirebaseAuth.instance.authStateChanges().listen((User? user) async {
      try {
        if (user == null) {
          Navigator.pushReplacementNamed(context, '/login');
        } else {
          dynamic key = await FirebaseFirestore.instance
              .collection("Users")
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .get();

          try {
            appuser = current_user(
                name: key.data()["Name"],
                email: key.data()["Email"],
                phone: key.data()["Phone"],
                uid: key.data()["uid"]);
          } catch (e) {
            appuser = current_user(
                name: key.data()["Name"],
                email: key.data()["Email"],
                uid: key.data()["uid"]);
          }

          Navigator.pushReplacementNamed(context, '/navbar');
        }
      } catch (e) {
        Navigator.pushReplacementNamed(context, '/login');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Loading...")),
    );
  }
}
