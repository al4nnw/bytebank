import '/components/scroll_behavior.dart';
import '/estilos/cores.dart';
import 'widgets/saldo_card.dart';
import '/screens/deposito/form_deposito.dart';
import '/screens/lista_contatos/lista_contatos.dart';
import '/screens/transferencia/form_transferencia.dart';
import '/screens/dashboard/lista.dart';
import "package:flutter/material.dart";

import 'widgets/bottom_bar_item.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({Key? key}) : super(key: key);

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
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => FormDeposito()));
                        },
                        child: const Text(
                          "Fazer deposito",
                          style: TextStyle(fontSize: 20),
                        )),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) => FormularioTransferencia()));
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
                    "Transações",
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  const Divider(
                    color: Colors.grey,
                  ),
                  const ListaTransacoes()
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
}
