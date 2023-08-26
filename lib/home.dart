import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  DateTime dataSelecionada = DateTime.now();

  Future<void> _escolherData(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: dataSelecionada,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != dataSelecionada) {
      setState(() {
        dataSelecionada = picked;
      });
    }
  }

  void _submitForm() {
    print("Nome completo: $_nomeCompleto");
    print("CPF: $_cpf");
    print("Data do nascimento: $dataSelecionada");
    print("Área(s) de interesse:");
    print("Eletrônica: $_eletro");
    print("Automação: $_auto");
    print("Desenvolvimento de sistemas: $_desenv");
    print("Dia de vencimento: $_dataVencimento");
    print("Endereço: $_endereco");
    print("Numero: $_n");
    print("Cidade: $_opcaoPadrao");
    print("Complemto: $_complemento");
  }

  String _opcaoPadrao = "Cidade";
  final List<String> _listaCidades = [
    "Cidade",
    "Recife",
    "São Paulo",
    "João Pessoa",
    "Jaboatão dos Guararapes"
  ];

  String? _dataVencimento;
  String _dia5 = "5";
  String _dia10 = "10";
  String _dia15 = "15";

  bool _eletro = false;
  bool _auto = false;
  bool _desenv = false;

  String? _nomeCompleto;
  String? _cpf;
  String? _endereco;
  String? _n;
  String? _complemento;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            const SizedBox(height: 25),
            Text(
              "Formulário de Cadastro",
              style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w900,
                  color: Colors.blue.shade800),
            ),
            const SizedBox(
              height: 25,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    onChanged: (value) {
                      _nomeCompleto = value;
                    },
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.abc),
                        label: Text("Nome Completo"),
                        border: OutlineInputBorder()),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          onChanged: (value) {
                            _cpf = value;
                          },
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.person),
                              label: Text("CPF"),
                              border: OutlineInputBorder()),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Text(
                        "${dataSelecionada.toLocal()}".split(' ')[0],
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ))),
                        onPressed: () => _escolherData(context),
                        child: const Text('Data Nascimento'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  const Row(
                    children: [
                      Text("Escolha a(s) área(s) de interesse:"),
                      SizedBox(width: 45),
                      Text("Escolha o dia de vencimento:"),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 205,
                        child: CheckboxListTile(
                            controlAffinity: ListTileControlAffinity.leading,
                            title: const Text("Eletrotécnica"),
                            value: _eletro,
                            onChanged: (bool? value) {
                              setState(() {
                                _eletro = value!;
                              });
                            }),
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      SizedBox(
                          width: 180,
                          child: RadioListTile(
                              title: Text(_dia5),
                              value: _dia5,
                              groupValue: _dataVencimento,
                              onChanged: (value) {
                                setState(() {
                                  _dataVencimento = value.toString();
                                });
                              }))
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 205,
                        child: CheckboxListTile(
                            controlAffinity: ListTileControlAffinity.leading,
                            title: const Text("Automação"),
                            value: _auto,
                            onChanged: (bool? value) {
                              setState(() {
                                _auto = value!;
                              });
                            }),
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      SizedBox(
                          width: 180,
                          child: RadioListTile(
                              title: Text(_dia10),
                              value: _dia10,
                              groupValue: _dataVencimento,
                              onChanged: (value) {
                                setState(() {
                                  _dataVencimento = value.toString();
                                });
                              }))
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 210,
                        child: CheckboxListTile(
                            controlAffinity: ListTileControlAffinity.leading,
                            title: const Text("Desenvolvimento de Sistemas"),
                            value: _desenv,
                            onChanged: (bool? value) {
                              setState(() {
                                _desenv = value!;
                              });
                            }),
                      ),
                      const SizedBox(
                        width: 35,
                      ),
                      SizedBox(
                          width: 180,
                          child: RadioListTile(
                              title: Text(_dia15),
                              value: _dia15,
                              groupValue: _dataVencimento,
                              onChanged: (value) {
                                setState(() {
                                  _dataVencimento = value.toString();
                                });
                              })),
                    ],
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    onChanged: (value) {
                      _endereco = value;
                    },
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.location_on),
                        label: Text("Endereço"),
                        border: OutlineInputBorder()),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      SizedBox(
                        width: 125,
                        child: TextFormField(
                          onChanged: (value) {
                            _n = value;
                          },
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.map),
                              label: Text("Nº"),
                              border: OutlineInputBorder()),
                        ),
                      ),
                      const SizedBox(width: 15),
                      SizedBox(
                        width: 300,
                        child: DropdownButtonFormField<String>(
                          value: _opcaoPadrao,
                          onChanged: (novoValor) {
                            setState(() {
                              _opcaoPadrao = novoValor.toString();
                            });
                          },
                          items: _listaCidades.map((opcao) {
                            return DropdownMenuItem<String>(
                              value: opcao,
                              child: Text(opcao),
                            );
                          }).toList(),
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    height: 250,
                    width: 500,
                    child: TextFormField(
                      onChanged: (value) {
                        _complemento = value;
                      },
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.more),
                          label: Text("Complemento"),
                          border: OutlineInputBorder()),
                      maxLines: 15,
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: 500,
                    height: 40,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        _submitForm();
                      },
                      icon: Icon(Icons.save),
                      label: Text("Cadastrar"), 
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
