import 'package:bytebank/estilos/cores.dart';
import 'package:flutter/material.dart';

class ListaContatos extends StatelessWidget {
  const ListaContatos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cinza,
      appBar: AppBar(
        title: Text("Lista de contatos"),
        centerTitle: true,
      ),
      body: Column(),
    );
  }
}
