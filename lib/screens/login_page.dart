import 'package:devnexus/components/rounded_button.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
                tag: 'logo',
                child: SizedBox(
                  height: 200,
                  child: Image.asset('assets/logo.png'),
                )),
            const SizedBox(
              height: 48.0,
            ),
            TextField(
              textAlign: TextAlign.center,
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {},
            ),
            const SizedBox(
              height: 8.0,
            ),
            TextField(
              textAlign: TextAlign.center,
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              onChanged: (value) {},
            ),
            const SizedBox(
              height: 24.0,
            ),
            RoundedButton(
                color: Colors.lightBlue,
                onPressed: () {},
                buttonText: 'Log In'),
            RoundedButton(
                color: Colors.amber, onPressed: () {}, buttonText: 'Register'),
          ],
        ),
      ),
    );
  }
}
