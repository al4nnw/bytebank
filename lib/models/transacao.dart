import 'package:intl/intl.dart';

class Transacao {
  final dynamic tipoTransacao;
  final String titulo;
  final String valor;

  Transacao.deposito(this.tipoTransacao)
      : titulo = "Novo depósito feito em\n" + DateFormat("dd/MM/yyyy").format(DateTime.now()),
        valor = "R\$ " + tipoTransacao.valor.toStringAsFixed(2);

  Transacao.transferencia(this.tipoTransacao)
      : titulo = "Nova transferência feita em\n" + DateFormat("dd/MM/yyyy").format(DateTime.now()),
        valor = "R\$ " + tipoTransacao.valor.toStringAsFixed(2);
}
