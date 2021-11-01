class Contato {
  int id = 0;
  String nome = '';
  int numConta = 0;

  Contato(this.id, this.nome, this.numConta);

  Contato.fromMap(Map contato) {
    id = contato["id"];
    nome = contato['nome'];
    numConta = contato["num_conta"];
  }

  @override
  String toString() {
    return "Contato{nome: $nome, numConta: $numConta";
  }

  Map<String, dynamic> toMap() {
    return {"nome": nome, "num_conta": numConta};
  }
}
