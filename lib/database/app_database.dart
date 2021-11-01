import 'package:bytebank/modelos/contato.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future criarDatabase() {
  return getDatabasesPath().then(
    (value) {
      final String path = join(value, "bytebank.db");
      return openDatabase(
        path,
        onCreate: (db, version) {
          db.execute('CREATE TABLE contatos('
              'id INTEGER PRIMARY KEY, '
              'nome TEXT, '
              'num_conta INTEGER)');
        },
        version: 1,
        onDowngrade: onDatabaseDowngradeDelete,
      );
    },
  );
}

Future criarContato(Contato contato) {
  return criarDatabase().then((db) {
    return db.insert("contatos", contato.toMap());
  });
}

Future procurarContatos() {
  return criarDatabase().then((db) {
    final List<Contato> contatos = [];
    return db.query("contatos").then((listaContatos) {
      for (var elem in listaContatos) {
        contatos.add(Contato.fromMap(elem));
      }
      return contatos;
    });
  });
}
