import 'package:bytebank/database/app_database.dart';
import 'package:bytebank/estilos/cores.dart';
import 'package:bytebank/modelos/contato.dart';
import 'package:flutter/material.dart';

class FormContato extends StatefulWidget {
  const FormContato({Key? key}) : super(key: key);

  @override
  State<FormContato> createState() => _FormContatoState();
}

class _FormContatoState extends State<FormContato> {
  final formKey = GlobalKey<FormState>();
  final _controllerCampoNome = TextEditingController();
  final _controllerCampoConta = TextEditingController();

  @override
  void dispose() {
    _controllerCampoConta.dispose();
    _controllerCampoNome.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cinza,
      appBar: AppBar(
        title: const Text("Novo contato"),
        centerTitle: true,
      ),
      body: Form(
        key: formKey,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
            color: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10, top: 30),
              child: Column(
                children: [
                  FormFieldContato(
                    controller: _controllerCampoNome,
                    label: "Nome do contato:",
                    hintText: "Digite o nome do contato",
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Insira o nome do novo contato.";
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  FormFieldContato(
                      label: "Número da conta",
                      hintText: "Digite o numero da conta",
                      controller: _controllerCampoConta,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Insira o número da conta.";
                        }
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: SizedBox(
                      height: 50,
                      child: TextButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.green),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)))),
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              criarContato(Contato(0, _controllerCampoNome.text,
                                      int.tryParse(_controllerCampoConta.text) ?? 0))
                                  .then((value) => Navigator.pop(context));
                            }
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.person_add,
                                color: cinza,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                "Adicionar contato",
                                style:
                                    TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18),
                              ),
                              SizedBox(
                                width: 20,
                              )
                            ],
                          )),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class FormFieldContato extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController controller;
  final Function validator;
  final TextInputType? keyboardType;
  const FormFieldContato(
      {Key? key,
      required this.label,
      required this.hintText,
      required this.controller,
      required this.validator,
      this.keyboardType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 5.0, bottom: 10),
          child: Text(
            label,
            style: const TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.w600),
          ),
        ),
        TextFormField(
            keyboardType: keyboardType,
            controller: controller,
            validator: (value) => validator(value),
            style: const TextStyle(fontSize: 18, color: cinza),
            decoration: InputDecoration(
              errorStyle: const TextStyle(fontSize: 14),
              hintText: hintText,
              filled: true,
              fillColor: Colors.grey[500],
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            )),
      ],
    );
  }
}
