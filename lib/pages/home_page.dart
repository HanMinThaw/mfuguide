import 'package:flutter/material.dart';

import '../components/menu_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 20,
        left: 15,
        right: 15,
        bottom: 20,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Let\'s explore \n something new,',
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MenuButton(
                  buttonColor: Color(0xFF67AB50),
                  buttonName: 'Map Guide',
                  buttonIcon: Icons.map),
              MenuButton(
                  buttonColor: Color(0xFF6597E1),
                  buttonName: 'News',
                  buttonIcon: Icons.article),
            ],
          ),
          SizedBox(
            height: 60,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MenuButton(
                  buttonColor: Color(0xFF272EBC),
                  buttonName: 'Academic \n Calendar',
                  buttonIcon: Icons.school_outlined),
              MenuButton(
                  buttonColor: Color(0xFF1E7549),
                  buttonName: 'Class \n Schedule',
                  buttonIcon: Icons.schedule),
            ],
          )
        ],
      ),
    );
  }
}
