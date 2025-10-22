import 'package:flutter/material.dart';

class SelectedSized extends StatefulWidget {

   SelectedSized({super.key});

  @override
  State<SelectedSized> createState() => _SelectedSizedState();
}

class _SelectedSizedState extends State<SelectedSized> {
  int selectedSized =0;

  final sizes=['S','M','L','XL'];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        sizes.length,
         (index) => Padding(
          padding: const EdgeInsets.only(right: 8),
          child: ChoiceChip(
          label: Text(sizes[index]),
          selected: selectedSized==index,
          onSelected: (bool selected) {
            setState(() {
           selectedSized= selected? index: selectedSized;
            });
          },
          selectedColor: Theme.of(context).primaryColor,
          labelStyle: TextStyle(
            color:selectedSized==index ? Colors.white : Colors.black,
          ),
          ),
          ),
      ),
    );
  }
}