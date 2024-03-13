import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateOfBirth extends StatefulWidget {
  final Function(DateTime datetime)? onDateTimeChanged;
  final Size? daySize;
  final Size? monthSize;
  final Size? yearSize;
  final Color? backgroundColor;
  final Color? backgroundDropdownColor;
  final double? radius;
  final Color? borderColor;
  final double? textsSize;
  final Color? itemColor;
  final Color? itemsColor;
  final int? startingYear;

  const DateOfBirth({
    Key? key,
    this.daySize,
    this.monthSize,
    this.yearSize,
    this.backgroundColor,
    this.radius,
    this.borderColor,
    this.textsSize,
    this.itemColor,
    this.itemsColor,
    this.backgroundDropdownColor,
    this.startingYear,
    required this.onDateTimeChanged,
  }) : super(key: key);

  @override
  State<DateOfBirth> createState() => _DateOfBirthState();
}

class _DateOfBirthState extends State<DateOfBirth> {
  List<String> months = DateFormat.EEEE(Platform.localeName).dateSymbols.MONTHS;
  DateTime _selectedDate = DateTime.now();
  late List<int> listyears;

  @override
  void initState() {
    listyears = Iterable<int>.generate((DateTime.now().year + 1))
        .skip(widget.startingYear ?? 1940)
        .toList()
        .reversed
        .toList();

    super.initState();
  }

  int daysInMonth(int year, int month) {
    return DateTime(year, month + 1, 0).day;
  }

