import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/deposito.dart';
import 'package:bytebank/models/saldo.dart';
import 'package:bytebank/models/transacao.dart';
import 'package:bytebank/models/transacoes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FormDeposito extends StatelessWidget {
  FormDeposito({Key? key}) : super(key: key);
  final TextEditingController _controllerCampoDeposito = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(65, 65, 65, 1),
      appBar: AppBar(
        title: const Text("Receber depósito"),
      ),
      body: Column(
        children: [
          Editor(
            controlador: _controllerCampoDeposito,
            dica: "Digite o valor do deposito",
            icone: Icon(
              Icons.monetization_on,
              color: Colors.grey[500],
            ),
          ),
          ElevatedButton(
              onPressed: () => _depositar(context),
              child: const Text(
                "Confirmar",
                style: TextStyle(fontSize: 18),
              ))
        ],
      ),
    );
  }

  void _depositar(context) {
    final double? valor = double.tryParse(_controllerCampoDeposito.text);
    if (valor != null) {
      _atualizaSaldo(context, Deposito(valor));
      Navigator.pop(context);
    } else {
      showDialog(
          context: context,
          builder: (_) => const AlertDialog(
                title: Text("Número invalido"),
                content: Text("Adicione um valor para o depósito."),
              ));
    }
  }

  void _atualizaSaldo(context, Deposito deposito) {
    Provider.of<Transacoes>(context, listen: false).adicionar(Transacao.deposito(deposito));
    Provider.of<Saldo>(context, listen: false).depositar(deposito);
  }
}
