import 'package:flutter/material.dart';
import 'package:lab_core/lab_core.dart';
import 'package:validatorless/validatorless.dart';

class LoginPage extends StatefulWidget {
  
  const LoginPage({ super.key });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //controllers para os campos de texto
  final emailEC = TextEditingController();
  final passwordEC = TextEditingController();
  final formKey = GlobalKey<FormState>();

  //snippet para evitar memory leak, ou seja, vazamento de memória
  @override
  void dispose() {
    emailEC.dispose();
    passwordEC.dispose();
    super.dispose();
  }

   @override
   Widget build(BuildContext context) {
      final sizeOf = MediaQuery.sizeOf(context);
       return Scaffold(
           body: SingleChildScrollView(
            child: Container(
              constraints: BoxConstraints(
                minHeight: sizeOf.height,
              ),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/background_login.png'),
                  fit: BoxFit.cover
                ),
              ),
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(40),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  constraints: (
                    BoxConstraints(
                      maxWidth: sizeOf.width *.8,
                    )
                  ),
                  child: Column(
                    children: [
                      Text('Login', style: LabClinicasTheme.titleStyle,),
                      const SizedBox(height: 32,),
                      TextFormField(
                        controller: emailEC,
                        validator: Validatorless.multiple(
                          [
                            Validatorless.required('E-mail obrigatório'),
                            Validatorless.email('E-mail inválido'),
                          ]
                        ),
                        decoration: const InputDecoration(label: Text('E-mail')),
                        ),
                      const SizedBox(height: 24,),
                      TextFormField(
                        decoration: const InputDecoration(label: Text('Senha')),
                        obscureText: true,
                        controller: emailEC,
                        validator: Validatorless.multiple(
                            [
                              Validatorless.required('Senha obrigatório'),
                            ]
                          ),
                        ),
                      const SizedBox(height: 32,),
                      SizedBox(
                        width: sizeOf.width * .8,
                        height:48,
                        child:ElevatedButton(
                          onPressed: () {
                            final valid = formKey.currentState?.validate() ?? false;
                          }, 
                          child: const Text('Entrar')),
                        )
                    ]
                    ),
                ),
                ),
            ),
           ),
       );
  }
}