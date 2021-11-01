import 'package:bytebank/modelos/saldo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SaldoCard extends StatelessWidget {
  const SaldoCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[500],
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Consumer<Saldo>(builder: (context, _saldo, child) {
          return Text(
            _saldo.toString(),
            style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
          );
        }),
      ),
    );
  }
}
