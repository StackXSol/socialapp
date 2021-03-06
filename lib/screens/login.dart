import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:socialapp/backend-data.dart';
import 'package:socialapp/main.dart';
import 'package:socialapp/screens/navbar.dart';
import 'package:socialapp/screens/register.dart';
import 'package:socialapp/widgets.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  @override
  bool _isObscure = true;
  bool showSpinner = false;

  String email = "", pass = "";

  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                SizedBox(
                  height: getheight(context, 131),
                ),
                Text(
                  "Social App",
                  style: TextStyle(
                      fontFamily: "Aviator",
                      fontSize: getheight(context, 95),
                      color: Colors.black),
                ),
                SizedBox(
                  height: getheight(context, 124),
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: getwidth(context, 113)),
                  child: TextField(
                      onChanged: (val) {
                        email = val.replaceAll(" ", "");
                      },
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        prefixIcon: IconButton(
                          icon: Icon(Icons.email_sharp),
                          onPressed: null,
                        ),
                        hintText: "Your Email Address",
                      )),
                ),
                SizedBox(
                  height: getheight(context, 58),
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: getwidth(context, 113)),
                  child: TextField(
                      onChanged: (val) {
                        pass = val;
                      },
                      obscureText: _isObscure,
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          fillColor: Colors.white,
                          filled: true,
                          hintText: "Your Password",
                          prefixIcon: IconButton(
                            icon: Icon(
                              Icons.key_outlined,
                            ),
                            onPressed: null,
                          ))),
                ),
                SizedBox(
                  height: getheight(context, 58),
                ),
                GestureDetector(
                  onTap: () async {
                    try {
                      if (email != "" && pass != "") {
                        FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: email, password: pass);

                        dynamic key = await FirebaseFirestore.instance
                            .collection("Users")
                            .doc(FirebaseAuth.instance.currentUser!.uid)
                            .get();
                        print(FirebaseAuth.instance.currentUser!.uid);

                        appuser = current_user(
                            name: key.data()["Email"],
                            email: email,
                            uid: FirebaseAuth.instance.currentUser!.uid);

                        Navigator.pushNamed(context, "/navbar");
                      } else {
                        Fluttertoast.showToast(msg: "Enter email and password");
                      }
                    } catch (e) {
                      print("error");
                      Fluttertoast.showToast(msg: "No user Exists!");
                    }
                  },
                  child: Container(
                    height: getheight(context, 79),
                    width: getwidth(context, 300),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                        child: Text(
                      "Sign In",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: getheight(context, 25)),
                    )),
                  ),
                ),
                SizedBox(
                  height: getheight(context, 30),
                ),
                Text(
                  "OR",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: getheight(context, 24)),
                ),
                SizedBox(
                  height: getheight(context, 44),
                ),
                SignInButton(
                  Buttons.Google,
                  text: "Sign in with Google",
                  onPressed: () async {
                    try {
                      GoogleSignIn gs = GoogleSignIn(scopes: ['email']);
                      GoogleSignInAccount? google_user = await gs.signIn();
                      GoogleSignInAuthentication googleAuth =
                          await google_user!.authentication;
                      final AuthCredential credential =
                          GoogleAuthProvider.credential(
                              idToken: googleAuth.idToken,
                              accessToken: googleAuth.accessToken);
                      final UserCredential authResult = await FirebaseAuth
                          .instance
                          .signInWithCredential(credential);
                      User? user = authResult.user;
                      dynamic key = await FirebaseFirestore.instance
                          .collection("Users")
                          .doc(user!.uid)
                          .get();
                      print(key.data()["Name"]);
                      appuser = current_user(
                          name: user.displayName as String,
                          email: user.email as String,
                          uid: user.uid);
                      Navigator.pushReplacementNamed(context, "/navbar");
                    } catch (e) {
                      GoogleSignIn().signOut();
                      Fluttertoast.showToast(
                          msg: "No user with this email exists!");
                    }
                  },
                ),
                SizedBox(
                  height: getheight(context, 69),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Forget password? ",
                      style: TextStyle(fontSize: getheight(context, 20)),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (email != "") {
                          FirebaseAuth.instance
                              .sendPasswordResetEmail(email: email);
                        }
                      },
                      child: Text(
                        "Click me",
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: getheight(context, 20)),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 59,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an google account? ",
                      style: TextStyle(fontSize: getheight(context, 20)),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Register()));
                      },
                      child: Text(
                        "Register",
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: getheight(context, 20)),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
