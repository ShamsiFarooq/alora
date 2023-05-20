import 'dart:developer';

import 'package:alora/screens/requirement/info_requirement.dart';
import 'package:alora/style/style.dart';
import 'package:flutter/material.dart';

class NumberContainer extends StatefulWidget {
  const NumberContainer({super.key});

  @override
  State<NumberContainer> createState() => _NumberContainerState();
}

class _NumberContainerState extends State<NumberContainer> {
  int selectedIndex = -1;
  @override
  bool selected = false;
  final List<ItemModel> _chipsList = [
    ItemModel("2", color2, false),
    ItemModel("3", color2, false),
    ItemModel("4", color2, false),
    ItemModel("5", color2, false),
    ItemModel("6", color2, false),
    ItemModel("7", color2, false),
    ItemModel("8", color2, false),
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
          selectedColor: color5,
          checkmarkColor: color1,
          label: Text(_chipsList[i].label),
          labelStyle: _chipsList[i].isSelected
              ? TextStyle(color: color1, fontSize: 16)
              : TextStyle(color: color5, fontSize: 16),
          backgroundColor: _chipsList[i].color,
          selected: i == selectedIndex,
          onSelected: (bool value) {
            log('chip ${i.toString()} selected: $value');
            if (value) {
              selectedIndex = i;
              hours = i + 2;
              //log(selectedIndex.toString());
              log(hours.toString());
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
