import 'package:flutter/material.dart';

enum DatePickerBottomType { morning, afternoon, evening }

typedef DidSelectedDateType = void Function(DatePickerBottomType type);

class DatePickerBottomWidget extends StatelessWidget {
  DatePickerBottomWidget(
      {this.timeType = DatePickerBottomType.morning, this.onSelected});
  final DatePickerBottomType timeType;
  final DidSelectedDateType onSelected;
  Widget pickBtn(String text, bool isSelected, VoidCallback onPressed) {
    return Expanded(
        flex: 1,
        child: MaterialButton(
          color: isSelected ? Color(0xFFE6F7FF) : Color(0xFFF5F5F5),
          height: 36,
          textColor: isSelected ? Color(0xFF1890FF) : Color(0xA6000000),
          child: Text(text),
          onPressed: onPressed,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      children: [
        Container(
          height: 40,
          padding: EdgeInsets.only(
            left: 18,
            right: 18,
          ),
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              pickBtn('上午', timeType == DatePickerBottomType.morning, () {
                onSelected(DatePickerBottomType.morning);
              }),
              SizedBox(
                width: 15,
              ),
              pickBtn('下午', timeType == DatePickerBottomType.afternoon, () {
                onSelected(DatePickerBottomType.afternoon);
              }),
              SizedBox(
                width: 15,
              ),
              pickBtn('晚上', timeType == DatePickerBottomType.evening, () {
                onSelected(DatePickerBottomType.evening);
              }),
            ],
          ),
        ),
        Expanded(child: Container(color: Colors.white))
      ],
    ));
  }
}
