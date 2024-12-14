import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({
    super.key,
  });

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var isCreatingAccount = false;
  var errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('login'),
              // Text(isCreatingAccount ? 'Zarejestruj' : 'Zaloguj'),
              SizedBox(height: 20),
              TextField(
                controller: widget.emailController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  hintText: 'name@example.com',
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: widget.passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock_outline_rounded),
                  hintText: 'password',
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 40),
              Text(errorMessage),
              SizedBox(height: 20),

              //Obsługa błędów do poprawy -zamieszać z ifami elsami i {} ...[]

              if (isCreatingAccount == false)
                ElevatedButton(
                  onPressed: () async {
                    try {
                      await FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: widget.emailController.text,
                        password: widget.passwordController.text,
                      );
                    } catch (error) {
                      setState(() {
                        errorMessage = error.toString();
                      });
                    }
                  },
                  child: Text(
                    isCreatingAccount ? 'Zarejestruj' : 'Zaloguj',
                  ),
                ),

              if (isCreatingAccount == true)
                ElevatedButton(
                  onPressed: () async {
                    try {
                      await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                        email: widget.emailController.text,
                        password: widget.passwordController.text,
                      );
                    } catch (error) {
                      setState(() {
                        errorMessage = error.toString();
                      });
                    }
                  },
                  child: Text(isCreatingAccount ? 'Zarejestruj' : 'Zaloguj'),
                ),

              if (isCreatingAccount == false)
                TextButton(
                  onPressed: () {
                    {
                      setState(
                        () {
                          isCreatingAccount = true;
                        },
                      );
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
