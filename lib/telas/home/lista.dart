import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/modelos/transacoes.dart';
import 'widgets/nenhuma_transacao.dart';

class ListaAtividades extends StatelessWidget {
  const ListaAtividades({Key? key}) : super(key: key);
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
