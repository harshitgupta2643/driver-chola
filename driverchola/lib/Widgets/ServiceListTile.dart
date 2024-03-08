import 'package:flutter/material.dart';

class ServiceListTile extends StatelessWidget {
  final String title;
  final bool value;
  final Function(bool) onChanged;
  final String imagePath;

  const ServiceListTile({
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
                MaterialStatePropertyAll(value ? Colors.green : Colors.red),
            trackColor:
                MaterialStatePropertyAll(value ? Colors.white : Colors.white),
            trackOutlineColor:
                MaterialStatePropertyAll(value ? Colors.green : Colors.red),
            splashRadius: size.width * 0.1,
            value: value,
            onChanged: onChanged,
          ),
        ),
      ),
    );
  }
}
