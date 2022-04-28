import 'package:flutter/material.dart';
import 'package:socialapp/widgets.dart';

class ContactList extends StatefulWidget {
  const ContactList({Key? key}) : super(key: key);

  @override
  State<ContactList> createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
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
                      "  Contact List",
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
              "Contact List",
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
                    Chat(),
                    Divider(
                      height: 2,
                      endIndent: getheight(context, 70),
                      indent: getheight(context, 70),
                      color: Color(0xFF808080),
                    ),
                    Chat(),
                    Divider(
                      height: 2,
                      endIndent: getheight(context, 70),
                      indent: getheight(context, 70),
                      color: Color(0xFF808080),
                    ),
                    Chat(),
                    Divider(
                      height: 2,
                      endIndent: getheight(context, 70),
                      indent: getheight(context, 70),
                      color: Color(0xFF808080),
                    ),
                    Chat(),
                    Divider(
                      height: 2,
                      endIndent: getheight(context, 70),
                      indent: getheight(context, 70),
                      color: Color(0xFF808080),
                    ),
                    Chat(),
                    Divider(
                      height: 2,
                      endIndent: getheight(context, 70),
                      indent: getheight(context, 70),
                      color: Color(0xFF808080),
                    ),
                    Chat(),
                    Divider(
                      height: 2,
                      endIndent: getheight(context, 70),
                      indent: getheight(context, 70),
                      color: Color(0xFF808080),
                    ),
                    Chat(),
                    Divider(
                      height: 2,
                      endIndent: getheight(context, 70),
                      indent: getheight(context, 70),
                      color: Color(0xFF808080),
                    ),
                    Chat(),
                    Divider(
                      height: 2,
                      endIndent: getheight(context, 70),
                      indent: getheight(context, 70),
                      color: Color(0xFF808080),
                    ),
                    Chat(),
                    Divider(
                      height: 2,
                      endIndent: getheight(context, 70),
                      indent: getheight(context, 70),
                      color: Color(0xFF808080),
                    ),
                    Chat(),
                    Divider(
                      height: 2,
                      endIndent: getheight(context, 70),
                      indent: getheight(context, 70),
                      color: Color(0xFF808080),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Chat extends StatelessWidget {
  const Chat({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: BlueColor),
          borderRadius: BorderRadius.circular(10)),
      width: getwidth(context, 600),
      padding:
          EdgeInsets.symmetric(vertical: getheight(context, 5), horizontal: 10),
      margin: EdgeInsets.symmetric(vertical: getheight(context, 10)),
      child: Row(
        children: [
          Stack(
            children: [
              Container(
                  height: getheight(context, 80),
                  width: getheight(context, 80),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(22)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(22),
                    child: Image(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          "https://www.insidesport.in/wp-content/uploads/2021/11/FBx-v7JXoAAkCzM-58.jpg?w=1068&h=0&crop=1"),
                    ),
                  )),
              Positioned(
                top: getheight(context, 65),
                left: getwidth(context, 95),
                child: Container(
                  height: getheight(context, 15),
                  width: getheight(context, 15),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(20)),
                ),
              )
            ],
          ),
          SizedBox(
            width: getwidth(context, 80),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Darlene Stwart",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: getheight(context, 18),
                    color: Colors.black),
              ),
              SizedBox(
                  height: getheight(
                context,
                8,
              )),
              Text(
                "Online",
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
