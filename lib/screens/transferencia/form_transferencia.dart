import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/saldo.dart';
import 'package:bytebank/models/transacao.dart';
import 'package:bytebank/models/transacoes.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FormularioTransferencia extends StatelessWidget {
  final String _tituloAppBar = 'Criando Transferência';

  final String _dicaCampoValor = 'Digite o valor da transferência';

  final String _textoBotaoConfirmar = 'Confirmar';
  final TextEditingController _controladorCampoValor = TextEditingController();

  FormularioTransferencia({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(65, 65, 65, 1),
        appBar: AppBar(
          title: Text(_tituloAppBar),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Editor(
                dica: _dicaCampoValor,
                controlador: _controladorCampoValor,
                icone: Icon(
                  Icons.monetization_on,
                  color: Colors.grey[500],
                ),
              ),
              ElevatedButton(
                child: Text(
                  _textoBotaoConfirmar,
                  style: const TextStyle(fontSize: 18),
                ),
                onPressed: () => _criaTransferencia(context),
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
        _atualizaEstado(context, novaTransferencia);
        Navigator.pop(context);
      }
    }
  }

  bool _isSaldoValido(context, double valorTransferencia) {
    return Provider.of<Saldo>(context, listen: false).valorSaldo >= valorTransferencia;
  }

  bool _isTransferenciaValida() {
    return _controladorCampoValor.text != '';
  }

  void _atualizaEstado(context, Transferencia novaTransferencia) {
    Provider.of<Transacoes>(context, listen: false).adicionar(Transacao.transferencia(novaTransferencia));
    Provider.of<Saldo>(context, listen: false).transferir(novaTransferencia);
  }
}
