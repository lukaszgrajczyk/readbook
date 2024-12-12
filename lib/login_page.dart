import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

final emailController = TextEditingController();
final passwordController = TextEditingController();

//  final _passwordController = TextEditingController();
class _LoginPageState extends State<LoginPage> {
  var isCreatingAccount = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(isCreatingAccount ? 'Zarejestruj' : 'Zaloguj'),
              SizedBox(height: 20),
              TextField(
                controller: emailController,
                onTap: () {},
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  hintText: 'name@example.com',
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock_outline_rounded),
                  hintText: 'password',
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 40),
              if (isCreatingAccount == false)
                ElevatedButton(
                  onPressed: () async {
                    await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: emailController.text,
                      password: passwordController.text,
                    ); //obsluga authentication
                  },
                  child: Text(isCreatingAccount ? 'Zarejestruj' : 'Zaloguj'),
                ),
              if (isCreatingAccount == true)
                ElevatedButton(
                  onPressed: () async {
                    await FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email: emailController.text,
                      password: passwordController.text,
                    ); //obsluga authentication
                  },
                  child: Text(isCreatingAccount ? 'Zarejestruj' : 'Zaloguj'),
                ),
              if (isCreatingAccount == false)
                TextButton(
                  onPressed: () {
                    {
                      setState(() {
                        isCreatingAccount = true;
                      });
                    }
                  },
                  child: Text('utwórz konto'),
                ),
              if (isCreatingAccount == true)
                TextButton(
                  onPressed: () {
                    {
                      setState(() {
                        isCreatingAccount = false;
                      });
                    }
                  },
                  child: Text('nie masz jeszcze konta?'),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
