import 'package:chola_driver_flutter/Constants/Constants.dart';
import 'package:flutter/material.dart';

class CustomDropDown extends StatefulWidget {
  final TextEditingController controller;
  final List<String> ListOfDropDown;
  // final int flex;
  final String labelText;
  final ValueChanged<String?>? onChanged;
  final Icon? icon;
  final bool? isEditable;
  final Color? color;
  final double vertical;
  final double horizontal;
  final VoidCallback? onTap;

  CustomDropDown({
    required this.controller,
    // required this.flex,
    this.onChanged,
    required this.ListOfDropDown,
    required this.labelText,
    this.icon,
    this.isEditable,
    this.color,
    required this.vertical,
    required this.horizontal,
    this.onTap,
  });

  @override
  _CustomDropDownState createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Expanded(
      // flex: widget.flex,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          (widget.labelText.length != 0)
              ? Text(
                  widget.labelText,
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: MediaQuery.of(context).size.width * 0.045,
                    fontWeight: FontWeight.bold,
                  ),
                )
              : Container(),
          SizedBox(
            height: size.height * 0.01,
          ),
          GestureDetector(
            onTap: widget.onTap,
            child: DropdownButtonFormField<String>(
              dropdownColor:Color(0xffeef4fa),
              isExpanded: true,
              value: widget.controller.text.isNotEmpty
                  ? widget.controller.text
                  : widget.ListOfDropDown.first,
              onChanged: widget.onChanged,
              items: widget.ListOfDropDown.map<DropdownMenuItem<String>>(
                (String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    alignment: Alignment.centerLeft,
                    child: Text(value),
                  );
                },
              ).toList(),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                enabled: widget.isEditable ?? true,
                labelText: widget.labelText,
                labelStyle: TextStyle(
                  // color: widget.color ?? ThemeData.light().colorScheme.primary,
                  fontWeight: FontWeight.w900,
                  fontSize: MediaQuery.of(context).size.width * 0.045,
                ),
                icon: widget.icon,
                contentPadding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.shortestSide *
                      widget.vertical,
                  horizontal: MediaQuery.of(context).size.shortestSide *
                      widget.horizontal,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
