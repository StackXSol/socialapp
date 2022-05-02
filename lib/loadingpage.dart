import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:socialapp/screens/login.dart';
import 'package:socialapp/screens/navbar.dart';

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
    try {
      dynamic key = await FirebaseFirestore.instance
          .collection("Users")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();
      appuser = current_user(
          name: key.data()["Name"],
          email: key.data()["Email"],
          uid: key.data()["uid"]);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: ((context) => MainNav())));
    } catch (e) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: ((context) => LogIn())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Loading...")),
    );
  }
}
