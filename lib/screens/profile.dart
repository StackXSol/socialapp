import 'package:flutter/material.dart';
import 'package:socialapp/widgets.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
            child: Column(children: [
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
                    "  Chat list",
                    style: TextStyle(fontSize: getheight(context, 30)),
                  ),
                  Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                        padding: EdgeInsets.all(5), child: Text("Sign Out")),
                  ),
                  SizedBox(width: getwidth(context, 10)),
                  Column(
                    children: [Text("Hello,"), Text("Username")],
                  ),
                  SizedBox(width: 10),
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://www.insidesport.in/wp-content/uploads/2021/11/FBx-v7JXoAAkCzM-58.jpg?w=1068&h=0&crop=1"),
                  ),
                  SizedBox(width: 10)
                ],
              ),
            ),
          ),
          SizedBox(height: getheight(context, 21)),
          Text(
            "Your Profile",
            style: TextStyle(
                color: Colors.black, fontSize: getheight(context, 36)),
          ),
          SizedBox(
            height: getheight(context, 60),
          ),
          Container(
            height: getheight(context, 809),
            width: getwidth(context, 666),
            decoration: BoxDecoration(
                color: Color(0xFFE5E5E5),
                borderRadius: BorderRadius.circular(10)),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(getheight(context, 20)),
                        child: Column(
                          children: [
                            Container(
                              height: getheight(context, 180),
                              width: getheight(context, 180),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(27),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(27),
                                child: Image(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        "https://www.insidesport.in/wp-content/uploads/2021/11/FBx-v7JXoAAkCzM-58.jpg?w=1068&h=0&crop=1")),
                              ),
                            ),
                            SizedBox(
                              height: getheight(context, 10),
                            ),
                            GestureDetector(
                              onTap: () {
                                //change picture
                              },
                              child: Container(
                                padding: EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                    border: Border.all(color: BlueColor),
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5)),
                                child: Text("Change Picture"),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: getwidth(context, 10)),
                        child: Column(
                          children: [
                            Container(
                              width: getwidth(context, 280),
                              child: Text(
                                "Mary Williams",
                                style: TextStyle(
                                    fontSize: getheight(context, 28),
                                    color: Colors.black),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              padding: EdgeInsets.all(3),
                              height: getheight(context, 120),
                              width: getwidth(context, 320),
                              decoration: BoxDecoration(
                                  color: Color(0xFFC4C4C4),
                                  borderRadius: BorderRadius.circular(10)),
                              child: TextField(
                                expands: true,
                                maxLines: null,
                                decoration: InputDecoration(
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    hintText: "Small paragraph about you"),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: getheight(context, 70),
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: getwidth(context, 80)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Your Name"),
                          Container(
                            decoration: BoxDecoration(
                                color: Color(0xFF2DA5F5).withOpacity(0.2),
                                borderRadius: BorderRadius.circular(5)),
                            child: TextField(
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(0),
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  hintText: "Mary williams"),
                            ),
                          ),
                          SizedBox(
                            height: getheight(context, 40),
                          ),
                          Text("Your Email Address"),
                          Container(
                            decoration: BoxDecoration(
                                color: Color(0xFF2DA5F5).withOpacity(0.2),
                                borderRadius: BorderRadius.circular(5)),
                            child: TextField(
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(0),
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  hintText: "Marywilliams@gmail.com"),
                            ),
                          ),
                          SizedBox(
                            height: getheight(context, 40),
                          ),
                          Text("Your Phone Number"),
                          Container(
                            decoration: BoxDecoration(
                                color: Color(0xFF2DA5F5).withOpacity(0.2),
                                borderRadius: BorderRadius.circular(5)),
                            child: TextField(
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(0),
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  hintText: "+91-8200238434"),
                            ),
                          ),
                          SizedBox(height: getheight(context, 40)),
                          GestureDetector(
                            onTap: () {
                              //Save data
                            },
                            child: Center(
                              child: Container(
                                padding: EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                    border: Border.all(color: BlueColor),
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5)),
                                child: Text("Edit/Save Profile"),
                              ),
                            ),
                          )
                        ],
                      ))
                ],
              ),
            ),
          )
        ])));
  }
}
