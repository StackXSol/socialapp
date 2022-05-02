import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:socialapp/widgets.dart';

import '../main.dart';

class HelperPage extends StatelessWidget {
  const HelperPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: getheight(context, 50),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: getwidth(context, 36)),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFFC4C4C4)),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: getheight(context, 17)),
                child: Row(
                  children: [
                    Text(
                      "  Helper Page",
                      style: TextStyle(fontSize: getheight(context, 30)),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        FirebaseAuth.instance.signOut();
                        GoogleSignIn().signOut();
                        Navigator.pushReplacementNamed(context, '/login');
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                            padding: EdgeInsets.all(5),
                            child: Text("Sign Out")),
                      ),
                    ),
                    SizedBox(width: getwidth(context, 10)),
                    Column(
                      children: [Text("Hello,"), Text(appuser.name)],
                    ),
                    SizedBox(width: 10),
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcShpioF-xi4bFhRAuMCfhSSFUVpBchghoELbw&usqp=CAU"),
                    ),
                    SizedBox(width: 10)
                  ],
                ),
              ),
            ),
            SizedBox(height: getheight(context, 21)),
            Text(
              "What do you need help with?",
              style: TextStyle(
                  color: Colors.black, fontSize: getheight(context, 36)),
            ),
            SizedBox(
              height: getheight(context, 75),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              GestureDetector(
                onTap: () {
                  //call the contact
                },
                child: Container(
                  width: getwidth(context, 350),
                  padding: EdgeInsets.symmetric(vertical: 3),
                  decoration: BoxDecoration(
                      border: Border.all(color: BlueColor),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  child: Center(child: Text("Calling a contact")),
                ),
              ),
              GestureDetector(
                onTap: () {
                  //message the contact
                },
                child: Container(
                  width: getwidth(context, 350),
                  padding: EdgeInsets.symmetric(vertical: 3),
                  decoration: BoxDecoration(
                      border: Border.all(color: BlueColor),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  child: Center(child: Text("Messaging a contact")),
                ),
              )
            ]),
            SizedBox(height: getheight(context, 50)),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              GestureDetector(
                onTap: () {
                  //showing photos
                },
                child: Container(
                  width: getwidth(context, 350),
                  padding: EdgeInsets.symmetric(vertical: 3),
                  decoration: BoxDecoration(
                      border: Border.all(color: BlueColor),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  child: Center(child: Text("Showing my photos")),
                ),
              ),
              GestureDetector(
                onTap: () {
                  //sign out
                },
                child: Container(
                  width: getwidth(context, 350),
                  padding: EdgeInsets.symmetric(vertical: 3),
                  decoration: BoxDecoration(
                      border: Border.all(color: BlueColor),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  child: Center(child: Text("Sign out my Account")),
                ),
              )
            ])
          ],
        ),
      ),
    );
  }
}
