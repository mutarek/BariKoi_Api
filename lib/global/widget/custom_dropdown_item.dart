import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class CustomDropDownItem<T> extends StatelessWidget {
  CustomDropDownItem({
    super.key,
    required this.lists,
    required this.onChanged,
    required this.displayTextExtractor,
    required this.valueConverter,
    this.hint,
    this.validator,
    this.autoValidationMode,
    this.dropdownValue
  });

  T? dropdownValue;
  final List<T> lists;
  final ValueChanged<T?> onChanged;
  final String Function(T item) displayTextExtractor;
  final T Function(String value) valueConverter;
  final String? hint;
  // String? Function(T?)? validator;
  final FormFieldValidator<T?>? validator;
  final AutovalidateMode? autoValidationMode;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.teal),
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: DropdownButtonFormField<T>(
        iconSize: 24,
        validator: validator,
        autovalidateMode: autoValidationMode ?? AutovalidateMode.onUserInteraction,
        icon: Icon(Icons.arrow_downward),
        decoration: const InputDecoration(
          fillColor: Colors.red,
          border: InputBorder.none,
        ),
        value: dropdownValue,
        onChanged: (value) {
          onChanged(value);
        },
        hint: hint != null
            ? Text(
          hint!,
          style: const TextStyle(
            color: Colors.grey, // Customize hint color as needed
          ),
        )
            : null,
        items: [
          if (hint != null)
            // DropdownMenuItem<T>(value: null, child: Text(hint!)),

          ...lists.map((item) {
            return DropdownMenuItem<T>(
              value: item,
              child: Padding(
                padding: const EdgeInsets.only(left: 6),
                child: Text(displayTextExtractor(item)),
              ),
            );
          }),

        ],
      ),
    );
  }
}
