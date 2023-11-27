import 'package:flutter/material.dart';

class TextFieldCustom extends StatelessWidget {
  const TextFieldCustom(
      {super.key,
      Key? childKey,
      required this.placeholder,
      this.height,
      this.width});

  static TextFieldCustom search({Key? key, required String placeholder}) {
    const double width = 450;
    return TextFieldCustom(
      placeholder: placeholder,
      childKey: key,
      width: width,
    );
  }

  final String placeholder;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return SizedBox(
      width: width,
      height: height,
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            color: colorScheme.onSurface.withOpacity(0.2),
          ),
          label: Text(
            placeholder,
            style: TextStyle(color: colorScheme.onSurface.withOpacity(0.5)),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          filled: true,
          fillColor: colorScheme.primary.withOpacity(0.05),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
