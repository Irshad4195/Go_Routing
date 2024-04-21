import 'package:flutter/material.dart';

class EditPageTextField extends StatefulWidget {
 final String hintText;
  final TextEditingController controller;
  final VoidCallback? onChanged;
  final VoidCallback? onSubmitted;
  final bool suffixIconVisible;
  final bool isMultiline;
  final bool prefixIconVisible;

  const EditPageTextField({super.key, required this.controller, required this.hintText, this.onChanged, this.onSubmitted, required this.suffixIconVisible, required this.isMultiline, required this.prefixIconVisible});

  @override
  EditPageTextFieldState createState() => EditPageTextFieldState();
}

class EditPageTextFieldState extends State<EditPageTextField> {

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      style: Theme.of(context).textTheme.headlineSmall,
      decoration: InputDecoration(
        suffixIcon: widget.suffixIconVisible ? const Icon(Icons.edit,color: Colors.grey,) : null,
        prefixIcon: widget.prefixIconVisible ? Icon(Icons.location_on,color: Colors.red[900],) : null,
        hintText: widget.hintText,
        hintStyle:Theme.of(context).textTheme.headlineSmall,
        filled: true,
        fillColor: Colors.white,
       border: InputBorder.none,
        contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
      ),
      keyboardType: TextInputType.text,
      maxLines: null,
      maxLength:widget.isMultiline ? 500 : null,
      onChanged: (value) {
        setState(() {
          widget.onChanged!();
        });
      },
      onSubmitted: (value) {
        setState(() {
          widget.onSubmitted!();
        });
      },
    );
  }
}