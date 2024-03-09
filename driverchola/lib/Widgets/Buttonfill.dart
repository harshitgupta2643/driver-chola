import 'package:flutter/material.dart';

class AgreeButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final double padding;
  final double? borderRadius;
  final AlignmentGeometry? begin;
  final AlignmentGeometry? end;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final Color? borderColor;
  final Color? textColor;
  final double? borderWidth;
  final List<Color>? fillColor;

  const AgreeButton({
    Key? key,
    required this.buttonText,
    required this.onPressed,
    required this.padding,
    this.prefixWidget,
    this.suffixWidget,
    this.fontWeight,
    this.borderColor,
    this.borderWidth,
    this.textColor,
    this.fillColor,
    this.begin,
    this.end,
    this.fontSize,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textHeight = _getTextHeight(context);
    final minHeight = textHeight + 16.0;
    // var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        constraints: BoxConstraints(minHeight: minHeight),
        width: MediaQuery.of(context).size.width * padding,
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.01,
          vertical: MediaQuery.of(context).size.width * 0.001,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: fillColor ??
                [
                  Color(0xff1F2D60),
                  Color(0xff6A4DE8),
                ],
            begin: begin ?? Alignment.topLeft,
            end: end ?? Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(borderRadius ?? 10.0),
          border: Border.all(
            color: borderColor ?? Colors.black,
            width: borderWidth ?? 0,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (prefixWidget != null) prefixWidget!,
            Expanded(
              child: Text(
                buttonText,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(
                  fontSize:
                      fontSize ?? MediaQuery.of(context).size.width * 0.055,
                  fontWeight: fontWeight ?? FontWeight.bold,
                  color: textColor ?? Colors.white,
                ),
              ),
            ),
            if (suffixWidget != null) suffixWidget!,
          ],
        ),
      ),
    );
  }

  double _getTextHeight(BuildContext context) {
    final textSpan = TextSpan(
      text: buttonText,
      style: TextStyle(
        fontSize: fontSize ?? MediaQuery.of(context).size.width * 0.06,
        fontWeight: fontWeight ?? FontWeight.bold,
      ),
    );
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
      maxLines: 1,
    );
    textPainter.layout(maxWidth: double.infinity);
    return textPainter.size.height;
  }
}
