import 'package:bytebank/screens/dashboard/saldo_card.dart';
import 'package:bytebank/screens/deposito/form_deposito.dart';
import 'package:bytebank/screens/transferencia/form_transferencia.dart';
import 'package:bytebank/screens/dashboard/lista.dart';
import "package:flutter/material.dart";

class DashBoard extends StatelessWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(65, 65, 65, 1),
      appBar: AppBar(
        title: const Text("ByteBank"),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) => FormularioTransferencia()));
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
    );
  }
}
