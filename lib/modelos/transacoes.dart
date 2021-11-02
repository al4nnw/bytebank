// ignore_for_file: prefer_final_fields
import 'package:bytebank/modelos/transacao.dart';
import 'package:bytebank/telas/home/widgets/item_transacao.dart';
import 'package:flutter/cupertino.dart';

class Transacoes extends ChangeNotifier {
  List<Widget> transacoes = [];

  void adicionar(Transacao novaTransacao) {
    transacoes.add(ItemTransacao(novaTransacao));

    notifyListeners();
  }
}
