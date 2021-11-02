import 'package:bytebank/estilos/cores.dart';
import 'package:flutter/material.dart';

class ErroDialog extends StatelessWidget {
  final String title;
  final String content;
  final bool podeFechar;
  final List<TextButton> actions;
  const ErroDialog(
      {Key? key, required this.title, required this.content, this.podeFechar = true, required this.actions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (podeFechar) {
      actions.add(TextButton(onPressed: () => Navigator.pop(context), child: const Text("Fechar")));
    }
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      backgroundColor: cinza,
      title: Text(
        title,
        style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      content: Text(
        content,
        style: const TextStyle(fontSize: 17, color: Colors.white),
      ),
      actions: actions,
    );
  }
}
