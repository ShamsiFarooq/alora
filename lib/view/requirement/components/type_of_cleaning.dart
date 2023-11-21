import 'dart:developer';

import 'package:alora/view/requirement/info_requirement.dart';
import 'package:alora/view/style/style.dart';
import 'package:flutter/material.dart';

class TypeOfCleaning extends StatefulWidget {
  const TypeOfCleaning({super.key});

  @override
  State<TypeOfCleaning> createState() => _TypeOfCleaningState();
}

class _TypeOfCleaningState extends State<TypeOfCleaning> {
  int selectedIndex = -1;
  @override
  // ignore: override_on_non_overriding_member
  bool selected = false;
  final List<ItemModel> _chipsList = [
    ItemModel("Normal Cleaning", lightBlue, false),
    ItemModel("Deep Cleaning", lightBlue, false),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Wrap(
              spacing: 20,
              direction: Axis.horizontal,
              children: filterChipsList(),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> filterChipsList() {
    List<Widget> chips = [];

    for (int i = 0; i < _chipsList.length; i++) {
      Widget item = Padding(
        padding: const EdgeInsets.only(left: 0, right: 0),
        child: FilterChip(
          padding: const EdgeInsets.all(8),
          selectedColor: color3,
          checkmarkColor: Colors.green,
          label: Text(_chipsList[i].label),
          labelStyle: _chipsList[i].isSelected
              ? TextStyle(color: color5, fontSize: 16)
              : TextStyle(color: color5, fontSize: 16),
          backgroundColor: _chipsList[i].color,
          selected: i == selectedIndex,
          onSelected: (bool value) {
            log('chip ${i.toString()} selected: $value');
            if (value) {
              selectedIndex = i;
              if (i == 0) {
                cleaningType = "normal cleaning";
              } else {
                cleaningType = "deep cleaning";
              }
              //log(cleaningType);
              _chipsList.forEach((item) => item.isSelected = false);
              _chipsList[selectedIndex].isSelected = true;
            } else {
              selectedIndex = -1;
              _chipsList[i].isSelected = false;
            }
            setState(() {
              _chipsList[i].isSelected = value;
            });
          },
        ),
      );

      chips.add(item);
    }
    return chips;
  }
}

class ItemModel {
  String label;
  Color color;
  bool isSelected;

  ItemModel(this.label, this.color, this.isSelected);
}
