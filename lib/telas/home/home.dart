import 'package:bytebank/components/confirmacao_transacao.dart';
import 'package:bytebank/telas/home/lista.dart';

import '/components/scroll_behavior.dart';
import '/estilos/cores.dart';
import 'widgets/saldo_card.dart';
import '/telas/deposito/form_deposito.dart';
import '/telas/lista_contatos/lista_contatos.dart';
import '/telas/transferencia/form_transferencia.dart';
import "package:flutter/material.dart";

import 'widgets/bottom_bar_item.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: cinza,
        appBar: AppBar(
          centerTitle: true,
          title: const Text("ByteBank"),
        ),
        body: ScrollConfiguration(
          behavior: ScrollBehaviorNoGlow(),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Align(alignment: Alignment.topCenter, child: SaldoCard()),
                  ButtonBar(alignment: MainAxisAlignment.center, children: [
                    ElevatedButton(
                        onPressed: () => _deposito(context),
                        child: const Text(
                          "Fazer deposito",
                          style: TextStyle(fontSize: 20),
                        )),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => ListaContatos.fromTransferencia()));
                        },
                        child: const Text(
                          "Fazer transferencia",
                          style: TextStyle(fontSize: 20),
                        )),
                  ]),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    "Minha atividade",
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  const Divider(
                    color: Colors.grey,
                  ),
                  const ListaAtividades()
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.green,
          child: SizedBox(
            height: AppBar().preferredSize.height,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BottomBarItem(
                  label: "Contatos",
                  icon: Icons.people,
                  active: true,
                  onPressed: () =>
                      Navigator.push(context, MaterialPageRoute(builder: (_) => const ListaContatos())),
                ),
                BottomBarItem(
                  label: "Configurações",
                  icon: Icons.settings,
                  active: true,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ));
  }

  _deposito(context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => FormDeposito()))
        .then((transacaoRealizada) {
      if (transacaoRealizada != null) {
        showDialog(context: context, builder: (_) => ConfirmacaoTransacao(transacaoRealizada));
      }
    });
  }
}
