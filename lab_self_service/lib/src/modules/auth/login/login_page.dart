import 'package:flutter/material.dart';
import 'package:lab_core/lab_core.dart';

class LoginPage extends StatelessWidget {

  const LoginPage({ super.key });

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
                      TextFormField(decoration: const InputDecoration(label: Text('E-mail')),),
                      const SizedBox(height: 24,),
                      TextFormField(decoration: const InputDecoration(label: Text('Password')),),
                      const SizedBox(height: 32,),
                      SizedBox(
                        width: sizeOf.width * .8,
                        height:48,
                        child:ElevatedButton(onPressed: () {}, child: const Text('Entrar')),
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