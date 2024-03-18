import 'package:flutter/material.dart';

class bottomLine extends StatelessWidget {
  const bottomLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child:
          LayoutBuilder(builder: (context, constraints) {
        double fontSize = constraints.maxWidth * 0.04;
        return Text.rich(
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          TextSpan(
            children: [
              TextSpan(
                text:
                    'Upload these documents to become a Driving Partner with ',
                style: TextStyle(
                  fontSize: fontSize,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
              TextSpan(
                text: 'CHOLA',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
