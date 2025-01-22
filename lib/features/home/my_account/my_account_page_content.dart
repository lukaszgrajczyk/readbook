import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:readbook/app/cubit/root_page_cubit.dart';

class MyAccount extends StatelessWidget {
  const MyAccount({super.key, required this.email});

  final String? email;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('jesteś zalogowany jako $email'),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              context.read<RootPageCubit>().signOut();
            },
            child: Text('wyloguj'),
          ),
        ],
      ),
    );
  }
}
