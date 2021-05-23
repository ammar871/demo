import 'package:flutter/material.dart';

import '../../constans.dart';
class CustomDropdown2<T> extends StatelessWidget {
  final List<DropdownMenuItem<T>> dropdownMenuItemList;
  final ValueChanged<T> onChanged;
  final T value;
  final bool isEnabled;
  CustomDropdown2({
    Key key,
    @required this.dropdownMenuItemList,
    @required this.onChanged,
    @required this.value,
    this.isEnabled = true,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !isEnabled,
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          border: Border.all(color: KColorecart),
        ),
        height: 35,
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0,right: 8),
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
              isExpanded: true,
              itemHeight: 50.0,
              style: TextStyle(
                  fontSize: 15.0,
                  color: isEnabled ? KColorecart :KColorecart),
              items: dropdownMenuItemList,
              onChanged: onChanged,
              icon: Icon(Icons.keyboard_arrow_down),
              iconDisabledColor:KColorecart,
              iconEnabledColor:KColorecart,
              value: value,
            ),
          ),
        ),
      ),
    );
  }
}