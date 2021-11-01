import 'package:bytebank/components/scroll_behavior.dart';
import 'package:bytebank/database/app_database.dart';
import 'package:bytebank/estilos/cores.dart';
import 'package:bytebank/modelos/contato.dart';
import 'package:bytebank/screens/form_contato/form_contato.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListaContatos extends StatefulWidget {
  const ListaContatos({Key? key}) : super(key: key);

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
          future: procurarContatos(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              contatosList = snapshot.data;
              return ScrollConfiguration(
                behavior: ScrollBehaviorNoGlow(),
                child: ListView.builder(
                    padding: const EdgeInsets.all(10),
                    itemCount: contatosList.length,
                    itemBuilder: (context, index) {
                      return ContatoCard(
                        contatosList[index],
                        key: UniqueKey(),
                      );
                    }),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const FormContato()))
            .then((value) => setState(() {})),
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}

class ContatoCard extends StatelessWidget {
  final Contato contato;
  const ContatoCard(
    this.contato, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[400],
      child: ListTile(
        title: Text(
          contato.nome,
          style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w600, color: cinza),
        ),
        subtitle: Text(
          contato.numConta.toString(),
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
