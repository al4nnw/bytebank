// ignore_for_file: must_be_immutable

import '/components/scroll_behavior.dart';
import '/database/app_database.dart';
import '/estilos/cores.dart';
import '/modelos/contato.dart';
import '/telas/form_contato/form_contato.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widgets/contato_card.dart';

class ListaContatos extends StatefulWidget {
  final bool fromTransferencia;
  const ListaContatos({Key? key, this.fromTransferencia = false}) : super(key: key);
  const ListaContatos.fromTransferencia({Key? key, this.fromTransferencia = true}) : super(key: key);

  @override
  State<ListaContatos> createState() => _ListaContatosState();
}

class _ListaContatosState extends State<ListaContatos> {
  List<Contato> contatosList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cinza,
      appBar: AppBar(
        title: const Text("Lista de contatos"),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: Provider.of<LocalDatabase>(context, listen: false).procurarContatos(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              contatosList = snapshot.data;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 10,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20.0, left: 10),
                      child: Text(
                        widget.fromTransferencia ? "Transferir para" : "Meus contatos",
                        style:
                            const TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                  ),
                  const Divider(
                    color: Colors.grey,
                  ),
                  Expanded(
                    flex: 94,
                    child: ScrollConfiguration(
                      behavior: ScrollBehaviorNoGlow(),
                      child: ListView.builder(
                          padding: const EdgeInsets.all(10),
                          itemCount: contatosList.length,
                          itemBuilder: (context, index) {
                            return ContatoCard(
                              contatosList[index],
                              key: UniqueKey(),
                              stateExposto: exporState,
                            );
                          }),
                    ),
                  ),
                ],
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const FormContato()))
            .then((value) => exporState()),
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }

  void exporState() {
    setState(() {});
  }
}
