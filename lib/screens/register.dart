import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:socialapp/widgets.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  bool _isObscure = true;

  late String name = "", email = "", pass = "";

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: getheight(context, 131),
              ),
              Text(
                "Welcome",
                style: TextStyle(
                    fontSize: getheight(context, 64), color: Colors.black),
              ),
              SizedBox(
                height: getheight(context, 132),
              ),
              Text(
                "Register your details",
                style: TextStyle(fontSize: getheight(context, 36)),
              ),
              SizedBox(
                height: getheight(context, 60),
              ),
              Container(
                padding:
                    EdgeInsets.symmetric(horizontal: getwidth(context, 113)),
                child: TextField(
                  onChanged: ((value) => name = value),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    prefixIcon: IconButton(
                      icon: Icon(Icons.person),
                      onPressed: null,
                    ),
                    hintText: "Your Name",
                  ),
                ),
              ),
              SizedBox(
                height: getheight(context, 50),
              ),
              Container(
                padding:
                    EdgeInsets.symmetric(horizontal: getwidth(context, 113)),
                child: TextField(
                    onChanged: ((value) => email = value),
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        fillColor: Colors.white,
                        filled: true,
                        hintText: "Your Email Address",
                        prefixIcon: IconButton(
                          icon: Icon(Icons.email),
                          onPressed: null,
                        ))),
              ),
              SizedBox(
                height: getheight(context, 50),
              ),
              Container(
                padding:
                    EdgeInsets.symmetric(horizontal: getwidth(context, 113)),
                child: TextField(
                    obscureText: _isObscure,
                    onChanged: (val) {
                      pass = val;
                    },
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        fillColor: Colors.white,
                        hintText: "Your Password",
                        prefixIcon: IconButton(
                          icon: Icon(
                            Icons.key,
                          ),
                          onPressed: null,
                        ))),
              ),
              SizedBox(
                height: getheight(context, 58),
              ),
              GestureDetector(
                onTap: () {
                  if (name != "" && email != "" && pass != "") {
                    FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                            email: email, password: pass)
                        .then(
                          (value) => FirebaseFirestore.instance
                              .collection("Users")
                              .doc(FirebaseAuth.instance.currentUser!.uid)
                              .set(
                            {
                              "Name": name,
                              "Email": email,
                              "uid": FirebaseAuth.instance.currentUser!.uid
                            },
                            SetOptions(merge: true),
                          ),
                        );
                  }
                },
                child: Container(
                  height: getheight(context, 75),
                  width: getwidth(context, 300),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(5)),
                  child: Center(
                      child: Text(
                    "Register",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: getheight(context, 25)),
                  )),
                ),
              ),
              SizedBox(
                height: getheight(context, 20),
              ),
              // GestureDetector(
              //   onTap: () {
              //     // Show me how
              //   },
              //   child: Text(
              //     "Show me how",
              //     style: TextStyle(fontSize: getheight(context, 20)),
              //   ),
              // ),
              SizedBox(
                height: getheight(context, 50),
              ),
              SignInButton(
                Buttons.Google,
                text: "Sign up with Google",
                onPressed: () async {
                  GoogleSignIn gs = GoogleSignIn(scopes: ['email']);
                  GoogleSignInAccount? google_user = await gs.signIn();
                  GoogleSignInAuthentication googleAuth =
                      await google_user!.authentication;
                  final AuthCredential credential =
                      GoogleAuthProvider.credential(
                          idToken: googleAuth.idToken,
                          accessToken: googleAuth.accessToken);
                  final UserCredential authResult = await FirebaseAuth.instance
                      .signInWithCredential(credential);
                  User? user = authResult.user;
                  FirebaseFirestore.instance
                      .collection("Users")
                      .doc(user!.uid)
                      .set(
                    {
                      "Name": user.displayName,
                      "Email": user.email,
                      "uid": user.uid
                    },
                    SetOptions(merge: true),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
