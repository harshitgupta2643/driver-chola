import 'package:flutter/material.dart';

class BulletList extends StatelessWidget {
  final List<String> items;

  const BulletList({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: items
          .map((item) => ListTile(
                leading: Image.asset(
                  'assets/bullet_icon.png',
                ),
                title: Text(
                  item,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: MediaQuery.of(context).size.height * 0.025,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
              ))
          .toList(),
    );
  }
}
