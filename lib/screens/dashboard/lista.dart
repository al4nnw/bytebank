import 'package:bytebank/models/deposito.dart';
import 'package:bytebank/models/transacao.dart';
import 'package:bytebank/models/transacoes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListaTransacoes extends StatelessWidget {
  const ListaTransacoes({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<Transacoes>(builder: (context, _transacoes, child) {
      if (_transacoes.transacoes.isEmpty) {
        return Card(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(35),
                  bottomLeft: Radius.circular(35),
                  bottomRight: Radius.circular(35))),
          color: Colors.grey[500],
          child: const Padding(
            padding: EdgeInsets.all(40.0),
            child: Text(
              "Você não fez nenhuma transação ainda.",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
            ),
          ),
        );
      }

      return ListView.builder(
          reverse: true,
          shrinkWrap: true,
          itemCount: _transacoes.transacoes.length,
          itemBuilder: (context, index) => ItemTransacao(_transacoes.transacoes[index]));
    });
  }
}

class ItemTransacao extends StatelessWidget {
  final Transacao _transacao;
  const ItemTransacao(this._transacao, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: ListTile(
        contentPadding: const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 0),
        tileColor: Colors.grey[500],
        leading: Icon(
          Icons.monetization_on,
          color: _transacao.tipoTransacao is Deposito ? Colors.green[800] : Colors.red[800],
          size: 35,
        ),
        title: Text(
          _transacao.titulo,
          style: const TextStyle(fontSize: 18),
        ),
        subtitle: Text(
          _transacao.valor,
          style: const TextStyle(fontWeight: FontWeight.bold),
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
