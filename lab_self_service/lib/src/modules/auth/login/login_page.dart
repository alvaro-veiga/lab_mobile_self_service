import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:lab_core/lab_core.dart';
import 'package:lab_self_service/src/modules/auth/login/login_controller.dart';
import 'package:signals_flutter/signals_flutter.dart';
import 'package:validatorless/validatorless.dart';

class LoginPage extends StatefulWidget {
  
  const LoginPage({ super.key });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with MessagesViewMixin{
//controllers para os campos de texto
  final emailEC = TextEditingController();
  final passwordEC = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final controller = Injector.get<LoginController>();

  @override
  void initState() {
    messageListener(controller);
    
    //snippet para redirecionar para a tela de home caso o usuário já esteja logado
    effect(() {
      if(controller.logged) {
        Navigator.of(context).pushReplacementNamed('/home');
      }
    });

    super.initState();
  }

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
                      Watch (
                        (_) {
                          return TextFormField(
                            decoration:  InputDecoration(
                            label: const Text('Senha'),
                            suffixIcon: IconButton(
                              onPressed: () {
                               controller.toggleObscurePassword();
                              },
                              icon: const Icon(Icons.visibility)
                              )
                            ),
                          obscureText: controller.obscurePassword,
                          controller: passwordEC,
                          validator: Validatorless.multiple(
                              [
                                Validatorless.required('Senha obrigatório'),
                              ]
                            ),
                          );
                        }
                      ),
                      const SizedBox(height: 32,),
                      SizedBox(
                        width: sizeOf.width * .8,
                        height:48,
                        child:ElevatedButton(
                          onPressed: () {
                            final valid = formKey.currentState?.validate() ?? false;
                            if(valid) {
                              controller.login(emailEC.text, passwordEC.text);
                            }
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