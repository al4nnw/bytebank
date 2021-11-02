import 'package:bytebank/components/editor.dart';
import 'package:bytebank/modelos/deposito.dart';
import 'package:bytebank/modelos/saldo.dart';
import 'package:bytebank/modelos/transacao.dart';
import 'package:bytebank/modelos/transacoes.dart';
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
    final double? valor = double.tryParse(_controllerCampoDeposito.text.replaceAll(",", "."));
    if (valor != null) {
      final transacao = Transacao.deposito(Deposito(valor));
      _atualizaSaldo(context, transacao);
      Navigator.pop(context, transacao);
    } else {
      showDialog(
          context: context,
          builder: (_) => const AlertDialog(
                title: Text("Número invalido"),
                content: Text("Adicione um valor para o depósito."),
              ));
    }
  }

  void _atualizaSaldo(context, Transacao transacao) {
    Provider.of<Transacoes>(context, listen: false).adicionar(transacao);
    Provider.of<Saldo>(context, listen: false).depositar(transacao.tipoTransacao);
  }
}