  changeSelectedDate(DateTime datetime) {
    _selectedDate = datetime;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: double.infinity, // Cover whole width of the screen
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.calendar_month),
          SizedBox(
            width: width * 0.01,
          ),
          Container(
            width: width / 5,
            height: width * 0.1,
            decoration: BoxDecoration(
              color: widget.backgroundColor ?? Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(widget.radius ?? 5),
              border:
                  Border.all(color: widget.borderColor ?? Colors.transparent),
            ),
            child: Center(
              child: _buildDays(
                daysinmonth:
                    daysInMonth(_selectedDate.year, _selectedDate.month),
                onChanged: (newvalue) {
                  changeSelectedDate(DateTime(
                      _selectedDate.year, _selectedDate.month, newvalue!));

                  widget.onDateTimeChanged!(_selectedDate);
                },
                selectedDate: _selectedDate.day,
                width: width,
              ),
            ),
          ),
          SizedBox(
            width: width * 0.01,
          ),
          Text('/', style: TextStyle(fontSize: 24)),
          SizedBox(
            width: width * 0.01,
          ),
          Container(
            width: width / 4,
            height: width * 0.1,
            decoration: BoxDecoration(
              color: widget.backgroundColor ?? Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(widget.radius ?? 5),
              border:
                  Border.all(color: widget.borderColor ?? Colors.transparent),
            ),
            child: Center(
              child: _buildMonths(
                width: width,
                listMonths: months,
                onChanged: (newvalue) {
                  int currentmonthdays =
                      daysInMonth(_selectedDate.year, newvalue! + 1);
                  if (currentmonthdays < _selectedDate.day) {
                    changeSelectedDate(DateTime(
                        _selectedDate.year, newvalue + 1, currentmonthdays));
                  } else {
                    changeSelectedDate(DateTime(
                        _selectedDate.year, newvalue + 1, _selectedDate.day));
                  }
                  widget.onDateTimeChanged!(_selectedDate);
                },
                selectedDate: _selectedDate.month - 1,
              ),
            ),
          ),
          SizedBox(
            width: width * 0.01,
          ),
          Text('/', style: TextStyle(fontSize: 24)),
          SizedBox(
            width: width * 0.01,
          ),
          Container(
            width: width / 5,
            height: width * 0.1,
            decoration: BoxDecoration(
              color: widget.backgroundColor ?? Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(widget.radius ?? 5),
              border:
                  Border.all(color: widget.borderColor ?? Colors.transparent),
            ),
            child: Center(
                child: _buildYears(
              list: listyears,
              selectedDate: _selectedDate.year,
              onChanged: (newvalue) {
                changeSelectedDate(DateTime(
                    newvalue!, _selectedDate.month, _selectedDate.day));
                widget.onDateTimeChanged!(_selectedDate);
              },
              width: width,
            )),
          ),
        ],
      ),
    );
  }

  _buildYears(
      {required double width,
      required int selectedDate,
      required Function(int?) onChanged,
      required List<int> list}) {
    return DropdownButton<int>(
        dropdownColor: widget.backgroundDropdownColor,
        alignment: Alignment.center,
        icon: const Text(''),
        elevation: 0,
        underline: const Text(''),
        key: const Key("2"),
        items: list.map((item) {
          return DropdownMenuItem<int>(
            value: item,
            child: Center(
              child: Text(
                item.toString(),
                style: Theme.of(context).primaryTextTheme.bodyMedium!.copyWith(
                      fontSize: widget.textsSize ?? 0.045 * width,
                      color: widget.itemsColor ?? Colors.black,
                    ),
              ),
            ),
          );
        }).toList(),
        onChanged: onChanged,
        value: selectedDate,
        selectedItemBuilder: (context) => list.map((item) {
              return Center(
                child: Text(
                  item.toString(),
                  style:
                      Theme.of(context).primaryTextTheme.bodyMedium!.copyWith(
                            fontSize: widget.textsSize ?? 0.045 * width,
                            color: widget.itemColor ?? Colors.black,
                          ),
                ),
              );
            }).toList());
  }

  _buildMonths(
      {required double width,
      required int selectedDate,
      required Function(int?) onChanged,
      required List<String> listMonths}) {
    return DropdownButton(
      dropdownColor: widget.backgroundDropdownColor,
      alignment: Alignment.center,
      icon: const Text(''),
      
      
      elevation: 0,
      underline: const Text(''),
      key: const Key("0"),
      items: List.generate(
          listMonths.length,
          (index) => DropdownMenuItem(
                value: index,
                child: Center(
                  child: Text(
                    listMonths[index],
                    style:
                        Theme.of(context).primaryTextTheme.bodyMedium!.copyWith(
                              fontSize: widget.textsSize ?? 0.035 * width,
                              color: widget.itemsColor ?? Colors.black,
                            ),
                  ),
                ),
                onTap: () {},
              )),
      onChanged: onChanged,
      value: selectedDate,
      selectedItemBuilder: (context) => List.generate(
          listMonths.length,
          (index) => Center(
                child: Text(
                  listMonths[index],
                  style:
                      Theme.of(context).primaryTextTheme.bodyMedium!.copyWith(
                            fontSize: widget.textsSize ?? 0.035 * width,
                            color: widget.itemColor ?? Colors.white,
                          ),
                ),
              )),
    );
  }

  _buildDays(
      {required double width,
      required int selectedDate,
      required Function(int?) onChanged,
      required int daysinmonth}) {
    return DropdownButton<int>(
      dropdownColor: widget.backgroundDropdownColor,
      alignment: Alignment.center,
      icon: const Text(''),
      elevation: 0,
      underline: const Text(''),
      key: const Key("0"),
      items: List.generate(daysinmonth, (index) => index + 1)
          .map(
            (value) => DropdownMenuItem<int>(
              onTap: () {},
              value: value,
              child: Center(
                child: Text(
                  value.toString(),
                  style:
                      Theme.of(context).primaryTextTheme.bodyMedium!.copyWith(
                            fontSize: widget.textsSize ?? 0.045 * width,
                            color: widget.itemsColor ?? Colors.black,
                          ),
                ),
              ),
            ),
          )
          .toList(),
      onChanged: onChanged,
      value: selectedDate,
      selectedItemBuilder: (context) =>
          List.generate(daysinmonth, (index) => index + 1)
              .map(
                (value) => Center(
                    child: Text(
                  value.toString(),
                  style:
                      Theme.of(context).primaryTextTheme.bodyMedium!.copyWith(
                            fontSize: widget.textsSize ?? 0.045 * width,
                            color: widget.itemColor ?? Colors.white,
                          ),
                )),
              )
              .toList(),
    );
  }
}
