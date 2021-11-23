import 'package:bytebank/estilos/cores.dart';
import 'package:bytebank/modelos/deposito.dart';
import 'package:bytebank/modelos/transacao.dart';
import 'package:flutter/material.dart';

class ItemTransacao extends StatelessWidget {
  final Transacao _transacao;
  const ItemTransacao(this._transacao, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Dismissible(
        key: UniqueKey(),
        background: Container(
          decoration: const BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20))),
          child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Container(
                    decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.grey[700]),
                    child: const Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Icon(
                        Icons.not_interested,
                        size: 30,
                        color: Colors.red,
                      ),
                    )),
              )),
        ),
        secondaryBackground: Container(
          decoration: BoxDecoration(
              color: Colors.green[400],
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20))),
          child: Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Container(
                    decoration: const BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Icon(
                        Icons.check,
                        size: 30,
                        color: Colors.green[500],
                      ),
                    )),
              )),
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.all(15),
          tileColor: Colors.grey[400],
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
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w900, color: cinza),
          ),
          isThreeLine: true,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20))),
        ),
      ),
    );
  }
}
