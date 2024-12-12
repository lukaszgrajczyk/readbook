import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

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
                decoration: InputDecoration(
                  hintText: 'email',
                ),
              ),
              SizedBox(height: 20),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'password',
                ),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  //obsluga authentication
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
