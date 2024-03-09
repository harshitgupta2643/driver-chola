import 'package:flutter/material.dart';

class SocialMediaButton extends StatelessWidget {
  final String buttontext;
  final String imagePath;
  const SocialMediaButton({
    required this.buttontext,
    required this.imagePath,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Ink(
          child: Image.asset(
            imagePath
            // 'assets/facebook.png',
          ),
        ),
        Text(
          buttontext,
          // 'Facebook',
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: TextStyle(
            color: Colors.black,
            fontSize: size.shortestSide * 0.04,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
