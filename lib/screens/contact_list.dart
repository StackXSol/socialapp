import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:socialapp/widgets.dart';

class ContactList extends StatefulWidget {
  const ContactList({Key? key}) : super(key: key);

  @override
  State<ContactList> createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  @override
  void initState() {
    get_contacts();
    super.initState();
  }

  List<Chat> con_list = [];

  Future<void> get_contacts() async {
    con_list = [];
    List<Contact> contacts = await ContactsService.getContacts();
    for (var i in contacts) {
      print(i.avatar);
      for (var j in i.phones!) {
        con_list.add(
            Chat(mobile: j.value.toString(), name: i.displayName.toString()));
      }
    }
    setState(() {});
  }

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
              margin: EdgeInsets.symmetric(horizontal: getwidth(context, 0)),
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
              height: getheight(context, 30),
            ),
            Container(
              height: getheight(context, 809),
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(left: 15, right: 15),
              decoration: BoxDecoration(
                  color: Color(0xFFE5E5E5),
                  borderRadius: BorderRadius.circular(10)),
              child: SingleChildScrollView(
                child: Column(
                  children: con_list,
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
  Chat({required this.mobile, required this.name});

  String mobile, name;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: BlueColor),
              borderRadius: BorderRadius.circular(10)),
          width: getwidth(context, 800),
          padding: EdgeInsets.symmetric(
              vertical: getheight(context, 5), horizontal: 10),
          margin: EdgeInsets.symmetric(vertical: getheight(context, 0)),
          child: Row(
            children: [
              Stack(
                children: [
                  Container(
                      height: getheight(context, 80),
                      width: getheight(context, 80),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(22)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(22),
                        child: Image(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcShpioF-xi4bFhRAuMCfhSSFUVpBchghoELbw&usqp=CAU"),
                        ),
                      )),
                  Positioned(
                    top: getheight(context, 65),
                    left: getwidth(context, 95),
                    child: Container(
                      height: getheight(context, 15),
                      width: getheight(context, 15),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.transparent),
                          color: Colors.transparent,
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
                    name,
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
                    mobile,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ],
              ),
            ],
          ),
        ),
        Divider(
          height: 7,
          endIndent: getheight(context, 70),
          indent: getheight(context, 70),
          color: Color.fromARGB(255, 255, 255, 255),
        ),
      ],
    );
  }
}
