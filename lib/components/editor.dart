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
        style: const TextStyle(fontSize: 18.0),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey[500],
          icon: icone,
          hintText: dica,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        ),
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
      ),
    );
  }
}
