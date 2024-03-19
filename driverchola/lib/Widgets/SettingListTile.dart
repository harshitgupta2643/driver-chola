import 'package:chola_driver_flutter/Constants/Constants.dart';
import 'package:flutter/material.dart';

class SettingListTile extends StatelessWidget {
  final String title;
  final bool value;
  final Function(bool) onChanged;
  final String imagePath;

  const SettingListTile({
    Key? key,
    required this.title,
    required this.value,
    required this.onChanged,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
      child: ListTile(
        title: Text(
          title,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: TextStyle(
            color: Colors.black,
            fontSize: size.shortestSide * 0.05,
            fontWeight: FontWeight.w700,
          ),
        ),
        leading: Image.asset(imagePath),
        splashColor: Colors.black26,
        trailing: Transform.scale(
          scale: 0.8,
          child: Switch(
            thumbColor:
                MaterialStatePropertyAll(value ? Colors.black : Colors.black),
            trackColor:
                MaterialStatePropertyAll(value ? Colors.white : Colors.white),
            trackOutlineColor: MaterialStatePropertyAll(Colors.black),
            splashRadius: size.width * 0.1,
            value: value,
            onChanged: onChanged,
          ),
        ),
      ),
    );
  }
}

class SettingListTile1 extends StatelessWidget {
  final String title;
  final String imagePath;

  const SettingListTile1({
    Key? key,
    required this.title,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
      child: ListTile(
        leading: Image.asset(imagePath),
        title: Text(
          title,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: TextStyle(
            color: Colors.black,
            fontSize: size.shortestSide * 0.05,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w700,
          ),
        ),
        trailing: GestureDetector(
          onTap: () {
            Constants.showError(context,
                "Stay Tuned for an Exciting Addition! We're thrilled to announce a new feature coming your way!");
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: size.width * 0.04,
              backgroundColor: Colors.black,
              child: Transform.rotate(
                angle: 45 * (3.141592653589793 / 180),
                child: Icon(
                  Icons.near_me,
                  size: size.width * 0.055,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
