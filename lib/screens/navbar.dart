import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:socialapp/screens/contact_list.dart';
import 'package:socialapp/screens/helper.dart';
import 'package:socialapp/screens/homepage.dart';
import 'package:socialapp/screens/profile.dart';
import 'package:socialapp/screens/recent_chats.dart';
import 'package:socialapp/widgets.dart';
// import 'package:socialapp/screens/contact_list.dart';
// import 'package:socialapp/screens/profile_screen.dart';

class MainNav extends StatefulWidget {
  const MainNav({Key? key}) : super(key: key);

  @override
  State<MainNav> createState() => _MainNavState();
}

class _MainNavState extends State<MainNav> {
  int _index = 2;
  final List<Widget> screens = [
    RecentChats(),
    ContactList(),
    HomePage(),
    Profile(),
    HelperPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_index],
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: getwidth(context, 23),
              vertical: getheight(context, 10)),
          child: BottomNavigationBar(
            backgroundColor: Color(0xFFE5E5E5),
            type: BottomNavigationBarType.fixed,
            onTap: (val) async {
              if (val == 1) {
                if (await Permission.contacts.request().isGranted) {
                  setState(() {
                    _index = val;
                  });
                } else {
                  print("Grant Permission Please!");
                }
              } else {
                setState(() {
                  _index = val;
                });
              }
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.chat, size: getheight(context, 30)),
                  label: "Chat list"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.contacts, size: getheight(context, 30)),
                  label: "Contacts"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.home, size: getheight(context, 30)),
                  label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person, size: getheight(context, 30)),
                  label: "Profile"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.help_center, size: getheight(context, 30)),
                  label: "Helper"),
            ],
            selectedItemColor: Colors.lightBlueAccent,
            iconSize: 50,
            unselectedItemColor: BlueColor,
            currentIndex: _index,
          ),
        ),
      ),
      // floatingActionButton: Container(
      //   decoration: BoxDecoration(
      //       boxShadow: [
      //         BoxShadow(
      //           color: Colors.black.withOpacity(0.2),
      //           offset: Offset(0, 0.2),
      //           blurRadius: 6,
      //         ),
      //       ],
      //       borderRadius: BorderRadius.circular(50),
      //       gradient:
      //           LinearGradient(colors: [Color(0xFF92A3FD), Color(0xFF9DCEFF)])),
      //   child: FloatingActionButton(
      //     child: Icon(Icons.search),
      //     elevation: 0,
      //     backgroundColor: Colors.transparent,
      //     onPressed: () {},
      //   ),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
