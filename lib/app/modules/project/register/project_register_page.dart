import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_timer/app/modules/project/register/cubit_controller/project_register_cubit_controller.dart';
import 'package:validatorless/validatorless.dart';

class ProjectRegisterPage extends StatefulWidget {
  ProjectRegisterCubitController controller;
  ProjectRegisterPage({super.key, required this.controller});

  @override
  State<ProjectRegisterPage> createState() => _ProjectRegisterPageState();
}

class _ProjectRegisterPageState extends State<ProjectRegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameEC = TextEditingController();
  final _estimateEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProjectRegisterCubitController, ProjectRegisterStatus>(
      bloc: widget.controller,
      listener: (context, state) {
        switch (state){
      
          case ProjectRegisterStatus.success:
            Navigator.pop(context);
            break;
          case ProjectRegisterStatus.error:
            AsukaSnackbar.alert('Erro ao Salvar projeto').show();
            break;
          default:
            break;
        }
        },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: const Text(
            'Criar novo Projeto',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          iconTheme: const IconThemeData(color: Colors.black),
          elevation: 0,
        ),
        body: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameEC,
                    decoration: const InputDecoration(
                      label: Text('Nome do Projeto'),
                    ),
                    validator: Validatorless.required('Nome Obrigatório'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                      controller: _estimateEC,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        label: Text('Estimativa de horas'),
                      ),
                      validator: Validatorless.multiple([
                        Validatorless.required('Estimativa obrigatória'),
                        Validatorless.number('Permitido somente números'),
                      ])),
                  const SizedBox(
                    height: 15,
                  ),
                  BlocSelector<ProjectRegisterCubitController,
                      ProjectRegisterStatus, bool>(
                    bloc: widget.controller,
                    selector: (state) => state == ProjectRegisterStatus.loading,
                    builder: (context, showLoading) {
                      print(showLoading);
                      return Visibility(
                        visible: showLoading,
                        child:
                            Center(child: CircularProgressIndicator.adaptive()),
                      );
                    },
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    constraints: BoxConstraints(maxWidth: 250),
                    child: ElevatedButton(
                        onPressed: () async {
                          final formValid =
                              _formKey.currentState?.validate() ?? false;
                          if (formValid) {
                            final name = _nameEC.text;
                            final estimate = int.parse(_estimateEC.text);

                            await widget.controller.register(name, estimate);
                          }
                        },
                        child: const Text('Salvar')),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
