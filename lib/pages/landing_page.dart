import 'package:flutter/material.dart';
import 'package:mfu_guide/auth_services.dart';
import 'package:mfu_guide/pages/chat_page.dart';
import 'package:mfu_guide/pages/contact_page.dart';
import 'package:mfu_guide/pages/home_page.dart';

class LandingPage extends StatefulWidget {
  static const String id = 'chat_screen';
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final _authService = AuthService();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _authService.getCurrentUser();
  }

  int currentPageIndex = 0;
  final List<String> appbarTitle = ['Home', 'Chat', 'Contact'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appbarTitle[currentPageIndex]),
        actions: [
          // CircleAvatar(
          //   radius: 35,
          //   backgroundColor: Colors.blue,
          // ),
          // Icon(
          //   Icons.notifications,
          //   size: 35,
          // ),
          // Icon(
          //   Icons.menu,
          //   size: 35,
          // )
        ],
      ),
      endDrawer: Drawer(
        child: ListView(
          children: [
            Text('Student Name'),
            Text('Student ID'),
            TextButton(
                onPressed: _authService.signOut,
                child: Row(
                  children: [
                    Icon(Icons.logout),
                    SizedBox(
                      width: 5,
                    ),
                    Text('Log Out')
                  ],
                ))
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        backgroundColor: Color(0xFFD9D9D9),
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.grey.shade500,
        selectedIndex: currentPageIndex,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(icon: Icon(Icons.assistant), label: 'Chat'),
          NavigationDestination(
              icon: Icon(Icons.account_circle_rounded), label: 'Contact'),
        ],
      ),
      body: <Widget>[
        HomePage(),
        ChatPage(),
        ContactPage(),
      ][currentPageIndex],
    );
  }
}
