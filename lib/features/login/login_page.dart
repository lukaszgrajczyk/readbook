import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:readbook/app/cubit/root_page_cubit.dart';

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
              Text('Login'),
              SizedBox(height: 20),
              EmailWidget(widget: widget),
              SizedBox(height: 20),
              PasswordWidget(widget: widget),
              SizedBox(height: 40),
              Text(errorMessage),
              SizedBox(height: 20),
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
                    final email = widget.emailController.text;
                    final password = widget.passwordController.text;
                    try {
                      await context
                          .read<RootPageCubit>()
                          .registerUser(email, password);
                    } catch (error) {
                      setState(
                        () {
                          errorMessage = error.toString();
                        },
                      );
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
                      setState(
                        () {
                          isCreatingAccount = false;
                        },
                      );
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

class EmailWidget extends StatelessWidget {
  const EmailWidget({
    super.key,
    required this.widget,
  });

  final LoginPage widget;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.emailController,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.email),
        hintText: 'name@example.com',
        labelText: 'Email',
        border: OutlineInputBorder(),
      ),
    );
  }
}

class PasswordWidget extends StatelessWidget {
  const PasswordWidget({
    super.key,
    required this.widget,
  });

  final LoginPage widget;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.passwordController,
      obscureText: true,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.lock_outline_rounded),
        hintText: 'password',
        labelText: 'Password',
        border: OutlineInputBorder(),
      ),
    );
  }
}



//  if (isCreatingAccount == false)
//                 ElevatedButton(
//                   onPressed: () async {
//                     try {
//                       await FirebaseAuth.instance.signInWithEmailAndPassword(
//                         email: widget.emailController.text,
//                         password: widget.passwordController.text,
//                       );
//                     } catch (error) {
//                       setState(() {
//                         errorMessage = error.toString();
//                       });
//                     }
//                   },
//                   child: Text(
//                     isCreatingAccount ? 'Zarejestruj' : 'Zaloguj',
//                   ),
//                 ),