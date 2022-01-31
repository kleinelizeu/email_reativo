import 'package:email_reativo/screens/stores/email_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomeScreen extends StatelessWidget {
  final emailController = EmailStore();

  void _nextStep() {
    print("Email válido, continuar");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onChanged: (value) => emailController.changeEmail(value),
              decoration: InputDecoration(
                labelText: "Digite um email válido",
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Observer(
              builder: (_) {
                return Container(
                  width: double.infinity,
                  child: MaterialButton(
                      color: Colors.blue,
                      onPressed:
                          emailController.buttonEnabled ? _nextStep : null,
                      child: Text(
                        "Continuar",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      )),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
