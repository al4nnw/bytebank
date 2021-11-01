import 'package:bytebank/database/app_database.dart';
import 'package:bytebank/modelos/contato.dart';
import 'package:bytebank/modelos/transacoes.dart';
import 'package:bytebank/screens/dashboard/dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'modelos/saldo.dart';

void main() async {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => Saldo(0)),
      ChangeNotifierProvider(create: (context) => Transacoes())
    ],
    child: const BytebankApp(),
  ));
}

class BytebankApp extends StatelessWidget {
  const BytebankApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "SourceSansPro",
        colorScheme:
            ColorScheme.fromSwatch(primarySwatch: Colors.green).copyWith(secondary: Colors.blue[700]),
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blueAccent[100],
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: const DashBoard(),
    );
  }
}
