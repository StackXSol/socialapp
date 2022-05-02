import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:socialapp/main.dart';
import 'package:socialapp/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
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
              SizedBox(height: getheight(context, 30)),
              Text(appuser.name),
              SizedBox(height: 59),
              Center(
                child: Container(
                  height: getwidth(context, 700),
                  width: getwidth(context, 700),
                  decoration: BoxDecoration(
                      color: Color(0xFFE5E5E5),
                      borderRadius: BorderRadius.circular(5)),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () {
                              // Recent Chats
                            },
                            child: Container(
                              margin: EdgeInsets.all(getheight(context, 5)),
                              height: getwidth(context, 330),
                              width: getwidth(context, 330),
                              decoration: BoxDecoration(
                                  color: Color(0xFFC4C4C4),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.message,
                                    size: getheight(context, 95),
                                    color: BlueColor,
                                  ),
                                  Text(
                                    "Recent Chats",
                                    style: TextStyle(
                                        color: BlueColor,
                                        fontSize: getheight(context, 28)),
                                  )
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () async {
                              if (await Permission.contacts
                                  .request()
                                  .isGranted) {
                                Navigator.pushNamed(context, "/contactlist");
                              } else {
                                print("Grant Permission Please!");
                              }
                            },
                            child: Container(
                              margin: EdgeInsets.all(getheight(context, 5)),
                              height: getwidth(context, 330),
                              width: getwidth(context, 330),
                              decoration: BoxDecoration(
                                  color: Color(0xFFC4C4C4),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.contacts,
                                    size: getheight(context, 95),
                                    color: BlueColor,
                                  ),
                                  Text(
                                    "Contacts",
                                    style: TextStyle(
                                        color: BlueColor,
                                        fontSize: getheight(context, 28)),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: getheight(context, 5),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () {
                              // Gallery
                            },
                            child: Container(
                              margin: EdgeInsets.all(getheight(context, 5)),
                              height: getwidth(context, 330),
                              width: getwidth(context, 330),
                              decoration: BoxDecoration(
                                  color: Color(0xFFC4C4C4),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // Icon(
                                  //   Icons.message,
                                  //   size: getheight(context, 95),
                                  //   color: BlueColor,
                                  // ),
                                  Text(
                                    "Comming Soon",
                                    style: TextStyle(
                                        color: BlueColor,
                                        fontSize: getheight(context, 28)),
                                  )
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              // Profile
                            },
                            child: Container(
                              margin: EdgeInsets.all(getheight(context, 5)),
                              height: getwidth(context, 330),
                              width: getwidth(context, 330),
                              decoration: BoxDecoration(
                                  color: Color(0xFFC4C4C4),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.person_rounded,
                                    size: getheight(context, 95),
                                    color: BlueColor,
                                  ),
                                  Text(
                                    "Profile",
                                    style: TextStyle(
                                        color: BlueColor,
                                        fontSize: getheight(context, 28)),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
