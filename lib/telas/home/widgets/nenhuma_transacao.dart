import 'package:flutter/material.dart';

class NenhumaTransacao extends StatelessWidget {
  const NenhumaTransacao({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30))),
      color: Colors.grey[500],
      child: const Padding(
        padding: EdgeInsets.all(25.0),
        child: Text(
          "Você não fez nenhuma transação ainda.",
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}
