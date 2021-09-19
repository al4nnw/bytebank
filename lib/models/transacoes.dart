// ignore_for_file: prefer_final_fields
import 'package:bytebank/models/transacao.dart';
import 'package:flutter/cupertino.dart';

class Transacoes extends ChangeNotifier {
  List<Transacao> transacoes = [];

  void adicionar(Transacao novaTransacao) {
    transacoes.add(novaTransacao);

    notifyListeners();
  }
}
