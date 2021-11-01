import '/modelos/transacoes.dart';
import '/screens/dashboard/widgets/nenhuma_transacao.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListaTransacoes extends StatelessWidget {
  const ListaTransacoes({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<Transacoes>(builder: (context, _transacoes, child) {
      if (_transacoes.transacoes.isEmpty) {
        return const NenhumaTransacao();
      }

      return Column(
        children: _transacoes.transacoes.reversed.toList(),
      );
    });
  }
}
