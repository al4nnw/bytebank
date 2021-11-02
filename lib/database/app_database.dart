import 'package:bytebank/modelos/contato.dart';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class LocalDatabase extends ChangeNotifier {
  Future<String> dbPath = getDatabasesPath().then((value) => join(value, "bytebank.db"));

  LocalDatabase();

  Future<Database> _criarDatabase() async {
    return await openDatabase(dbPath.toString(), onCreate: (db, version) {
      db.execute('CREATE TABLE contatos('
          'id INTEGER PRIMARY KEY, '
          'nome TEXT, '
          'num_conta INTEGER)');
    }, version: 1);
  }

  Future criarContato(Contato contato) {
    return _criarDatabase().then((value) => value.insert("contatos", contato.toMap()));
  }

  Future<List<Contato>> procurarContatos() async {
    List<Contato> listaFinal = [];
    return _criarDatabase().then((value) => value.query("contatos").then((listaContatos) {
          for (var elem in listaContatos) {
            listaFinal.add(Contato.fromMap(elem));
          }
          return listaFinal;
        }));
  }

  Future apagarContato(int id) {
    return _criarDatabase().then((value) => value.delete("contatos", where: "id = $id"));
  }
}
