import 'package:flutter/material.dart';

class TermsAndConditionsWidget extends StatefulWidget {
  @override
  _TermsAndConditionsWidgetState createState() =>
      _TermsAndConditionsWidgetState();
}

class _TermsAndConditionsWidgetState extends State<TermsAndConditionsWidget> {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: TextStyle(fontSize: 16.0, color: Colors.black),
        children: [
          // Clause 1
          TextSpan(
            text: 'Clause 1:\n',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam et quam in justo tincidunt facilisis. Integer vel orci sed elit gravida tempor. Duis aliquet, metus et fringilla dapibus, lacus turpis varius odio, ut elementum purus quam ut orci. Aenean rhoncus rhoncus tortor, nec imperdiet felis sagittis eget.\n\n',
          ),

          // Clause 2
          TextSpan(
            text: 'Clause 2:\n',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text:
                'Sed at ultrices velit. Nullam sit amet turpis a dui cursus sollicitudin. Proin vehicula ultricies nisi, ac tincidunt purus aliquet non. Vivamus in ligula nec mi pulvinar sagittis nec a libero. Nulla facilisi. Phasellus sodales purus eu nisl accumsan, eget tincidunt ligula eleifend.\n\n',
          ),

          // Clause 3
          TextSpan(
            text: 'Clause 3:\n',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam et quam in justo tincidunt facilisis. Integer vel orci sed elit gravida tempor. Duis aliquet, metus et fringilla dapibus, lacus turpis varius odio, ut elementum purus quam ut orci. Aenean rhoncus rhoncus tortor, nec imperdiet felis sagittis eget.\n\n',
          ),

          // Clause 4
          TextSpan(
            text: 'Clause 4:\n',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text:
                'Sed at ultrices velit. Nullam sit amet turpis a dui cursus sollicitudin. Proin vehicula ultricies nisi, ac tincidunt purus aliquet non. Vivamus in ligula nec mi pulvinar sagittis nec a libero. Nulla facilisi. Phasellus sodales purus eu nisl accumsan, eget tincidunt ligula eleifend.\n\n',
          ),

          // Clause 5
          TextSpan(
            text: 'Clause 5:\n',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text:
                'Nam ac justo vel velit mollis fermentum ac eu quam. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; In hac habitasse platea dictumst. Duis rhoncus gravida condimentum. Nullam vestibulum id metus vel dapibus. Integer vel lacus vitae ligula malesuada gravida ut ac nisl.\n\n\n\n\n\n\n',
          ),
        ],
      ),
    );
  }
}
