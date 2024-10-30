import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  final Color? buttonColor;
  final String? buttonName;
  final IconData? buttonIcon;
  MenuButton(
      {required this.buttonColor,
      required this.buttonName,
      required this.buttonIcon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.all(10),
        width: 165,
        height: 165,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: buttonColor!, //
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  buttonIcon!, //Icons.article
                  color: Colors.white,
                  size: 80,
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  buttonName!, //News
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
