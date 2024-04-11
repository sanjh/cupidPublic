import 'package:flutter/material.dart';

class CustomDropdownButton<T> extends StatelessWidget {
  final List<T> items;
  final T? value;
  final ValueChanged<T?> onChanged;
  final String Function(T)? displayText;
  final String label;

  const CustomDropdownButton({
    Key? key,
    required this.items,
    required this.value,
    required this.onChanged,
    required this.label,
    this.displayText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        const SizedBox(
          height: 10,
        ),
        Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: DropdownButton<T>(
            value: value,
            items: items
                .map((item) => DropdownMenuItem<T>(
                      value: item,
                      child: Text(displayText != null
                          ? displayText!(item)
                          : item.toString()),
                    ))
                .toList(),
            onChanged: onChanged,
            icon: const Icon(Icons.arrow_drop_down),
            underline: Container(),
            isExpanded: true,
            menuMaxHeight: 500,
          ),
        ),
      ],
    );
  }
}
