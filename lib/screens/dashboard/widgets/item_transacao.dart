import 'package:bytebank/estilos/cores.dart';
import 'package:bytebank/models/deposito.dart';
import 'package:bytebank/models/transacao.dart';
import 'package:flutter/material.dart';

class ItemTransacao extends StatelessWidget {
  final Transacao _transacao;
  const ItemTransacao(this._transacao, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: ListTile(
        contentPadding: const EdgeInsets.all(15),
        tileColor: Colors.grey[500],
        leading: Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _transacao.tipoTransacao is Deposito ? Colors.green[200] : Colors.red[200]),
          child: Icon(
            Icons.monetization_on,
            color: _transacao.tipoTransacao is Deposito ? Colors.green[500] : Colors.red[500],
            size: 35,
          ),
        ),
        title: Text(
          _transacao.titulo,
          style: const TextStyle(fontSize: 18),
        ),
        subtitle: Text(
          _transacao.valor,
          style: const TextStyle(fontWeight: FontWeight.w900, color: cinza),
        ),
        isThreeLine: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20))),
      ),
    );
  }
}
