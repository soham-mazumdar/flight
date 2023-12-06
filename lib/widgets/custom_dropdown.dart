import 'package:flutter/material.dart';

class CustomDropdown extends StatelessWidget {
  const CustomDropdown({
    super.key,
    this.onChanged,
    required this.destinations,
    required this.val,
    required this.ignore,
  });

  final void Function(String?)? onChanged;
  final List<String> destinations;
  final String val;
  final String ignore;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DecoratedBox(
        decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: DropdownButton<String>(
            items: destinations.where((element) => element != ignore).map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            value: val,
            onChanged: onChanged,
          ),
        ),
      ),
    );
  }
}
