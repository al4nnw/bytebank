import 'package:bytebank/components/confirmacao_transacao.dart';
import 'package:bytebank/components/erro_dialog.dart';
import 'package:bytebank/database/app_database.dart';
import 'package:bytebank/estilos/cores.dart';
import 'package:bytebank/modelos/contato.dart';
import 'package:bytebank/telas/transferencia/form_transferencia.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContatoCard extends StatelessWidget {
  final Contato contato;
  final Function stateExposto;
  const ContatoCard(this.contato, {Key? key, required this.stateExposto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (_) => ErroDialog(
                    title: contato.nome,
                    content: "Escolha o que você quer fazer com este contato.",
                    actions: [
                      TextButton(
                          onPressed: () => _transferirToContato(context, contato),
                          child: const Text("Transferir")),
                      TextButton(onPressed: () => _removerContato(context), child: const Text("Remover"))
                    ]));
      },
      child: Card(
        elevation: 3,
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
      ),
    );
  }

  _transferirToContato(context, Contato contato) {
    Navigator.pop(context);
    Navigator.push(context, MaterialPageRoute(builder: (_) => FormularioTransferencia(contato: contato)))
        .then((transferenciaRealizada) {
      if (transferenciaRealizada != null) {
        showDialog(context: context, builder: (_) => ConfirmacaoTransacao(transferenciaRealizada));
      }
    });
  }

  _removerContato(context) {
    Provider.of<LocalDatabase>(context, listen: false)
        .apagarContato(contato.id)
        .then((value) => stateExposto());
    Navigator.pop(context);
  }
}
