import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Editor extends StatelessWidget {
  final TextEditingController controlador;
  final String dica;
  final Icon? icone;

  const Editor({
    Key? key,
    required this.controlador,
    required this.dica,
    this.icone,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controlador,
        style: const TextStyle(fontSize: 24.0),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey[500],
          icon: icone,
          hintText: dica,
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[200]!, width: 1.0),
              borderRadius: BorderRadius.circular(12)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[200]!, width: 1.0),
              borderRadius: BorderRadius.circular(12)),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red[400]!, width: 1.0),
              borderRadius: BorderRadius.circular(12)),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red[400]!, width: 1.0),
              borderRadius: BorderRadius.circular(12)),
        ),

        inputFormatters: [FilteringTextInputFormatter.digitsOnly], // Only numbers can be entered
        keyboardType: TextInputType.number,
      ),
    );
  }
}
