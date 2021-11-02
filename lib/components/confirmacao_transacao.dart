import 'package:bytebank/estilos/cores.dart';
import 'package:bytebank/modelos/deposito.dart';
import 'package:bytebank/modelos/transacao.dart';
import 'package:flutter/material.dart';

class ConfirmacaoTransacao extends StatelessWidget {
  final Transacao transacao;
  const ConfirmacaoTransacao(this.transacao, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Definir cor do ícone, se for transferência mostrar para quem foi e o valor da transação
    String _content = '';
    MaterialColor _corIcone = Colors.grey;
    if (transacao.tipoTransacao is Deposito) {
      _content = "Seu depósito de " + transacao.valor.toString() + " foi realizado.";
      _corIcone = Colors.green;
    } else {
      _corIcone = Colors.red;
      _content = "Sua transferência de " +
          transacao.valor.toString() +
          " para " +
          transacao.contato!.nome +
          " foi realizada.";
    }

    return AlertDialog(
      backgroundColor: cinza,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      title: const Text(
        "Sucesso",
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            _content,
            style: const TextStyle(fontSize: 17, color: Colors.white),
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  decoration: BoxDecoration(shape: BoxShape.circle, color: _corIcone[200]),
                  child: Icon(
                    Icons.monetization_on,
                    color: _corIcone[500],
                    size: 40,
                  )),
              const SizedBox(
                width: 10,
              ),
              Text(
                transacao.valor.toString(),
                style: const TextStyle(color: Colors.white, fontSize: 33, fontWeight: FontWeight.bold),
              )
            ],
          )
        ],
      ),
      actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text("Fechar"))],
    );
  }
}
