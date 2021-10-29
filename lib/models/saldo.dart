import 'package:bytebank/models/deposito.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';

class Saldo extends ChangeNotifier {
  double valorSaldo;

  Saldo(this.valorSaldo);

  void depositar(Deposito deposito) {
    valorSaldo += deposito.valor;

    notifyListeners();
  }

  void transferir(Transferencia transferencia) {
    valorSaldo -= transferencia.valor;

    notifyListeners();
  }

  @override
  String toString() {
    return 'R\$ ${valorSaldo.toStringAsFixed(2)}';
  }
}
