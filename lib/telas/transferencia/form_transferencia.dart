import 'package:bytebank/components/editor.dart';
import 'package:bytebank/components/erro_dialog.dart';
import 'package:bytebank/modelos/contato.dart';
import 'package:bytebank/modelos/saldo.dart';
import 'package:bytebank/modelos/transacao.dart';
import 'package:bytebank/modelos/transacoes.dart';
import 'package:bytebank/modelos/transferencia.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FormularioTransferencia extends StatelessWidget {
  final String _tituloAppBar = 'Transferência';

  final String _dicaCampoValor = 'Digite o valor da transferência';

  final String _textoBotaoConfirmar = 'Confirmar';
  final TextEditingController _controladorCampoValor = TextEditingController();

  final Contato contato;
  FormularioTransferencia({Key? key, required this.contato}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(65, 65, 65, 1),
        appBar: AppBar(
          title: Text(_tituloAppBar),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 10, bottom: 5),
                child: Text(
                  "Transferir para ${contato.nome}",
                  style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
              const Divider(
                color: Colors.grey,
              ),
              Editor(
                dica: _dicaCampoValor,
                controlador: _controladorCampoValor,
                icone: Icon(
                  Icons.monetization_on,
                  color: Colors.grey[500],
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  child: Text(
                    _textoBotaoConfirmar,
                    style: const TextStyle(fontSize: 18),
                  ),
                  onPressed: () => _criaTransferencia(context),
                ),
              ),
            ],
          ),
        ));
  }

  void _criaTransferencia(BuildContext context) {
    if (_isTransferenciaValida()) {
      final double valor = double.tryParse(_controladorCampoValor.text.replaceAll(",", "."))!;
      if (_isSaldoValido(context, valor)) {
        final novaTransferencia = Transferencia(valor);
        final novaTransacao = Transacao.transferencia(novaTransferencia, contato);
        _atualizaEstado(context, novaTransacao);
        Navigator.pop(context, novaTransacao);
      } else {
        showDialog(
            context: context,
            builder: (_) =>
                // ignore: prefer_const_constructors
                ErroDialog(title: "Erro", content: "Você não possui saldo suficiente para esta transação.",
                    // ignore: prefer_const_literals_to_create_immutables
                    actions: []));
      }
    }
  }

  bool _isSaldoValido(context, double valorTransferencia) {
    return Provider.of<Saldo>(context, listen: false).valorSaldo >= valorTransferencia;
  }

  bool _isTransferenciaValida() {
    return _controladorCampoValor.text != '';
  }

  void _atualizaEstado(context, Transacao transacao) {
    Provider.of<Transacoes>(context, listen: false).adicionar(transacao);
    Provider.of<Saldo>(context, listen: false).transferir(transacao.tipoTransacao);
  }
}
