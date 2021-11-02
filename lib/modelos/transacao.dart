import 'package:intl/intl.dart';

import 'contato.dart';

class Transacao {
  final dynamic tipoTransacao;
  final String titulo;
  final String valor;
  Contato? contato;

  Transacao.deposito(this.tipoTransacao)
      : titulo = "Novo depósito feito em\n" + DateFormat("dd/MM/yyyy").format(DateTime.now()),
        valor = "R\$ " + tipoTransacao.valor.toStringAsFixed(2);

  Transacao.transferencia(this.tipoTransacao, this.contato)
      : titulo = "Nova transferência feita em\n" + DateFormat("dd/MM/yyyy").format(DateTime.now()),
        valor = "R\$ " + tipoTransacao.valor.toStringAsFixed(2);
}
